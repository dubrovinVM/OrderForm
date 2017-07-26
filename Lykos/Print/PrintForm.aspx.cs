using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lykos.Handlers;
using System.Threading;

namespace Lykos.Print
{
    public partial class PrintForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request.QueryString["form_id"])) Response.Redirect("~/Error.aspx");
            int form_id = Int32.Parse(Request.QueryString["form_id"]);
            if (!LykosDB.IfFormExists(form_id)) Response.Redirect("~/Error.aspx");
            User user = Handlers.User.GetCurrentUserInfo();
            var user_id = user.user_id;
            var user_role = user.role;
            if (!LykosDB.IfFormBelongsToUser(form_id, user.user_id, user_role)) Response.Redirect("~/Error.aspx");
            FormInfo formInfo = Handlers.LykosDB.GetFormInfo(form_id);
            Label_author.Text = formInfo.operator_name;
            Label_formName.Text = formInfo.name;
            SqlDataSource_form.SelectCommand = string.Format("SELECT " +
                        "[product_name].name as [Product name], " +
                        "[pharmaceutical_form].name as [Pharmaceutical form], " +
                        "[strength].name as [Strength], " +
                        "[cis].name as [CIS], " +
                        "[country_impacted].name as [Country impacted], " +
                        "[product_code].name as [Product code], " +
                        "[marketing_authorithation_holder].name as [Marketing authorithation holder], " +
                        "[change_initiator].name as [Change initiator], " +
                        "[date_of_request] as [Date of request], " +
                        "[type_of_artwork].name as [Type of artwork], " +
                        "[type_of_change].name as [Type of change], " +
                        "[variation_type].name as [Variation type], " +
                        "CASE when inf.submission_date like \'0001-01-01\' " +
                        "THEN \'No\' ELSE \'Yes, \' + change_need_submit.name + \' \' + CAST(inf.submission_date as nvarchar) END AS [Does this change need to be submitted to regulatory authority before implementation?], " +
                        "CASE when inf.approve_date like \'0001-01-01\' " +
                        "THEN \'No\' ELSE \'Yes, \' + change_need_approve.name + \' \' + CAST(inf.approve_date as nvarchar) END AS [Does this change need to be approved by regulatory authority before implementation?], " +
                        "CASE when inf.packaging_matrials_dedline like \'0001-01-01\' " +
                        "THEN [packaging_matrials_period].name ELSE [packaging_matrials_period].name + \' \' +CAST(inf.packaging_matrials_dedline as nvarchar) END AS [How long can old packaging matrials still be used at manufacturing site after approval/notification?], " +
                        "CASE when inf.sell_out_dedline like \'0001-01-01\' " +
                        "THEN [sell_out_period].name ELSE [sell_out_period].name + \' \' +CAST(inf.sell_out_dedline as nvarchar) END AS [How long is the sell-out period of the imported finished product manufactured with old packaging after approval in the country?], " +
                        "[comments1] as Comments, " +
                        "[component_type].name as [Type of component (should be attach approved artwork)], " +
                        "[change_strategy].name as [Change strategy], " +
                        "[comments2] as Comments2, " +
                        "[implementation_date] as [Implementation Date] " +                        
                        "FROM [result].[forms_info] as inf " +
                        "LEFT OUTER JOIN product_name as [product_name] " +
                        "ON inf.[product_name] = [product_name].id " +
                        "LEFT OUTER JOIN pharmaceutical_form as [pharmaceutical_form] " +
                        "ON inf.[pharmaceutical_form] = [pharmaceutical_form].id " +
                        "LEFT OUTER JOIN strength as [strength] " +
                        "ON inf.[strength] = [strength].id " +
                        "LEFT OUTER JOIN product_code as [product_code] " +
                        "ON inf.[product_code] = [product_code].id " +
                        "LEFT OUTER JOIN marketing_authorithation_holder as [marketing_authorithation_holder] " +
                        "ON inf.[marketing_authorithation_holder] = [marketing_authorithation_holder].id " +
                        "LEFT OUTER JOIN country_impacted as [country_impacted] " +
                        "ON inf.[country_impacted] = [country_impacted].id " +
                        "LEFT OUTER JOIN change_initiator as [change_initiator] " +
                        "ON inf.[change_initiator] = [change_initiator].id " +
                        "LEFT OUTER JOIN type_of_artwork as [type_of_artwork] " +
                        "ON inf.[type_of_artwork] = [type_of_artwork].id " +
                        "LEFT OUTER JOIN type_of_change as [type_of_change] " +
                        "ON inf.[type_of_change] = [type_of_change].id " +
                        "LEFT OUTER JOIN variation_type as [variation_type] " +
                        "ON inf.[variation_type] = [variation_type].id " +
                        "LEFT OUTER JOIN change_need_submit as [change_need_submit] " +
                        "ON inf.[change_need_submit] = [change_need_submit].id " +
                        "LEFT OUTER JOIN change_need_approve as [change_need_approve] " +
                        "ON inf.[change_need_approve] = [change_need_approve].id " +
                        "LEFT OUTER JOIN packaging_matrials_period as [packaging_matrials_period] " +
                        "ON inf.[packaging_matrials_period] = [packaging_matrials_period].id " +
                        "LEFT OUTER JOIN sell_out_period as [sell_out_period] " +
                        "ON inf.[sell_out_period] = [sell_out_period].id " +
                        "LEFT OUTER JOIN component_type as [component_type] " +
                        "ON inf.[component_type] = [component_type].id " +
                        "LEFT OUTER JOIN change_strategy as [change_strategy] " +
                        "ON inf.[change_strategy] = [change_strategy].id " +
                        "LEFT OUTER JOIN result.forms as frm " +
                        "ON inf.[form_id] = frm.id " +
                        "LEFT OUTER JOIN dbo.users as usrs " +
                        "on frm.[operator_id] = usrs.id " +
                        "LEFT OUTER JOIN dbo.[form_status] as sts " +
                        "on frm.[status_id] = sts.id " +
                        "LEFT OUTER JOIN dbo.[user_role] as usr_rl " +
                        "on usr_rl.id = usrs.user_role_id " +
                        "LEFT OUTER JOIN info.cis as [cis] " +
                        "ON inf.[cis_id] = [cis].id " +
                        "WHERE [form_id] = {0}", form_id);
            DetailsView_form.DataSourceID = "SqlDataSource_form";
            DetailsView_form.DataBind();
            int rowsCount = DetailsView_form.Rows.Count;
            Label labelManufacturer = (Label)DetailsView_form.Rows[rowsCount-2].FindControl("Label_manufacturer");
            labelManufacturer.Text = LykosDB.GetManufactures(form_id.ToString());
            Label labelComponentType = (Label)DetailsView_form.Rows[rowsCount - 1].FindControl("Label_componenet_type");
            labelComponentType.Text = LykosDB.GetComponentTypes(form_id.ToString());
            try
            {
                ExportToExcel(formInfo.operator_name);
            }
            catch (ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                Response.Redirect("~/Error.aspx?msg=ExportToExcel:" + ex.Message);
            }
            

        }

        public void ExportToExcel(string formName)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/vnd.ms-excel";
            var fileName = string.Format("attachment;filename={0}_{1}.xls", formName, DateTime.Now.ToShortDateString());
            Response.AddHeader("content-disposition", fileName);
            Response.Charset = "";
            this.EnableViewState = false;
            System.IO.StringWriter sw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);
            DetailsView_form.RenderControl(htw);
            //Response.Write(formName);
            Response.Write(sw.ToString());
            Response.End();
            Response.Redirect("~/Default.aspx");
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Confirms that an HtmlForm control is rendered for the
            //specified ASP.NET server control at run time.
        }

        


    }
}
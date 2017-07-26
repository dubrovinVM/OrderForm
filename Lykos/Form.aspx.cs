using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Lykos
{
    public partial class Form : System.Web.UI.Page
    {
        public int operator_id, form_id;
        public string name, comments1, comments2;
        public int product_name, pharmaceutical_form, strength, product_code, manufacturer,
            marketing_authorithation_holder, country_impacted, change_initiator, type_of_artwork, type_of_change, variation_type,
            change_need_submit, change_need_approve, packaging_matrials_period, sell_out_period, component_type, change_strategy,
            cis_id;
        public DateTime date_of_request, implementation_date, submiss_date, approve_date, packaging_matrials_dedline, sell_out_dedline;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) FillControls();
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/js/jquery-1.7.2.min.js",

            });
        }

        protected void DropDownList_cis_SelectedIndexChanged(object sender, EventArgs e)
        {
            var cisId = Int32.Parse(DropDownList_cis.SelectedValue);
            switch (cisId)
            {
                case 1:
                case 2:
                    SqlDataSource_country_impacted.SelectCommand =
                        "SELECT [id], [all_cat_id], [name] FROM [country_impacted] WHERE cis=1 and name not like 'CIS' ORDER BY id DESC";
                    break;
                case 3:
                    SqlDataSource_country_impacted.SelectCommand =
                        string.Format("SELECT [id], [all_cat_id], [name] FROM [country_impacted] " +
                                      "WHERE name like 'Ukraine' OR name like 'Kazakhstan' OR name like 'Russia' order by name desc");
                    break;
                default:
                    break;
            }
            DropDownList_country_impacted.DataBind();
            FillControls();
        }

        protected void DropDownList_country_impacted_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillControls();
        }

        public void FillControls()
        {
            int cis_id = string.IsNullOrEmpty(DropDownList_cis.Text) ? 1 : Int32.Parse(DropDownList_cis.Text);
            int country_impacted = string.IsNullOrEmpty(DropDownList_country_impacted.SelectedValue) ? 11 : Int32.Parse(DropDownList_country_impacted.SelectedValue);
            switch (cis_id)
            {
                case 1:
                case 2:
                    SqlDataSource_product_code.SelectCommand = string.Format("SELECT [id], [all_cat_id], [name] FROM [product_code] " +
                                                                             "WHERE [country_id] like {0} OR [country_id] like '11' ORDER BY id DESC", country_impacted);
                    break;
                case 3:
                    SqlDataSource_product_code.SelectCommand = string.Format("SELECT [id], [all_cat_id], [name] FROM [product_code] " +
                                                                             "WHERE [country_id] like {0}", country_impacted);
                    break;
            }
            DropDownList_product_code.DataBind();
        }

        protected void CheckBox_needSubmit_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox_needSubmit.Checked)
            {
                DropDownList_change_need_submit.Visible = true;
                TextBox_submissDate.Visible = true;
                RequiredFieldValidator_submissDate.Enabled = true;
            }
        }

        protected void CheckBox_needApprove_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox_needApprove.Checked)
            {
                DropDownList_change_need_approve.Visible = true;
                TextBox_approveDate.Visible = true;
                RequiredFieldValidator_approveDate.Enabled = true;
            }

        }

        protected void DropDownList_packaging_matrials_period_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList_packaging_matrials_period.SelectedValue == "2")
            {
                TextBox_packaging_matrials_period.Visible = true;
                RequiredFieldValidator_packaging_matrials_period.Enabled = true;
            }
            else
            {
                TextBox_packaging_matrials_period.Visible = false;
                RequiredFieldValidator_packaging_matrials_period.Enabled = false;
            }
        }

        protected void DropDownList_sell_out_period_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList_sell_out_period.SelectedValue == "3")
            {
                TextBox_sell_out_period.Visible = true;
                RequiredFieldValidator_sell_out_period.Enabled = true;
            }
            else
            {
                TextBox_sell_out_period.Visible = false;
                RequiredFieldValidator_sell_out_period.Enabled = false;
            }
        }

        protected void Button_save_Click(object sender, EventArgs e)
        {
            HttpFileCollection attachments = Request.Files;
            string Y = "yyyy-MM-dd";
            try
            {
                Form form = new Lykos.Form
                {
                    name = TextBox_formName.Text,
                    comments1 = TextBox_comments.Text,
                    comments2 = TextBox_comments2.Text,
                    product_name = Int32.Parse(DropDownList_productName.SelectedValue),
                    pharmaceutical_form = Int32.Parse(DropDownList_pharmaceutical_form.SelectedValue),
                    strength = Int32.Parse(DropDownList_strength.SelectedValue),
                    product_code = Int32.Parse(DropDownList_product_code.SelectedValue),
                    marketing_authorithation_holder = Int32.Parse(DropDownList_marketing_authorithation_holder.SelectedValue),
                    country_impacted = Int32.Parse(DropDownList_country_impacted.SelectedValue),
                    change_initiator = Int32.Parse(DropDownList_change_initiator.SelectedValue),
                    type_of_artwork = Int32.Parse(DropDownList_type_of_artwork.SelectedValue),
                    type_of_change = Int32.Parse(DropDownList_type_of_change.SelectedValue),
                    variation_type = Int32.Parse(DropDownList_variation_type.SelectedValue),
                    packaging_matrials_period = Int32.Parse(DropDownList_packaging_matrials_period.SelectedValue),
                    sell_out_period = Int32.Parse(DropDownList_sell_out_period.SelectedValue),
                    //component_type = Int32.Parse(DropDownList_component_type.SelectedValue),
                    change_strategy = Int32.Parse(DropDownList_change_strategy.SelectedValue),
                    date_of_request = DateTime.Parse(TextBox_dateRequest.Text),
                    implementation_date = DateTime.Parse(TextBox_dateImplmnt.Text),
                    cis_id = Int32.Parse(DropDownList_cis.Text)
                };
                if (CheckBox_needSubmit.Checked)
                {
                    form.submiss_date = DateTime.Parse(TextBox_submissDate.Text);
                    form.change_need_submit = Int32.Parse(DropDownList_change_need_submit.SelectedValue);
                }
                if (CheckBox_needApprove.Checked)
                {
                    form.approve_date = DateTime.Parse(TextBox_approveDate.Text);
                    form.change_need_approve = Int32.Parse(DropDownList_change_need_approve.SelectedValue);
                }
                if (TextBox_packaging_matrials_period.Visible) form.packaging_matrials_dedline = DateTime.Parse(TextBox_packaging_matrials_period.Text);
                if (TextBox_sell_out_period.Visible) form.sell_out_dedline = DateTime.Parse(TextBox_sell_out_period.Text);

                var attchDir = Server.MapPath("myfiles");
                int formId = Handlers.LykosDB.SaveForm(form, CheckBoxList_manufacturer, attachments, attchDir); ;

                var postedFileName = string.Empty;

                if (CheckBox_leaflet.Checked)
                {
                        postedFileName = Path.GetFileName(FileUpload_leaflet.PostedFile.FileName);
                        Handlers.LykosDB.UploadComponentType(formId, 1, postedFileName);
                }
                if (CheckBox_carton.Checked)
                { 
                     postedFileName = FileUpload_carton.PostedFile.FileName;
                Handlers.LykosDB.UploadComponentType(formId, 2, postedFileName);
                }

                if (CheckBox_blister.Checked)
                {
                    postedFileName = FileUpload_blister.PostedFile.FileName;
                    Handlers.LykosDB.UploadComponentType(formId, 3, postedFileName);
                }

                if (CheckBox_tube.Checked)
                {
                    postedFileName = FileUpload_tube.PostedFile.FileName;
                    Handlers.LykosDB.UploadComponentType(formId, 4, postedFileName);
                }

                if (CheckBox_sachet.Checked)
                {
                   postedFileName = FileUpload_sachet.PostedFile.FileName;
                    Handlers.LykosDB.UploadComponentType(formId, 5, postedFileName);
                }

                if (CheckBox_label.Checked)
                {
                   postedFileName = FileUpload_label.PostedFile.FileName;
                    Handlers.LykosDB.UploadComponentType(formId, 6, postedFileName);
                }

                if (CheckBox_foil.Checked)
                {
                    postedFileName = FileUpload_foil.PostedFile.FileName;
                    Handlers.LykosDB.UploadComponentType(formId, 7, postedFileName);
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Error.aspx?msg=SaveForm:" + ex.Message.Replace("\n","").Replace("<br>", ""));
            }
            Response.Redirect("Default.aspx");
        }

        

    }

}
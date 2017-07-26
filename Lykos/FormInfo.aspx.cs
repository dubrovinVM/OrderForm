using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lykos.Handlers;
using System.Collections;
using System.IO;
using Ionic.Zip;

namespace Lykos
{
       //1	edit
       //2	saved
       //3	send_tosign
       //4	signed

    public partial class FormInfo : System.Web.UI.Page
    {
        public int operator_id, form_id;
        public string name, comments1, comments2, operator_name, operator_rank, form_status, user_comments;
        public string product_name, pharmaceutical_form, strength, product_code, marketing_authorithation_holder, 
            country_impacted, change_initiator, type_of_artwork, type_of_change, variation_type,
            change_need_submit, change_need_approve, packaging_matrials_period, sell_out_period, component_type, change_strategy,cis;
        public string date_of_request, implementation_date, submiss_date, approve_date, packaging_matrials_dedline, sell_out_dedline;
        public ArrayList manufacturer, attachments, component_types;



        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request.QueryString["id"])) Response.Redirect("Error.aspx");
            int id = Int32.Parse(Request.QueryString["id"]);
            if(!LykosDB.IfFormExists(id)) Response.Redirect("Error.aspx");
            User user = Handlers.User.GetCurrentUserInfo();
            var user_id = user.user_id;
            var user_role = user.role;
            if (!LykosDB.IfFormBelongsToUser(id, user.user_id, user_role)) Response.Redirect("Error.aspx");
            if (user_role.Equals("manager")) Button_sign.Visible = false;           

            FormInfo formInfo = Handlers.LykosDB.GetFormInfo(id);
            TextBox_formName.Text = formInfo.name;
            TextBox_comments1.Text = formInfo.comments1;
            TextBox_comments2.Text = formInfo.comments2;
            TextBox_productName.Text = formInfo.product_name;
            TextBox_pharmaceutical_form.Text = formInfo.pharmaceutical_form;
            TextBox_strength.Text = formInfo.strength;
            TextBox_product_code.Text = formInfo.product_code;
            TextBox_marketing_authorithation_holder.Text = formInfo.marketing_authorithation_holder;
            TextBox_country_impacted.Text = formInfo.country_impacted;
            TextBox_change_initiator.Text = formInfo.change_initiator;
            TextBox_type_of_artwork.Text = formInfo.type_of_artwork;
            TextBox_type_of_change.Text = formInfo.type_of_change;
            TextBox_variation_type.Text = formInfo.variation_type;
            TextBox_change_need_submit.Text = formInfo.change_need_submit;
            TextBox_change_need_approve.Text = formInfo.change_need_approve;
            TextBox_packaging_matrials_period.Text = formInfo.packaging_matrials_period;
            TextBox_sell_out_period.Text = formInfo.sell_out_period;
            //TextBox_component_type.Text = formInfo.component_type;
            TextBox_change_strategy.Text = formInfo.change_strategy;
            TextBox_dateRequest.Text = formInfo.date_of_request.Substring(0,10);
            TextBox_dateImplmnt.Text = formInfo.implementation_date.Substring(0, 10);
            TextBox_operator_name.Text = formInfo.operator_name;
            TextBox_operator_rank.Text = formInfo.user_comments;
            TextBox_form_status.Text = formInfo.form_status;
            TextBox_cis.Text = formInfo.cis;
            TextBox_submissDate.Text = formInfo.submiss_date.Substring(0, 10);
            TextBox_approveDate.Text = formInfo.approve_date.Substring(0, 10);
            TextBox_packaging_matrials_dedline.Text = formInfo.packaging_matrials_dedline.Substring(0, 10);
            TextBox_sell_out_dedline.Text = formInfo.sell_out_dedline.Substring(0, 10);
            if (!string.IsNullOrEmpty(formInfo.change_need_submit))
            {
                TextBox_submissDate.Visible = true;
                TextBox_change_need_submit.Visible = true;
                Label_need_submit.Text = "Yes";
            }
            if (!string.IsNullOrEmpty(formInfo.change_need_approve))
            {
                TextBox_approveDate.Visible = true;
                TextBox_change_need_approve.Visible = true;
                Label_need_approve.Text = "Yes";
            }
            if (formInfo.packaging_matrials_period.Contains("define deadline"))
                TextBox_packaging_matrials_dedline.Visible = true;
            if (formInfo.sell_out_period.Contains("define deadline"))
                TextBox_sell_out_dedline.Visible = true;

            if (formInfo.form_status.Equals("signed"))
            {
                Button_sign.Visible = false;
                Button_send.Visible = false;
            }
            if (formInfo.form_status.Equals("send_tosign"))
            {
                Button_send.Visible = false;
            }

            foreach (var item in formInfo.manufacturer)
            {
                CheckBoxList_manufacturer.Items.Add(item.ToString());
            }
            foreach (ListItem item in CheckBoxList_manufacturer.Items)
            {
                item.Selected = true;
            }
            foreach (var item in formInfo.component_types)
            {
                string componentTypeAttch = LykosDB.GetComponentTypeAttch(id, item.ToString());
                string url = string.IsNullOrEmpty(componentTypeAttch) ? "#" : string.Format("~/myfiles/{0}/{1}", id, componentTypeAttch) ;
                string text = string.IsNullOrEmpty(componentTypeAttch) ? " - no attached file" : " - " + componentTypeAttch;
                ListItem item0 = new ListItem($"{item}{text}", url);
                BulletedList_component_type.Items.Add(item0);
            }
            foreach (var item in formInfo.attachments)
            {
                BulletedList_attachements.Items.Add(item.ToString());
            }
        }

        protected void Button_print_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request.QueryString["id"])) Response.Redirect("Error.aspx");
            int form_id = Int32.Parse(Request.QueryString["id"]);
            Response.Redirect("~/Print/PrintForm.aspx?form_id="+form_id);
        }

        protected void Button_send_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request.QueryString["id"])) return;
            int form_id = Int32.Parse(Request.QueryString["id"]);
            LykosDB.UpdateFormStatus(form_id, 3);
            try
            {
                User user = Handlers.User.GetCurrentUserInfo();
                Handlers.User.SendMail(user.fullName);
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Error.aspx?msg=SendMail:" + ex.Message.Replace("\n", "").Replace("<br>", ""));
            }
            Response.Redirect("Default.aspx");
        }

        protected void Button_sign_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request.QueryString["id"])) return;
            int form_id = Int32.Parse(Request.QueryString["id"]);
            LykosDB.UpdateFormStatus(form_id, 4);
            Response.Redirect("Default.aspx");
        }

        protected void Button_downloadAttachments_Click(object sender, EventArgs e)
        {
            int id = Int32.Parse(Request.QueryString["id"]);
            using (ZipFile zip = new ZipFile())
            {
                zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                //zip.AddDirectoryByName("Files");
                var attchDir = Server.MapPath("myfiles") + "\\" + id + "\\";
                var files = Directory.GetFiles(attchDir);
                foreach (var file in files)
                {
                    zip.AddFile(file, "");
                }
                Response.Clear();
                Response.BufferOutput = false;
                string zipName = String.Format("Form_{0}.zip", DateTime.Now.ToString("yyyyMMdd_HHmm"));
                Response.ContentType = "application/zip";
                Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
                zip.Save(Response.OutputStream);
                Response.End();
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;
using Lykos.Handlers;

namespace Lykos
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = Handlers.User.GetCurrentUserInfo();
            HiddenField_operator_role.Value = user.role;
            HiddenField_operator_id.Value = user.user_id.ToString();
        }

        protected void GridView_forms_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_forms.PageIndex = e.NewPageIndex;
            BindData(GridView_forms);
        }

        public static void BindData(GridView GridView_forms)
        {
            //var main = "SqlDataSource_form";
            //var filter = "WHERE frms.operator_id LIKE '{0}' ORDER BY frms.[id] DESC";
            //SqlDataSource_form.SelectCommand = "";
            GridView_forms.DataBind();
        }

        protected void Button_refresh_Click(object sender, EventArgs e)
        {
            BindData(GridView_forms);
        }

        public void GridView_forms_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // If multiple buttons are used in a GridView control, use the
            // CommandName property to determine which button was clicked.
            if (e.CommandName == "DeleteItem")
            {
                var id = Int32.Parse(e.CommandArgument.ToString());
                LykosDB.DeleteForm(id);
                //delete attachments
                var di = new DirectoryInfo(Server.MapPath("myfiles") + "\\" + id + "\\");
                if (di.Exists) di.Delete(true);
                BindData(GridView_forms);
                
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var form_status =  GridView_forms.DataKeys[e.Row.RowIndex]["status"].ToString();
                if (form_status == "signed")
                {
                    e.Row.Cells[8].Enabled = false;
                    e.Row.BackColor = Color.LightGreen;
                }
                if (form_status == "send_tosign")
                {
                    e.Row.BackColor = Color.LightPink;
                }
            }
        }

    }
}
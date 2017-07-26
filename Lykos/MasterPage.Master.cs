using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lykos.Handlers;
using System.Web.Security;

namespace Lykos
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(HttpContext.Current.User.Identity.Name))
                {
                    User user = User.GetCurrentUserInfo();
                    //FormsAuthentication.SignOut();
                    Label_userName.Text = string.Format("{0}", user.fullName);
                    Label_userRole.Text = string.Format("{0}", user.role);
                }                
            }
            catch (Exception)
            {
            }
        }

        protected void Button_logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Account/Login.aspx");
        }
    }
}
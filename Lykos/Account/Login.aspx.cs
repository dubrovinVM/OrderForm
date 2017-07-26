using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lykos.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Logon_Click(object sender, EventArgs e)
        {
            //Page.Validate();
            if (!Page.IsValid) return;

            if (FormsAuthentication.Authenticate(TextBox_login.Text, TextBox_password.Text))
            {
                // Создать билет, добавить cookie-набор к ответу и 
                // перенаправить на исходную запрошенную страницу
                //Handlers.Logger.WriteLog(UsernameText.Text, "вхід у систему");
                FormsAuthentication.RedirectFromLoginPage(TextBox_login.Text, false);

            }
            else
            {
                // Имя и пароль пользователя неправильны
                //Handlers.Logger.WriteLog(UsernameText.Text + " + " + PasswordText.Text, "неправильне введення логіну або паролю");
                Label_msg.Text = "Invalid credentials. Please try again!";
            }
        }
    }
}
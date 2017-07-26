<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Lykos.Account.Login" %>
<%@ Import Namespace="System.Web.Security" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_pageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_mainContent" runat="server">
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
        text-align:left;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
    <script runat="server">
//void Logon_Click(object sender, EventArgs e)
//{
//    if ((TextBox_login.Text == "jchen@contoso.com") &&
//            (TextBox_password.Text == "37Yj*99Ps"))
//    {
//        FormsAuthentication.RedirectFromLoginPage
//           (TextBox_login.Text, Persist.Checked);
//    }
//    else
//    {
//        Label_msg.Text = "Invalid credentials. Please try again.";
//    }
//}
    </script>

    <div class="container">
       <%-- <form runat="server">--%>
            <asp:Panel runat="server" class="form-signin">
                <h2 class="form-signin-heading">Please sign in</h2>
                <asp:TextBox ID="TextBox_login" runat="server" class="input-block-level" placeholder="login" required="true"/>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
            ControlToValidate="UserEmail"
            Display="Dynamic" 
            ErrorMessage="Cannot be empty." 
            runat="server" />--%>
                <asp:TextBox ID="TextBox_password" runat="server" class="input-block-level" placeholder="password" type="password" required="true" />
                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
            ControlToValidate="UserPass"
            ErrorMessage="Cannot be empty." 
            runat="server" />--%>
          Remember me?&nbsp;&nbsp;<asp:CheckBox ID="Persist" runat="server" />&nbsp;&nbsp;
          <asp:Button ID="Logon" OnClick="Logon_Click" Text="Log On" runat="server" class="btn btn-large btn-primary" />
                <asp:Label ID="Label_msg" ForeColor="red" runat="server" />
            </asp:Panel>
       <%-- </form>--%>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Lykos.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_pageTitle" runat="server">
    Error! <br />Something went wrong!
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_mainContent" runat="server">
    <asp:Label ForeColor="red" id="label_error" runat="server" text=""></asp:Label>
</asp:Content>

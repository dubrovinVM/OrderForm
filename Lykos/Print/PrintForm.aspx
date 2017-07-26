<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintForm.aspx.cs" Inherits="Lykos.Print.PrintForm" %>
<%@ Import Namespace="Lykos.Handlers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        .padding_left15{
            padding-left:15px;
        }
    </style>
</head>
<body>
    
    <div style="width: 100%; text-align: center">
        <h1>Printing Form
                <asp:Label ID="Label_formName" runat="server" /></h1>
        <h2>Author:
                <asp:Label ID="Label_author" runat="server" /></h2>
        <hr/>
        <form id="form1" runat="server">
            <asp:DetailsView ID="DetailsView_form" runat="server" HorizontalAlign="Center" FieldHeaderStyle-Font-Bold="true" 
                RowStyle-HorizontalAlign="Left" HeaderStyle-Width="50%" RowStyle-VerticalAlign="Middle" FieldHeaderStyle-Wrap="true"
                DataSourceID="SqlDataSource_form" 
                HeaderStyle-CssClass="padding_left15" RowStyle-CssClass="padding_left15" ForeColor="black" BackColor="Snow" BorderColor="black">
                <Fields>
                <asp:TemplateField InsertVisible="false" HeaderText="Manutactures">
                    <ItemTemplate>
                        <asp:Label ID="Label_manufacturer" runat="server" ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                    <asp:TemplateField InsertVisible="false" HeaderText="Type of component">
                        <ItemTemplate>
                            <asp:Label ID="Label_componenet_type" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource_form" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>">
            </asp:SqlDataSource>
        </form>
    </div>
    
</body>
</html>

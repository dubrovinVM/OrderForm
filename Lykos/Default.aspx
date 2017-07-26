<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lykos.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_pageTitle" runat="server">
    All Forms
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_mainContent" runat="server">
    <script>
        $(window).load(function(){   
            document.getElementById("header_default").className = 'active';
});
      </script>
    <div>
        <asp:GridView ID="GridView_forms" AutoGenerateColumns="false" runat="server" CssClass="mydatagrid" 
            PagerStyle-CssClass="mydatagrid_pager" HeaderStyle-CssClass = "mydatagrid_header" RowStyle-CssClass="mydatagrid_rows" 
            AllowPaging="True" PageSize="50" OnPageIndexChanging="GridView_forms_PageIndexChanging" 
            AllowSorting="true" Width="100%" DataSourceID="SqlDataSource_form" 
            OnRowCommand ="GridView_forms_RowCommand"
            OnRowDataBound = "OnRowDataBound"
            datakeynames="operator_id, id, status" >
            <Columns>
                <asp:TemplateField HeaderText="Number">
                    <HeaderStyle Width="80px" HorizontalAlign="Center" />
                    <ItemTemplate>    
                        <%# Convert.ToString( Container.DataItemIndex + 1 ) %>                         
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                <asp:BoundField DataField="fullName" HeaderText="Author" SortExpression="fullName"/>
                <asp:BoundField DataField="name" HeaderText="Form Name" SortExpression="name"/>
                <asp:BoundField DataField="saved_date" HeaderText="Date save" SortExpression="saved_date"/>
                <asp:BoundField DataField="send_date" HeaderText="Date send to sign" SortExpression="send_date"/>
                <asp:BoundField DataField="saved_date" HeaderText="Date signed" SortExpression="saved_date"/>
                <asp:HyperLinkField HeaderText="Links" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/FormInfo.aspx?id={0}" Text="More info" ControlStyle-ForeColor="Blue" target="_blank" runat="server"/>
                <asp:TemplateField HeaderText="Delete form" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                      <asp:ImageButton Height="25" ID="btnDelete" runat="server" ImageUrl="/img/delete.png" 
                          CommandName='DeleteItem' CommandArgument = '<%# Eval("id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
              </Columns>
        </asp:GridView>
        <asp:HiddenField ID="HiddenField_operator_id" runat="server" />
        <asp:HiddenField ID="HiddenField_operator_role" runat="server" />

        <hr />

        <asp:Button  Width="150" runat="server" ID="Button_refresh" CssClass="btn-primary" Text="Refresh" OnClick="Button_refresh_Click" />

<%--        <asp:SqlDataSource ID="SqlDataSource_form" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>" 
            SelectCommand="SELECT sts.category_name as status, frms.id as id, usrs.fullName, usrs.comment, frms.[operator_id], 
            frms.[name], frms.[saved_date], frms.[send_date], frms.[signed_date] FROM [result].[forms] as frms
            LEFT OUTER JOIN dbo.users as usrs 
            on frms.[operator_id] = usrs.id
            LEFT OUTER JOIN dbo.[form_status] as sts 
            on frms.[status_id] = sts.id">
            <FilterParameters>
                 <asp:ControlParameter Name="operator_id" ControlID="HiddenField_operator_id" PropertyName="Value" />
            </FilterParameters>
        </asp:SqlDataSource>--%>

        <asp:SqlDataSource ID="SqlDataSource_form" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
            SelectCommand="fillGridView_forms" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter Name="operator_id" ControlID="HiddenField_operator_id" PropertyName="Value" DefaultValue="" ConvertEmptyStringToNull="false" />
                <asp:ControlParameter Name="operator_role" ControlID="HiddenField_operator_role" PropertyName="Value" DefaultValue="" ConvertEmptyStringToNull="false" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>


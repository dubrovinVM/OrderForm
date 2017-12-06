<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="Lykos.Form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_pageTitle" runat="server">
    Packaging Request Form
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_mainContent" runat="server">
        <script>
        $(window).load(function(){   
            document.getElementById("header_form").className = 'active';
});
      </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form_chng_rqst_info">
        <h2>Change request information</h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <table style="width: 100%; text-align: left" class="table_forms">
            <tr>
                <td>
                    <asp:Label ID="Label_formName" CssClass="control-labels" runat="server" Text="Form Name"></asp:Label>
                </td>
                <td>
                    <span>
                            <asp:TextBox class="form-controls" style="display: initial !important" ID="TextBox_formName" runat="server"></asp:TextBox>
                        </span>
                        <span style="width: 50%; vertical-align: middle; height: 100%; padding: 0 0 0 10px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_formName"  runat="server" 
                             ErrorMessage="*" ForeColor="red" ControlToValidate="TextBox_formName" Font-Size="X-Large"></asp:RequiredFieldValidator>
                        </span>
                  
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Label ID="Label_cis" class="control-labels" runat="server" Text="CIS"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList class="form-controls" ID="DropDownList_cis" runat="server" 
                                      AutoPostBack="true"
                                      DataSourceID="SqlDataSource_cis" DataTextField="name" DataValueField="id" 
                                      OnSelectedIndexChanged="DropDownList_cis_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label_country_impacted" class="control-labels" runat="server" Text="Country Impacted"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList class="form-controls" ID="DropDownList_country_impacted" runat="server" 
                                      AutoPostBack="true"
                                      DataSourceID="SqlDataSource_country_impacted" DataTextField="name" DataValueField="id" 
                                      OnSelectedIndexChanged="DropDownList_country_impacted_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label_productCode" class="control-labels" runat="server" Text="Product code"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList class="form-controls" ID="DropDownList_product_code" runat="server" 
                        DataSourceID="SqlDataSource_product_code" DataTextField="name" DataValueField="id" 
                         AutoPostBack="True"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label_productName" CssClass="control-labels" runat="server" Text="Product Name"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList CssClass="form-controls" ID="DropDownList_productName" runat="server" DataSourceID="SqlDataSource_product_name" DataTextField="name" DataValueField="id"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label_pharmaceutical_form" CssClass="control-labels" runat="server" Text="Pharmaceutical form"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList CssClass="form-controls" ID="DropDownList_pharmaceutical_form" DataSourceID="SqlDataSource_pharmaceutical_form" DataTextField="name" DataValueField="id" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" CssClass="control-labels" runat="server" Text="Strength"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList CssClass="form-controls" ID="DropDownList_strength" runat="server" DataSourceID="SqlDataSource_strength" DataTextField="name" DataValueField="id"></asp:DropDownList>
                </td>
            </tr>
            <tr style="vertical-align:top">
                <td>
                    <asp:Label ID="Label5"  class="control-labels" runat="server" Text="Manufacturer"></asp:Label>
                </td>
                <td>
                    <asp:CheckBoxList  CssClass="checkbox" ID="CheckBoxList_manufacturer" runat="server" 
                        DataSourceID="SqlDataSource_manufacturer" DataTextField="name" DataValueField="id">
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" class="control-labels" runat="server" Text="Marketing Authorithation Holder"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList class="form-controls" ID="DropDownList_marketing_authorithation_holder" runat="server" DataSourceID="SqlDataSource_marketing_authorithation_holder" DataTextField="name" DataValueField="id"></asp:DropDownList>
                </td>
            </tr>            
            <tr>
                <td>
                    <asp:Label ID="Label2" class="control-labels" runat="server" Text="Change initiator"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList class="form-controls" ID="DropDownList_change_initiator" runat="server" DataSourceID="SqlDataSource_change_initiator" DataTextField="name" DataValueField="id"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" class="control-labels" runat="server" Text="Date of request"></asp:Label>
                </td>
                <td>
                    <span>
                        <asp:TextBox type="date" class="form-controls tb_date" style="display: initial !important" runat="server" ID="TextBox_dateRequest" /></span>
                    <span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Font-Size="X-Large"
                            ErrorMessage="*" ForeColor="red" ControlToValidate="TextBox_dateRequest"></asp:RequiredFieldValidator>
                    </span>
                </td>
            </tr>
        </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div class="form_chng_rqst_info">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
        <h2>Description of the change</h2>
        <table style="width: 100%; text-align: left" class="table_forms">
            <tr>
                <td>
                    <asp:Label ID="Label9" class="control-labels" runat="server" Text="Type of artwork"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList class="form-controls" ID="DropDownList_type_of_artwork" runat="server" DataSourceID="SqlDataSource_type_of_artwork" DataTextField="name" DataValueField="id"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label10" class="control-labels" runat="server" Text="Type of change"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList class="form-controls" ID="DropDownList_type_of_change" runat="server" DataSourceID="SqlDataSource_type_of_change" DataTextField="name" DataValueField="id"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" class="control-labels" runat="server" Text="Variation type"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList class="form-controls" ID="DropDownList_variation_type" runat="server" DataSourceID="SqlDataSource_variation_type" DataTextField="name" DataValueField="id"></asp:DropDownList>
                </td>
                </tr>
            <tr>
                    <td>
                        <asp:Label ID="Label12" class="control-labels" runat="server" Text="Does this change need to be submitted to regulatory authority before implementation?"></asp:Label>
                    </td>
                    <td>
                        <span>
                        <asp:CheckBox AutoPostBack="True" style="margin-left: 15px;" runat="server" ID="CheckBox_needSubmit" OnCheckedChanged="CheckBox_needSubmit_CheckedChanged" />
                        <asp:DropDownList Visible="False" class="form-controls" style="display: initial !important" ID="DropDownList_change_need_submit" runat="server" DataSourceID="SqlDataSource_change_need_submit" DataTextField="name" DataValueField="id"></asp:DropDownList>
                        <asp:TextBox Visible="False" type="date" class="form-controls tb_date" style="width: 40%; display: initial !important" runat="server" ID="TextBox_submissDate"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_submissDate" runat="server" Font-Size="X-Large" Enabled="False"
                                                        ErrorMessage="*" ForeColor="red" ControlToValidate="TextBox_submissDate"></asp:RequiredFieldValidator>
                        </span>
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label_needApprove" class="control-labels" runat="server" Text="Does this change need to be approved by regulatory authority before implementation?"></asp:Label>
                </td>
                <td>
                    <span>
                        <asp:CheckBox AutoPostBack="True" style="margin-left: 15px;" runat="server" ID="CheckBox_needApprove" OnCheckedChanged="CheckBox_needApprove_CheckedChanged" />
                        <asp:DropDownList Visible="False" class="form-controls" style="display: initial !important" ID="DropDownList_change_need_approve" runat="server" DataSourceID="SqlDataSource_change_need_approve" DataTextField="name" DataValueField="id"></asp:DropDownList>
                        <asp:TextBox Visible="False" type="date" class="form-controls tb_date" style="width: 40%; display: initial !important" runat="server" ID="TextBox_approveDate"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_approveDate" runat="server" Font-Size="X-Large" Enabled="False"
                                                    ErrorMessage="*" ForeColor="red" ControlToValidate="TextBox_approveDate"></asp:RequiredFieldValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label14" class="control-labels" runat="server" Text="How long can old packaging matrials still be used at manufacturing site after approval/notification?"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList AutoPostBack="True" class="form-controls" ID="DropDownList_packaging_matrials_period" runat="server" style="display: initial !important" DataSourceID="SqlDataSource_packaging_matrials_period" DataTextField="name" DataValueField="id" 
                                      OnSelectedIndexChanged="DropDownList_packaging_matrials_period_SelectedIndexChanged"></asp:DropDownList>
                    <asp:TextBox ID="TextBox_packaging_matrials_period" Visible="False" type="date" class="form-controls tb_date" style="width: 40%; display: initial !important" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_packaging_matrials_period" runat="server" Font-Size="X-Large" Enabled="False"
                                                ErrorMessage="*" ForeColor="red" ControlToValidate="TextBox_packaging_matrials_period"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label15" class="control-labels" runat="server" Text="How long is the sell-out period of the imported finished product manufactured with old packaging after approval in the country"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList AutoPostBack="True" class="form-controls" style="display: initial !important" ID="DropDownList_sell_out_period" runat="server" DataSourceID="SqlDataSource_sell_out_period" DataTextField="name" DataValueField="id" OnSelectedIndexChanged="DropDownList_sell_out_period_SelectedIndexChanged"></asp:DropDownList>
                    <asp:TextBox ID="TextBox_sell_out_period" Visible="False" type="date" class="form-controls tb_date" style="width: 40%; display: initial !important" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_sell_out_period" runat="server" Font-Size="X-Large" Enabled="False"
                                                ErrorMessage="*" ForeColor="red" ControlToValidate="TextBox_sell_out_period"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Label ID="Label16" class="control-labels" runat="server" Text="Comments"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox_comments" class="form-controls" runat="server" Width="250" Rows="3" TextMode="MultiLine" />
                </td>
            </tr>
        </table>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    
     <div class="form_chng_rqst_info">
        <h2>Packaging component(s)s to be change</h2>
        <table style="width: 100%; text-align: left" class="table_forms">
            <tr>
                <td>
                    <asp:Label ID="Label17" class="control-labels" runat="server" Text="Type of component (should be attach approved artwork)"></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox_leaflet" CssClass="ckbx" Text="leaflet" runat="server" style="display: inline !important" /> 
                    <asp:FileUpload ID="FileUpload_leaflet" class="form-controls" runat="server" style="display: inline !important"/>
                    <br />
                    <asp:CheckBox ID="CheckBox_carton" CssClass="ckbx" Text="carton" runat="server" style="display: inline !important" /> 
                    <asp:FileUpload ID="FileUpload_carton" class="form-controls" runat="server" style="display: inline !important"/>
                    <br />
                    <asp:CheckBox ID="CheckBox_blister" CssClass="ckbx" Text="blister" runat="server" style="display: inline !important" /> 
                    <asp:FileUpload ID="FileUpload_blister" class="form-controls" runat="server" style="display: inline !important"/>
                    <br />
                    <!--<asp:CheckBox ID="CheckBox_caster" CssClass="ckbx" Text="caster" runat="server" style="display: inline !important" /> 
                    <asp:FileUpload ID="FileUpload_caster" class="form-controls" runat="server" style="display: inline !important"/>
                    <br />    -->
                    <asp:CheckBox ID="CheckBox_tube" CssClass="ckbx" Text="tube" runat="server" style="display: inline !important" /> 
                    <asp:FileUpload ID="FileUpload_tube" class="form-controls" runat="server" style="display: inline !important"/>
                    <br />
                    <asp:CheckBox ID="CheckBox_sachet" CssClass="ckbx" Text="sachet" runat="server" style="display: inline !important" /> 
                    <asp:FileUpload ID="FileUpload_sachet" class="form-controls" runat="server" style="display: inline !important"/>
                    <br />
                    <asp:CheckBox ID="CheckBox_label" CssClass="ckbx" Text="label" runat="server" style="display: inline !important" /> 
                    <asp:FileUpload ID="FileUpload_label" class="form-controls" runat="server" style="display: inline !important"/>
                    <br />
                    <asp:CheckBox ID="CheckBox_foil" CssClass="ckbx" Text="foil" runat="server" style="display: inline !important" /> 
                    <asp:FileUpload ID="FileUpload_foil" class="form-controls" runat="server" style="display: inline !important"/>
                 
                 </td>
            </tr>
        </table>
    </div>

     <div class="form_chng_rqst_info">
        <h2>Change's implementation strategy</h2>
        <table style="width: 100%; text-align: left" class="table_forms">
            <tr>
                <td style="width: 990px">
                    <asp:Label ID="Label18" class="control-labels" runat="server" Text="Change strategy"></asp:Label>
                </td>
                <td>
                   <asp:DropDownList class="form-controls" ID="DropDownList_change_strategy" runat="server" DataSourceID="SqlDataSource_change_strategy" DataTextField="name" DataValueField="id"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 990px">
                    <asp:Label ID="Label19" CssClass="control-labels" runat="server" Text="Implementation Date"></asp:Label>
                </td>
                <td>
                    <span>
                        <asp:TextBox type="date" class="form-controls tb_date" style="display: initial !important" runat="server" ID="TextBox_dateImplmnt"></asp:TextBox></span>
                    <span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="red" Font-Size="X-Large"
                            ControlToValidate="TextBox_dateImplmnt"></asp:RequiredFieldValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="width: 990px">
                    <asp:Label ID="Label20" CssClass="control-labels" runat="server" Text="Comments"></asp:Label>
                </td>
                <td>
                   <asp:TextBox class="form-controls" ID="TextBox_comments2" Width="250" Rows="3" TextMode="MultiLine" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <%--<div class="form_chng_rqst_info">
        <h2>Attachments</h2>
        <table style="width: 100%; text-align: left" class="table_forms">
            <tr>
                <td style="width: 990px">
                    <asp:Label ID="Label1" CssClass="control-labels" runat="server" Text="Attachment 1"></asp:Label>
                </td>
                <td style="width: 990px">
                    <asp:FileUpload ID="FileUpload1" class="form-controls" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 990px">
                    <asp:Label ID="Label4" CssClass="control-labels" runat="server" Text="Attachment 2"></asp:Label>
                </td>
                <td style="width: 990px">
                    <asp:FileUpload ID="FileUpload2" class="form-controls" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 990px">
                    <asp:Label ID="Label7" CssClass="control-labels" runat="server" Text="Attachment 3"></asp:Label>
                </td>
                <td style="width: 990px">
                    <asp:FileUpload ID="FileUpload3" class="form-controls" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 990px">
                    <asp:Label ID="Label21" CssClass="control-labels" runat="server" Text="Attachment 4"></asp:Label>
                </td>
                <td style="width: 990px">
                    <asp:FileUpload ID="FileUpload4" class="form-controls" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 990px">
                    <asp:Label ID="Label22" CssClass="control-labels" runat="server" Text="Attachment 5"></asp:Label>
                </td>
                <td style="width: 990px">
                    <asp:FileUpload ID="FileUpload5" class="form-controls" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 990px">
                    <asp:Label ID="Label23" CssClass="control-labels" runat="server" Text="Attachment 6"></asp:Label>
                </td>
                <td style="width: 990px">
                    <asp:FileUpload ID="FileUpload6" class="form-controls" runat="server" />
                </td>
            </tr>
        </table>
    </div>--%>
    <br />
    <%--<asp:Button Width="150"  runat="server" ID="Button_send" CssClass="btn-primary" Text="Send to sign" OnClick="Button_send_Click" />--%>
    &nbsp;
    <asp:Button  Width="150" runat="server" ID="Button_save" CssClass="btn-primary" Text="Save" OnClick="Button_save_Click" />
    &nbsp;<br/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="Fill Form Name!" ForeColor="red" ControlToValidate="TextBox_formName"></asp:RequiredFieldValidator>
    <%--<asp:Button  Width="150" runat="server" ID="Button_print" CssClass="btn-primary" Text="Print" />--%>
    <br/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="Choose Date of request" ForeColor="red" ControlToValidate="TextBox_dateRequest"></asp:RequiredFieldValidator>
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ErrorMessage="Choose implement. date" ForeColor="red" ControlToValidate="TextBox_dateImplmnt"></asp:RequiredFieldValidator>
    <br />
    <asp:Label runat="server" ID="Label_result"></asp:Label>
    <br />
    <br />
    <br />





    <asp:SqlDataSource ID="SqlDataSource_product_name" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [product_name]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_pharmaceutical_form" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [pharmaceutical_form]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_strength" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [strength]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource_cis" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [name] FROM [info].[cis]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource_country_impacted" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [country_impacted] WHERE cis=1 and name not like 'CIS' ORDER BY id DESC">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource_product_code" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM product_code WHERE country_id=11 order by name">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList_country_impacted" Name="country_id" 
                PropertyName="SelectedValue" Type="String" DefaultValue="0" />
        </SelectParameters>
    </asp:SqlDataSource>



    <asp:SqlDataSource ID="SqlDataSource_manufacturer" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [manufacturer]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_marketing_authorithation_holder" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [marketing_authorithation_holder]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource_change_initiator" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [change_initiator]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource_type_of_artwork" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [type_of_artwork]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_type_of_change" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [type_of_change]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_variation_type" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [variation_type]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_change_need_submit" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [change_need_submit]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_change_need_approve" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [change_need_approve]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_sell_out_period" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [sell_out_period]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_packaging_matrials_period" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [packaging_matrials_period]"></asp:SqlDataSource>
    
<asp:SqlDataSource ID="SqlDataSource_component_type" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [component_type]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource_change_strategy" runat="server" ConnectionString="<%$ ConnectionStrings:lykosConnectionString %>"
        SelectCommand="SELECT [id], [all_cat_id], [name] FROM [change_strategy]"></asp:SqlDataSource>
  
   

</asp:Content>

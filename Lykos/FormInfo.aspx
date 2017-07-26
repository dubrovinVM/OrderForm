<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormInfo.aspx.cs" Inherits="Lykos.FormInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_pageTitle" runat="server">
    Packaging Request Form
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_mainContent" runat="server">
    <div class="form_chng_rqst_info">
        <h2>General information</h2>
        <table style="width: 100%; text-align: left" class="table_forms">
            <tr>
                <td>
                    <asp:Label ID="Label1" CssClass="control-labels" runat="server" Text="Made by"></asp:Label>
                </td>
                <td>
                    <asp:TextBox CssClass="form-controls" ID="TextBox_operator_name" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label22" CssClass="control-labels" runat="server" Text="Rank"></asp:Label>
                </td>
                <td>
                    <asp:TextBox CssClass="form-controls" ID="TextBox_operator_rank" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label23" CssClass="control-labels" runat="server" Text="Form status"></asp:Label>
                </td>
                <td>
                    <asp:TextBox CssClass="form-controls" ID="TextBox_form_status" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label_formName" CssClass="control-labels" runat="server" Text="Form Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox CssClass="form-controls" ID="TextBox_formName" runat="server"></asp:TextBox>
                </td>
            </tr>
            </table>
        <h2>Change request information</h2>
            <table style="width: 100%; text-align: left" class="table_forms">
            <tr>
                <td>
                    <asp:Label ID="Label21" CssClass="control-labels" runat="server" Text="Product Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox CssClass="form-controls" ID="TextBox_productName" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label_pharmaceutical_form" CssClass="control-labels" runat="server" Text="Pharmaceutical form"></asp:Label>
                </td>
                <td>
                    <asp:TextBox CssClass="form-controls" ID="TextBox_pharmaceutical_form"  runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" CssClass="control-labels" runat="server" Text="Strength"></asp:Label>
                </td>
                <td>
                    <asp:TextBox CssClass="form-controls" ID="TextBox_strength" runat="server" ></asp:TextBox>
                </td>
            </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label25" class="control-labels" runat="server" Text="CIS"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox class="form-controls" ID="TextBox_cis" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" class="control-labels" runat="server" Text="Country Impacted"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox class="form-controls" ID="TextBox_country_impacted" runat="server" ></asp:TextBox>
                    </td>
                </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" class="control-labels" runat="server" Text="Product code"></asp:Label>
                </td>
                <td>
                    <asp:TextBox class="form-controls" ID="TextBox_product_code" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" class="control-labels" runat="server" Text="Manufacturer"></asp:Label>
                </td>
                <td>
                    <asp:CheckBoxList  CssClass="checkbox" ID="CheckBoxList_manufacturer" runat="server" >
                    </asp:CheckBoxList>
                   
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" class="control-labels" runat="server" Text="Marketing Authorithation Holder"></asp:Label>
                </td>
                <td>
                    <asp:TextBox class="form-controls" ID="TextBox_marketing_authorithation_holder" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" class="control-labels" runat="server" Text="Change initiator"></asp:Label>
                </td>
                <td>
                    <asp:TextBox class="form-controls" ID="TextBox_change_initiator" runat="server"  ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" class="control-labels" runat="server" Text="Date of request"></asp:Label>
                </td>
                <td>
                      <asp:TextBox class="form-controls tb_date" runat="server" ID="TextBox_dateRequest" />
                </td>
            </tr>
        </table>
    </div>

    <div class="form_chng_rqst_info">
        <h2>Description of the change</h2>
        <table style="width: 100%; text-align: left" class="table_forms">
            <tr>
                <td>
                    <asp:Label ID="Label9" class="control-labels" runat="server" Text="Type of artwork"></asp:Label>
                </td>
                <td>
                    <asp:TextBox class="form-controls" ID="TextBox_type_of_artwork" runat="server"  ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label10" class="control-labels" runat="server" Text="Type of change"></asp:Label>
                </td>
                <td>
                    <asp:TextBox class="form-controls" ID="TextBox_type_of_change" runat="server"  ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" class="control-labels" runat="server" Text="Variation type"></asp:Label>
                </td>
                <td>
                    <asp:TextBox class="form-controls" ID="TextBox_variation_type" runat="server"  ></asp:TextBox>
                </td>
                </tr>
            <tr>
                    <td>
                        <asp:Label ID="Label12" class="control-labels" runat="server" Text="Does this change need to be submitted to regulatory authority before implementation?"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label_need_submit"  class="form-controls" style="width: 5%; display: initial !important" runat="server" Text="No"></asp:Label>
                        <asp:TextBox Visible="False" class="form-controls" ID="TextBox_change_need_submit" style="display: initial !important" runat="server"  ></asp:TextBox>
                        <asp:TextBox Visible="False" class="form-controls tb_date" style="width: 25%; display: initial !important" runat="server" ID="TextBox_submissDate"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label13" class="control-labels" runat="server" Text="Does this change need to be approved by regulatory authority before implementation?"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label_need_approve"  class="form-controls" style="width: 5%; display: initial !important" runat="server" Text="No"></asp:Label>
                    <asp:TextBox Visible="False" class="form-controls" ID="TextBox_change_need_approve" style="display: initial !important" runat="server"  ></asp:TextBox>
                    <asp:TextBox Visible="False" class="form-controls tb_date" style="width: 25%; display: initial !important" runat="server" ID="TextBox_approveDate"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label14" class="control-labels" runat="server" Text="How long can old packaging matrials still be used at manufacturing site after approval/notification?"></asp:Label>
                </td>
                <td>
                    <asp:TextBox class="form-controls" ID="TextBox_packaging_matrials_period" runat="server"  style="display: initial !important"></asp:TextBox>
                    <asp:TextBox Visible="False" ID="TextBox_packaging_matrials_dedline" class="form-controls tb_date" style="width: 25%; display: initial !important" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label15" class="control-labels" runat="server" Text="How long is the sell-out period of the imported finished product manufactured with old packaging after approval in the country"></asp:Label>
                </td>
                <td>
                    <asp:TextBox class="form-controls" ID="TextBox_sell_out_period" style="display: initial !important" runat="server"  ></asp:TextBox>
                    <asp:TextBox Visible="False" ID="TextBox_sell_out_dedline" class="form-controls tb_date" style="width: 25%; display: initial !important" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label16" class="control-labels" runat="server" Text="Comments"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox_comments1" class="form-controls" runat="server" Width="250" Rows="3" TextMode="MultiLine" />
                </td>
            </tr>
        </table>
    </div>
    
     <div class="form_chng_rqst_info">
        <h2>Packaging component(s)s to be change</h2>
        <table style="width: 100%; text-align: left" class="table_forms">
            <tr>
                <td>
                    <asp:Label ID="Label17" class="control-labels" runat="server" Text="Type of component (should be attach approved artwork)"></asp:Label>
                </td>
                <td>
                    <asp:BulletedList Target = "_blank" DisplayMode="HyperLink" CssClass="checkbox" ID="BulletedList_component_type" runat="server" >
                    </asp:BulletedList>
                   <%--<asp:TextBox class="form-controls" ID="TextBox_component_type" runat="server" ></asp:TextBox>--%>
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
                   <asp:TextBox class="form-controls" ID="TextBox_change_strategy" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 990px">
                    <asp:Label ID="Label19" CssClass="control-labels" runat="server" Text="Implementation Date"></asp:Label>
                </td>
                <td>
                   <asp:TextBox class="form-controls tb_date" runat="server" ID="TextBox_dateImplmnt" ></asp:TextBox>
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
    <div class="form_chng_rqst_info">
        <h2>Attachments</h2>
        <table style="width: 100%; text-align: left" class="table_forms">
            <tr>
                <td style="width: 990px">
                    <asp:Label ID="Label24" CssClass="control-labels" runat="server" Text="Attachments"></asp:Label>
                </td>
                <td style="width: 990px">
                    <asp:BulletedList ID="BulletedList_attachements" runat="server"></asp:BulletedList>
                    <asp:Button ID="Button_downloadAttachments" runat="server" Text="Download All" OnClick="Button_downloadAttachments_Click" />
                </td>
            </tr>
        </table>
    </div>
    <br />
    <asp:Button Width="150"  runat="server" ID="Button_sign" CssClass="btn-primary" Text="Sign" OnClick="Button_sign_Click" />
    &nbsp;
    <asp:Button Width="150"  runat="server" ID="Button_send" CssClass="btn-primary" Text="Send to sign" OnClick="Button_send_Click" />
     &nbsp;
    <asp:Button  Width="150" runat="server" ID="Button_print" CssClass="btn-primary" Text="Print" OnClick="Button_print_Click" />
    <br />
    <asp:Label runat="server" ID="Label_result"></asp:Label>




</asp:Content>

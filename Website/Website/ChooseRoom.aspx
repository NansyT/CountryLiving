<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChooseRoom.aspx.cs" Inherits="Website.ChooseRoom" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-left: 80%; margin-top: 10px;">
        <asp:Button ID="Filter_Button" runat="server" OnClick="Filter_Button_Click" Text="Filter" />
    </div>

    <div class="row">
        <div style="margin: 80%; margin-top: 10px;">
            <div style="height: 490px; border: 0; border-left: 3px; border-style: solid; border-color: #0295BE">
                <asp:CheckBoxList CssClass="checkbox1" ID="Filter_Checkboxlist" runat="server" Visible="false">
                    <asp:ListItem>Enkelteseng</asp:ListItem>
                    <asp:ListItem>Dobbeltseng</asp:ListItem>
                    <asp:ListItem>2 enkeltesenge</asp:ListItem>
                    <asp:ListItem>Altan</asp:ListItem>
                    <asp:ListItem>Badekar</asp:ListItem>
                    <asp:ListItem>Jacuzzi</asp:ListItem>
                    <asp:ListItem>Eget køkken</asp:ListItem>
                </asp:CheckBoxList>
            </div>
        </div>
    </div>

    <%--<div class="col-xs-12" style="margin-top: 25px;">
        <div class="col-sm-5" style="height: 490px; border: 0; border-left: 3px; border-style: solid; border-color: #0295BE">
            <div class="row table-responsive">
                <table style="width: 90%; margin-left: 20px; border-style: hidden;" class="table table-bordered table-hover dataTable">
                    <tr>
                        <td style="vertical-align: central;">
                            <asp:Label runat="server" Text="30. How will the subjects be recruited/solicited?" ForeColor="Maroon" Font-Size="Medium"></asp:Label><br />
                            <asp:Label runat="server" Text="Check all that apply" ForeColor="Red" Font-Size="Small"></asp:Label>
                            <br />
                            <asp:CheckBoxList ID="cboxrecruitedsubject" runat="server" ForeColor="Maroon" Font-Size="Small" TextAlign="Right" RepeatColumns="2" CellPadding="10" CellSpacing="10"
                                RepeatLayout="Table" RepeatDirection="Vertical">
                                <asp:ListItem>Advertisements</asp:ListItem>
                                <asp:ListItem>Telephone Lists</asp:ListItem>
                                <asp:ListItem>Letters</asp:ListItem>
                                <asp:ListItem>Notices</asp:ListItem>
                                <asp:ListItem>Random Calls</asp:ListItem>
                                <asp:ListItem>Direct Solicitation</asp:ListItem>
                                <asp:ListItem>Other (Specify)</asp:ListItem>
                            </asp:CheckBoxList><br />
                            <asp:TextBox ID="txtrecruitedsubother" runat="server" Width="200" Font-Size="Medium"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>--%>

</asp:Content>
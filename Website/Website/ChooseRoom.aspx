<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChooseRoom.aspx.cs" Inherits="Website.ChooseRoom" %>

<asp:Content ID="BodyContent" runat="server">
    
    <div style="margin-left: 80%; margin-top: 10px;">
        <asp:Button ID="Filter_Button" runat="server" OnClick="Filter_Button_Click" Text="Filter" />
    </div>

    <div class="row">
        <div style="margin: 80%; margin-top: 10px;">
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

</asp:Content>
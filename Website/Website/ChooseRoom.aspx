<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChooseRoom.aspx.cs" Inherits="Website.ChooseRoom" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div>
            <asp:Label ID="StartdatoLabel" runat="server" Text=" "></asp:Label>
            <asp:Label ID="SlutdatoLabel" runat="server" Text=" "></asp:Label>
        </div>
    </div>
    
    <div style="margin-left: 80%; margin-top: 10px;">
        <asp:Button ID="Filter_Button" runat="server" OnClick="Filter_Button_Click" Text="Filter" />
    </div>

    <div class="row">
        <div style="margin: 80%; margin-top: 10px; z-index: 3;">
            <div>
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

</asp:Content>

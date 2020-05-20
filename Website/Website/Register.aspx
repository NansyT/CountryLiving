<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Website.Register" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="body_login">
        <div class="registerbox">
            <h2>Registre dig her</h2>
            <asp:Label Text="Navn" CssClass="lblUsername" runat="server"  />
            <asp:TextBox runat="server" ID="txtUsername" CssClass="txtUsername" placeholder="Skriv dit navn"/>
            <asp:Label Text="Adresse" CssClass="lblUsername" runat="server"  />
            <asp:TextBox runat="server" ID="TextBox1" CssClass="txtUsername" placeholder="fx. Vesterbrogade 3"/>
            <asp:Label Text="Post nr." CssClass="lblUsername" runat="server"  />
            <asp:TextBox runat="server" ID="TextBox2" CssClass="txtUsername" placeholder="1630"/>
            <asp:Label Text="By" CssClass="lblUsername" runat="server"  />
            <asp:TextBox runat="server" ID="TextBox3" CssClass="txtUsername" placeholder="København V"/>
            <asp:Label Text="Mobil nr." CssClass="lblUsername" runat="server"  />
            <asp:TextBox runat="server" ID="TextBox4" CssClass="txtUsername" placeholder="88888888" TextMode="Phone"/>
            <asp:Label Text="Mail" CssClass="lblUsername" runat="server"  />
            <asp:TextBox runat="server" ID="TextBox5" CssClass="txtUsername" placeholder="fx. ditnavn@dinmail.dk" TextMode="Email"/>
            <asp:Label Text="Adgangskoe" CssClass="lblPassword" runat="server" />
            <asp:TextBox runat="server" ID="txtPassword" CssClass="txtPassword" placeholder="*************" TextMode="Password"/>
            <asp:Button Text="Submit" CssClass="btnSubmit" runat="server" onclick="SubmitLogin"/>
        </div>
    </div>

</asp:Content>

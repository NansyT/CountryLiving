<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Website.Register" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="body_login">
        <div class="registerbox">
            <h2>Registre dig her</h2>
            <asp:Label Text="Navn" CssClass="log_Reg_lbl" runat="server"  />
            <asp:TextBox runat="server" ID="txtname" CssClass="log_Reg_txt" placeholder="Skriv dit navn"/>
            
            <asp:Label Text="Adresse" CssClass="log_Reg_lbl" runat="server"  />
            <asp:TextBox runat="server" ID="txtaddress" CssClass="log_Reg_txt" placeholder="fx. Vesterbrogade 3"/>
            
            <asp:Label Text="Post nr." CssClass="log_Reg_lbl" runat="server"  />
            <asp:TextBox runat="server" ID="txtzipcode" CssClass="log_Reg_txt" placeholder="1630"/>
           
            <asp:Label Text="By" CssClass="log_Reg_lbl" runat="server"  />
            <asp:TextBox runat="server" ID="txtcity" CssClass="log_Reg_txt" placeholder="København V"/>
            
            <asp:Label Text="Mobil nr." CssClass="log_Reg_lbl" runat="server"  />
            <asp:TextBox runat="server" ID="txtnumber" CssClass="log_Reg_txt" placeholder="88888888" TextMode="Phone"/>
            
            <asp:Label Text="Mail" CssClass="log_Reg_lbl" runat="server"  />
            <asp:TextBox runat="server" ID="txtmail" CssClass="log_Reg_txt" placeholder="fx. ditnavn@dinmail.dk" TextMode="Email"/>
            
            <asp:Label Text="Adgangskoe" CssClass="log_Reg_lbl" runat="server" />
            <asp:TextBox runat="server" ID="txtPassword" CssClass="log_Reg_txt" placeholder="*************" TextMode="Password"/>

            <asp:Button Text="Submit" CssClass="btnSubmit" runat="server" onclick="SubmitLogin"/>
        </div>
    </div>

</asp:Content>

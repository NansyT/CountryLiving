﻿<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Website.Login" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="body_login">
        <div class="loginbox">
            <h2>Log In Here</h2>
            <asp:Label Text="Email" CssClass="log_Reg_lbl" runat="server"  />
            <asp:TextBox runat="server" ID="txtEmail" CssClass="log_Reg_txt" placeholder="Enter Email"/>
            <asp:Label Text="Password" CssClass="log_Reg_lbl" runat="server" />
            <asp:TextBox runat="server" ID="txtPassword" CssClass="log_Reg_txt" placeholder="*************" TextMode="Password"/>
            <asp:Label Text="Incorrect username or password" ID="lblIncorrectMessage" CssClass="lblIncorrectMessage" runat="server" Visible="false"/>
            <asp:Button Text="Submit" CssClass="btnSubmit" runat="server" onclick="SubmitLogin"/>
            <h3>Har du ikke en bruger? Så lav en <a href="Register.aspx">her!</a></h3>
        </div>
    </div>
</asp:Content>

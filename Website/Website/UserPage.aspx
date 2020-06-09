<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="Website.UserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:DataList ID="displayInfo" runat="server" RepeatLayout="Table">
        <ItemTemplate>
            <table class="table">
                <tr>
                    <td>Navn: </td>
                    <td><%# Eval("fullname") %></td>
                </tr>
                <tr>
                    <td>E-mail:</td>
                    <td><%# Eval("pk_email") %></td>
                </tr>
                <tr>
                    <td>Tlf:</td>
                    <td><%# Eval("phone_nr") %></td>
                </tr>
                <tr>
                    <td>Adresse:</td>
                    <td><%# Eval("address") %></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>

</asp:Content>

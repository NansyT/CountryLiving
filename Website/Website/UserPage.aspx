<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="Website.UserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:DataList ID="displayInfo" runat="server">
        <ItemTemplate>
            <table>
                <tr>
                    <td>Navn: </td>
                    <td><%# Eval("fullname") %></td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td><%# Eval("pk_email") %></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>

</asp:Content>

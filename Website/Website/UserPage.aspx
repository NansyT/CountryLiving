<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="Website.UserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="user_page">
        <img src="Pictures/User.png" />
        <!-- Datalist that recieves information from database about the user -->
        <asp:DataList ID="displayInfo" runat="server" RepeatLayout="Table">
            <ItemTemplate>
                <table class="table">
                    <tr>
                        <th>Navn: </th>
                        <td><%# Eval("fullname") %></td>
                    </tr>
                    <tr>
                        <th>Tlf:</th>
                        <td><%# Eval("phone_nr") %></td>
                    </tr>
                    <tr>
                        <th>E-mail:</th>
                        <td><%# Eval("pk_email") %></td>
                    </tr>
                    <tr>
                        <th>Adresse:</th>
                        <td><%# Eval("address") %></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>

</asp:Content>

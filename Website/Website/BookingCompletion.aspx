<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingCompletion.aspx.cs" Inherits="Website.BookingCompletion" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- URL: roomID, bruger mail, start dato, slut dato -->
    <div style="margin-top: 20px;">
        <asp:DataList ID="bookcompletion" runat="server" CellSpacing="10" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table">
            <ItemTemplate>
                <table>
                    <tbody>
                        <tr style="border: solid;">
                            <td>
                                <table>
                                    <tbody>
                                        <caption>
                                            <label>
                                                <b>Rum Nr:</b> <%#Eval("roomID") %>
                                            </label>
                                            <br />
                                            <label>
                                                <b>Tilægs-ydelser:</b>
                                            </label>
                                        </caption>
                                    </tbody>
                                </table>
                            </td>
                            <td>
                                <table>
                                    <tbody>
                                        <caption>
                                            <label>
                                                <b>Navn:</b> <%#Eval("fullname") %>
                                            </label>
                                            <br />
                                            <label>
                                                <b>Adresse:</b> <%#Eval("address") %>
                                            </label>
                                            <br />
                                            <label>
                                                <b>Post Nr:</b> <%#Eval("zipcode") %>
                                            </label>
                                            <br />
                                            <label>
                                                <b>By:</b> <%#Eval("city") %>
                                            </label>
                                            <br />
                                            <label>
                                                <b>E-mail:</b> <%#Eval("email") %>
                                            </label>
                                            <br />
                                            <label>
                                                <b>Telefon Nr:</b> <%#Eval("phone") %>
                                            </label>
                                        </caption>
                                    </tbody>
                                </table>
                            </td>
                            <td>
                                <table>
                                    <tbody>
                                        <caption>
                                            <label>
                                                <b>Pris pr. nat:</b> <%#Eval("pricePday") %>DKK</label>
                                            <br />
                                            <label>
                                                <b>Fra Dato:</b> <%#Eval("indate", "{0:dd/MM/yyyy}") %>
                                            </label>
                                            <br />
                                            <label>
                                                <b>Til Dato:</b> <%#Eval("outdate", "{0:dd/MM/yyyy}") %>
                                            </label>
                                            <br />
                                            <label>
                                                <b>Antal nætter:</b> <%#Eval("totalnights") %>
                                            </label>
                                            <br />
                                            <label>
                                                <b>Totalpris:</b> <%#Eval("totalprice") %>DKK</label>
                                            <br />
                                            <asp:LinkButton ID="bookcompletebutton" Text="Book Nu" CommandName="Complete" OnClick="BookCompleteButton" CommandArgument='<%#Eval("indate") + ";" + Eval("outdate") + ";" + Eval("roomid")%>' runat="server" ></asp:LinkButton>
                                        </caption>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

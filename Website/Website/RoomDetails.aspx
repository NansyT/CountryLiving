    <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoomDetails.aspx.cs" Inherits="Website.RoomDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="positionBookingBox">
        <div class="bookingBox" style="margin-top:10px; margin-left:70%;">
            <div style="text-align:center;">
                <asp:Label ID="errormessage" runat="server" Text="Label" Visible="False"></asp:Label>

                <!-- displayer alt viden om værelset så som Værelse nummer, tillægsydelser og pris -->
                <!-- Vi får displayet alt vores hentede vide fra Databasen igennem Eval -->
                <asp:DataList ID="roomDetailsinfo" runat="server" RepeatColumns="1">
                    <ItemTemplate>
                        <h1><asp:Label ID="RoomID" Font-Bold="true" runat="server" Text="Værelse: "></asp:Label>
                        &nbsp;<asp:Label ID="RoomIDValue" runat="server" Text='<%# Eval("roomid") %>'></asp:Label></h1>
                        <br />
                        <p><asp:Label ID="Services" runat="server" Text="Tillægsydelser: "></asp:Label>
                        &nbsp;<asp:Label ID="ServicesValue" runat="server" Text='<%# Eval("servicestr") %>'></asp:Label></p>
                        <br />
                        <p><asp:Label ID="PricePDay" runat="server" Text="Pris pr. døgn: "></asp:Label>
                        &nbsp;<asp:Label ID="PricePDayValue" runat="server" Text='<%# Eval("pricepday") %>'></asp:Label></p>
                        <br />
                        <p><asp:Label ID="NumberOfDays" runat="server" Text="Antal nætter: "></asp:Label>
                        &nbsp;<asp:Label ID="NumberOfDaysValue" runat="server" Text='<%# Eval("totalnights") %>'></asp:Label></p>
                        <br />
                        <h3><asp:Label ID="TotalPrice" runat="server" Text="Total pris: "></asp:Label>
                        &nbsp;<asp:Label ID="TotalPriceValue" runat="server" Text='<%# Eval("totalprice") %>'></asp:Label></h3>
                    </ItemTemplate>
                </asp:datalist>
                <!-- Knappen til at Blive sendt til BookingCompletion-->
                <asp:Button class="btnBooking" ID="Button1" runat="server" Text="Book rummet" OnClick="Button1_Click" />
            </div>
       </div>
   </div> 
</asp:Content>

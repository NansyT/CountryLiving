    <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoomDetails.aspx.cs" Inherits="Website.RoomDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="positionBookingBox">
        <div class="bookingBox">
            <div style="text-align:center;">
                <asp:Label ID="errormessage" runat="server" Text="Label" Visible="False"></asp:Label>
                <h1>Rum: <asp:Label ID="LabelRoom" runat="server" Text="Label"></asp:Label></h1>
                <p>tillægsydeler:</p>
                <asp:DataList ID="roomDetailsinfo" runat="server" RepeatColumns="1">
                    <ItemTemplate>
                        <asp:Label ID="RoomID" Font-Bold="true" runat="server" Text="Værelse: "></asp:Label>
                        &nbsp;<asp:Label ID="RoomIDValue" runat="server" Text='<%# Eval("roomid") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Services" runat="server" Text="Tillægsydelser: "></asp:Label>
                        &nbsp;<asp:Label ID="ServicesValue" runat="server" Text='<%# Eval("servicestr") %>'></asp:Label>
                        <br />
                        <asp:Label ID="PricePDay" runat="server" Text="Pris pr. døgn: "></asp:Label>
                        &nbsp;<asp:Label ID="PricePDayValue" runat="server" Text='<%# Eval("pricepday") %>'></asp:Label>
                        <br />
                        <asp:Label ID="NumberOfDays" runat="server" Text="Antal nætter: "></asp:Label>
                        &nbsp;<asp:Label ID="NumberOfDaysValue" runat="server" Text='<%# Eval("totalnights") %>'></asp:Label>
                        <br />
                        <asp:Label ID="TotalPrice" runat="server" Text="Total pris: "></asp:Label>
                        &nbsp;<asp:Label ID="TotalPriceValue" runat="server" Text='<%# Eval("totalprice") %>'></asp:Label>
                    </ItemTemplate>
                </asp:datalist>
                    <div>
                        <p>
                        <label> <%#Eval("bookingPerioden") %> </label>
                        </p>
                        <br />
                        <p>
                        <label> <b>Pr. nat:</b> <%#Eval("PrisIalt") %> </label>
                        </p>
                        <p>
                        <label> <b>Reserver</b> <%#Eval("bookingPerioden") %> <b>nætter</b></label>
                        </p>
                        <h1>
                        <label> <b>Pris I Alt:</b> <%#Eval("PrisIalt") %> </label>
                        </h1>
                    </div>
                <asp:Button class="btnBooking" ID="Button1" runat="server" Text="Book rummet" OnClick="Button1_Click" />
            </div>
       </div>
   </div> 
</asp:Content>

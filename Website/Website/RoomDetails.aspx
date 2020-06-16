    <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoomDetails.aspx.cs" Inherits="Website.RoomDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="positionBookingBox">
        <div class="bookingBox">
            <div style="text-align:center;">
                <h1>Rum: <asp:Label ID="LabelRoom" runat="server" Text="Label"></asp:Label></h1>
                <p>pris: <asp:Label ID="LabelPrice" runat="server" Text="Label"></asp:Label></p>
                <p>tillægsydeler:</p>
                <asp:DataList ID="DataList1" runat="server">
                    <ItemTemplate>
                        <%Eval("services"); %>
                    </ItemTemplate>
                </asp:DataList>
                <h3>pr nat:</h3>
                <p>reserver i x antal nætter</p>
                <h1>Pris I Alt: </h1>
                <asp:Button class="btnBooking" ID="Button1" runat="server" Text="Book rummet" OnClick="Button1_Click" />
            </div>
       </div>
   </div> 
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoomDetails.aspx.cs" Inherits="Website.RoomDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="positionBookingBox">
        <div class="bookingBox">
            <div style="text-align:center;">
                <h1>Rum: <asp:Label ID="LabelRum" runat="server" Text="Label"></asp:Label></h1>
                <p>pris:</p>
                <p>tillægsydeler:</p>
                <p>Dobbeltseng:</p>
                <h3>pr nat:</h3>
                <p>reserver i x antal nætter</p>
                <h1>Pris I Alt: </h1>
                <asp:Button class="btnBooking" ID="Button1" runat="server" Text="Book rummet" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>

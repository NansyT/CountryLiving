<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoomDetails.aspx.cs" Inherits="Website.RoomDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="positionBookingBox">
        <div class="bookingBox">
            <div style="text-align:center;">
                <h1>Rum: 101</h1>
                <p>pris: 695kr.</p>
                <p>tillægsydeler:</p>
                <p>Dobbeltseng: 200kr.</p>
                <h3>pr nat: 895kr.</h3>
                <p>reserver i x antal nætter</p>
                <h1>Pris I Alt: </h1>
                <input class="btnBooking" id="Button1" type="button" value="Book Rummet" />
            </div>
        </div>
    </div>
</asp:Content>

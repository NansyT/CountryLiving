<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingCompletion.aspx.cs" Inherits="Website.BookingCompletion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="grid-container">
        <asp:DataList ID="DataList1" runat="server"></asp:DataList>
        <div>
            <p>Rum Nr.
            </p>
            <p>Tillægs ydelserne:</p>
            <p>Dobbeltseng</p>
        </div>
        <div>
            <p>Navn</p>
            <p>Adresse</p>
            <p>Post Nr.</p>
            <p>By</p>
            <p>E-mail</p>
            <p>Telefon Nr</p>
        </div>
        <div>
            <p>Pris per nat:</p>
            <p>Fra Dato:</p>
            <p>Til Dato:</p>
            <p>Antal nætter:</p>
            <h3>Pris i alt:</h3>
            <input class="btnCompleteBooking" id="Button1" type="button" value="Book Nu" />
        </div>
    </div>
</asp:Content>

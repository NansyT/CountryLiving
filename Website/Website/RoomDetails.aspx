    <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoomDetails.aspx.cs" Inherits="Website.RoomDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="positionBookingBox">
        <div class="bookingBox">
            <div style="text-align:center;">
                <h1>Rum: <asp:Label ID="LabelRoom" runat="server" Text="Label"></asp:Label></h1>
                <p>tillægsydeler:</p>
                <asp:DataList ID="roomDetailsinfo" runat="server"></asp:datalist>
                    <div>
                        <p>
                        <label> <%#Eval("tillægsydelserne") %> </label>
                        </p>
                        <br />
                        <p>
                        <label> <b>Pr. nat:</b> <%#Eval("prisPnat") %> </label>
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

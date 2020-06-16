<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingCompletion.aspx.cs" Inherits="Website.BookingCompletion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="grid-container">
        <!-- URL: roomID, bruger mail, start dato, slut dato -->
        <asp:DataList ID="bookcompletion" runat="server"></asp:DataList>
            <div>
                <label><b>Rum Nr:</b> <%#Eval("roomid") %></label>
                <br />
                <label><b>Tilægs ydelser:</b></label>
                <asp:Label id="services1" runat="server"></asp:Label>
            </div>
            <div>
                <label><b>Navn:</b> <%#Eval("fullname") %></label>
                <br />
                <label><b>Adresse:</b> <%#Eval("address") %></label>
                <br />-
                <label><b>Post Nr:</b> <%#Eval("zipcode") %></label>
                <br />
                <label><b>By:</b> <%#Eval("city") %></label>
                <br />
                <label><b>E-mail:</b> <%#Eval("email") %></label>
                <br />
                <label><b>Telefon Nr:</b> <%#Eval("phone") %></label>
            </div>
            <div>
                <label><b>Pris pr. nat:</b> <%#Eval("pricePday") %> DKK</label>
                <br />
                <label><b>Fra Dato:</b> <%#Eval("indate") %></label>
                <br />
                <label><b>Til Dato:</b> <%#Eval("outdate") %></label>
                <br />
                <label><b>Antal nætter:</b> <%#Eval("totalnights") %></label>
                <br />
                <label><b>Totalpris:</b> <%#Eval("totalprice") %> DKK</label>
                <input class="btnCompleteBooking" id="Button1" type="button" value="Book Nu" />
            </div>
        </div>
    </asp:Content>

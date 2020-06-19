<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChooseRoom.aspx.cs" Inherits="Website.ChooseRoom" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <%--https://xdsoft.net/jqplugins/datetimepicker/ Kalender kommer herfa--%>

    <div style="margin-top: 10px;">
        <div>
            <input ID="StartDato" runat="server" type="text">
        </div>
        <div>
            <input id="SlutDato" runat="server" type="text" >
        </div>
        <div style="padding-top: 5px;">
            <!-- Filter button, som åbner checkliste -->
            <asp:Button ID="Filter_Button" runat="server" OnClick="Filter_Button_Click" Text="Filter" />
            <!-- Søg knap til når du har valgt dine præferencer -->
            <asp:Button ID="Button1" runat="server" Text="Søg" OnClick="searchButton_Click"/>
        </div>
    </div>

    <!-- Filter liste med tilægsydelser, som er en checkboxlist -->
    <div class="row">
        <div style="margin-top: 10px; margin-left: 1.3%; z-index: 3;">
            <asp:CheckBoxList CssClass="checkbox1" ID="Filter_Checkboxlist" runat="server" Visible="false">
                <asp:ListItem>Altan</asp:ListItem>
                <asp:ListItem>Dobbeltseng</asp:ListItem>
                <asp:ListItem>2 Enkeltsenge</asp:ListItem>
                <asp:ListItem>Badekar</asp:ListItem>
                <asp:ListItem>Jacuzzi</asp:ListItem>
                <asp:ListItem>Eget køkken</asp:ListItem>
                <asp:ListItem>Enkeltmands seng</asp:ListItem>
            </asp:CheckBoxList>
        </div>
    </div>

    <section>
        <div class="picturelistdiv">
            
            <!-- Datalist som viser alle vores rum, som for værelses informationer igennem metoder, som er forbundet med database, der bliver brugt Eval til at vise de forskellige værdier for hver kolonne. -->
            <asp:DataList ID="displayrooms" runat="server" RepeatDirection="Horizontal" CellSpacing="3" RepeatColumns="3">
               <ItemTemplate>
                   <table class="table">
                       <tr>
                           <td>
                               <label style="font-size:large; font-weight:bold;">Room: <%# Eval("roomid") %> </label>
                           </td>
                       </tr>

                       <td>
                           <img src="Pictures/Soveværelse 1.PNG" />
                       </td>

                       <tr>
                           <td>
                                <label>Pris: <%# Eval("priceday") %></label>
                           </td>
                       </tr>

                       <tr>
                           <td>
                               <label>Tilægsydelser: <%#Eval("services") %></label>
                           </td>
                       </tr>

                       <tr>
                           <td>
                               <!-- LinkButton som sender brugeren videre til detaljer om rummet. -->
                               <asp:LinkButton ID="bookhere" runat="server" OnClick="bookhere_Click" CommandName="CheckForBook" CommandArgument='<%#Eval("roomid") %>' Text="Book her" />                             
                           </td>
                       </tr>
                   </table>
               </ItemTemplate>
           </asp:DataList>
        </div>
    </section>


</asp:Content>

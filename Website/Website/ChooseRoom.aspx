<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChooseRoom.aspx.cs" Inherits="Website.ChooseRoom" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div style="margin-left: 80%; margin-top: 10px;">
        <asp:Button ID="Filter_Button" runat="server" OnClick="Filter_Button_Click" Text="Filter" />
    </div>

    <div class="row">
        <div style="margin-left: 80%; margin-top: 10px; z-index: 3;">
            <div>
                <asp:CheckBoxList CssClass="checkbox1" ID="Filter_Checkboxlist" runat="server" Visible="false">
                    <asp:ListItem>Enkelteseng</asp:ListItem>
                    <asp:ListItem>Dobbeltseng</asp:ListItem>
                    <asp:ListItem>2 enkeltesenge</asp:ListItem>
                    <asp:ListItem>Altan</asp:ListItem>
                    <asp:ListItem>Badekar</asp:ListItem>
                    <asp:ListItem>Jacuzzi</asp:ListItem>
                    <asp:ListItem>Eget køkken</asp:ListItem>
                </asp:CheckBoxList>
            </div>
        </div>
    </div>

    <div>
        <div class="dato_design">
            <asp:Label ID="StartdatoLabel" runat="server" Text="Start dato:"></asp:Label>
            <input class="datoinput" type="datetime" id="StartdatoInput" runat="server">
            <!-- MINI KALENDER -->
        </div>
        <div class="dato_design">
            <asp:Label ID="SlutdatoLabel" runat="server" Text="Slut dato :"></asp:Label>
            <input class="datoinput" type="datetime" id="SlutdatoInput" runat="server">
            <!-- MINI KALENDER -->
        </div>
    </div>
    
    <section>
        <div class="picturelistdiv">
            <%--Måske et link der kunne hjælpe med grid--%>
            <%--https://www.aspsnippets.com/Articles/Display-images-from-SQL-Server-Database-in-ASP.Net-GridView-control.aspx--%> 
           <ol class="test" aria-live="assertive" aria-relevant="all" role="status">
               <li class="lipicturelist">Hejsa</li>
               <li class="lipicturelist">Hejsa2</li>
               <li class="lipicturelist">Hejsa3</li>
               <li class="lipicturelist">Hejsa4</li>
           </ol>
        </div>
    </section>


</asp:Content>

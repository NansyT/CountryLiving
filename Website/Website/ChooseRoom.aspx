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
    <%--https://xdsoft.net/jqplugins/datetimepicker/ Calendar comes from here--%>
    <div>
        <div>
            <input ID="StartDato" runat="server" type="text">
        </div>
        <div>
            <input id="SlutDato" runat="server" type="text" >
        </div>
        <asp:button runat="server" id="VælgDato" Text="Vælg dato" OnClick="VælgDato_Click"></asp:button>
        
        
    </div>
    
    <section>
        <div class="picturelistdiv">
            <%--Måske et link der kunne hjælpe med grid--%>
            <%--https://www.aspsnippets.com/Articles/Display-images-from-SQL-Server-Database-in-ASP.Net-GridView-control.aspx--%> 
           <%--<asp:DataList ID="displayrooms" runat="server" RepeatDirection="Horizontal" CellSpacing="3" RepeatColumns="3">
               <ItemTemplate>

               </ItemTemplate>
           </asp:DataList>--%>
        </div>
    </section>


</asp:Content>

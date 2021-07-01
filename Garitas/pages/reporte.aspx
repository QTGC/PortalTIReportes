<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Garitas/pages/Reporte-Garitas.master" AutoEventWireup="true" CodeFile="reporte.aspx.cs" Inherits="reporte" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    

    <%--  <form id="form1" runat="server">--%>
    <div>
        <div style="margin: 3%; border-style: solid; border-width: 5px; border-color: #e2b50e; border-radius:10px" runat="server">





            <div class="row">
                <div class="col" style="margin-top: 1%; margin-left: 2%">
                    Desde:
                <br />
                    <asp:TextBox ID="txtFechaInicio" runat="server" ReadOnly="true" Width="150px"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="34px" ImageUrl="~/Garitas/recursos/calendar3.png" OnClick="ImageButton1_Click" Width="32px" Style="border-radius:20px" />
                    <%--  <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"  Style="margin-left:5%"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="34px" ImageUrl="~/images/demo/calendar2.png" OnClick="ImageButton1_Click" Width="32px" Style="" />--%>

                    <br />
                    <br />

                    <div>
                        <asp:Button ID="btnHideCalendar1" runat="server" Text="X" OnClick="btnHideCalendar1_Click" CssClass="btn-danger" Style="float:right" />
                        <asp:Calendar ID="Calendar1"  runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="Calendar1_SelectionChanged" SelectedDate="<%# DateTime.Today %>">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                            

                        </asp:Calendar>
                    </div>


                </div>

                <div class="col" style="margin-top: 1%; margin-left: 2%">
                    Hasta:   
                <br />
                    <asp:TextBox ID="TxtFechaFin" runat="server" ReadOnly="true" Width="150px"></asp:TextBox>
                    <%--<asp:ImageButton ID="ImageButton2" runat="server" Height="34px" ImageUrl="~/images/demo/calendar2.png" OnClick="ImageButton1_Click" Width="32px" Style="" />--%>
                    <asp:ImageButton ID="ImageButton3" runat="server" Height="34px" ImageUrl="~/Garitas/recursos/calendar3.png" OnClick="ImageButton3_Click" Width="34px" Style="border-radius:20px; " />

                    <%--  <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"  Style="margin-left:5%"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="34px" ImageUrl="~/images/demo/calendar2.png" OnClick="ImageButton1_Click" Width="32px" Style="" />--%>                    <%--<button type="button" class="btn btn-success">Success</button>--%>
                    <br />
                    <br />

                    <div>

                        <asp:Button ID="btnHideCalendar2" runat="server" Text="X" OnClick="btnHideCalendar2_Click" CssClass="btn-danger" Style="float:right" />

                            <asp:Calendar ID="Calendar2"  runat="server" OnSelectionChanged="Calendar2_SelectionChanged" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                            
                            </asp:Calendar>
                      

                            
                       
                    </div>


                </div>

                <div class="col" style="margin: 2%; align-content:center">

                   <asp:Button ID="buscar" runat="server" Text="Buscar" OnClick="buscar_Click" CssClass="btn-success" Style="margin-left: 3%; font-size:large" />

                </div>

                <div class="col" style="margin: 0%">



                    <br />
                    Rango Fecha: 
                        <br />
                    <strong>

                        <asp:Label ID="lblFechaInicio" runat="server" Text=""></asp:Label>
                        -
                        <asp:Label ID="lblFechaFin" runat="server" Text="Label"></asp:Label>
                    </strong>
                    <br />
                    Total General: 
                   <strong>
                       <br />
                       <asp:Label ID="lblTextoDePrueba" runat="server" Text=""></asp:Label>
                   </strong>


                </div>

                <div class="col" style="margin-top: 2%; margin-left: 1%; top: 0px; left: 0px;">
                    <asp:ImageButton ID="Exportar" runat="server" ImageUrl="~/Garitas/recursos/excel.png" Style="margin-right: 30%" Height="50px" Width="50px" OnClick="Exportar_Click" />
                    <br />
                    Exportar a Excel
                     
                </div>


                <div id="DivGrid" runat="server" style="align-content: center; border-radius:10px; margin-bottom: 3%; margin-left: 2.5%; width: 95%; overflow: auto; height: 500px; border-style: solid; border-width: 3px; border-color: #e2b50e">
                    <asp:GridView ID="GridView1" runat="server" CssClass="Grid" Width="100%" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                </div>
            </div>


        </div>
    </div>



    <%--</form>--%>
</asp:Content>


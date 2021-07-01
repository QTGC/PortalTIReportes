<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Costos-ReporteAlmuerzos.aspx.cs" Inherits="Costos_Costos_ReporteAlmuerzos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <h1>Reporte - Almuerzos</h1>
        <div>

            <div>

                <div style="" runat="server">





                    <div class="row">



                        <div class="col-3" style="margin-top: 1%; margin-left: 2%">
                            Desde:
                <br />
                            <asp:TextBox ID="txtFechaInicio" runat="server" ReadOnly="true" Width="80px" Style="border-radius: 5px; font-size: small"></asp:TextBox>
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ImageUrl="~/Garitas/recursos/calendar3.png" OnClick="ImageButton1_Click" Width="20px" />

                            <br />
                            <br />

                            <div>
                                <asp:Button ID="btnHideCalendar1" runat="server" Text="X" OnClick="btnHideCalendar1_Click" CssClass="btn-danger" Style="float:right; font-size:smaller" />
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" OnSelectionChanged="Calendar1_SelectionChanged" SelectedDate="<%# DateTime.Today %>" Style="float: right">
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

                        <div class="col-3" style="margin-top: 1%; margin-left: 2%">
                            Hasta:   
                <br />
                            <asp:TextBox ID="TxtFechaFin" runat="server" ReadOnly="true" Width="80px" Style="border-radius: 5px; font-size: small"></asp:TextBox>
                            <asp:ImageButton ID="ImageButton3" runat="server" Height="20px" ImageUrl="~/Garitas/recursos/calendar3.png" OnClick="ImageButton3_Click" Width="20px" />

                            <br />
                            <br />

                            <div>

                                <asp:Button ID="btnHideCalendar2" runat="server" Text="X" OnClick="btnHideCalendar2_Click" CssClass="btn-danger" Style="float:right ;font-size:smaller"  />

                                <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" OnSelectionChanged="Calendar2_SelectionChanged" SelectedDate="<%# DateTime.Today %>" Style="float: right">
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




                        <div class="col-1" style="margin-top: 3%;margin-right: 3% ; align-content:center">

                            <asp:Button ID="buscar" runat="server" Text="Buscar" OnClick="buscar_Click" CssClass="btn-warning" Style="margin-left: 3%; font-size:large; border-radius:5px; font-size:medium" />

                        </div>

                         </div>
                         <div class="row">

                        <div class="col-9" style="text-align:left; margin-top: -10px">


                            <br />
                            <asp:Label ID="lblTotal" runat="server" Text="Total Registros: " Style="margin-left:3%"></asp:Label> 
                   <strong>
                       <br />
                       <asp:Label ID="lblTextoDePrueba" runat="server" Text="" Style="margin-left:3%"></asp:Label>
                   </strong>


                        </div>

                        <div class="col" style="margin-top: 2%; margin-left: 1%; top: 0px; left: 0px;">
                            Exportar a Excel
                            <br />
                            <asp:ImageButton ID="Exportar" runat="server" ImageUrl="~/Garitas/recursos/excel.png" Style="margin-right: 30%; margin-left:25%" Height="30px" Width="30px" OnClick="Exportar_Click" />
                            
                     
                        </div>


                        <div id="DivGrid" runat="server" style="align-content: center; border-radius: 10px; margin-bottom: 3%; margin-left: 2.5%; width: 95%; overflow: auto; height: 500px; border-style: solid; border-width: 3px; border-color: #e2b50e">


                            <div id="divCargando" runat="server" align="center">
                                <br />
                                <br />
                                Cargando registros . . .
                        <br />
                                <img style="align-content: center; width: 200px; height: 100px" alt="" src="../recursos/loading.gif" />

                            </div>

                            <div id="DivNoHayRegistros" runat="server" align="justify" style="color: black; padding-top: 6px; padding-left: 2%; padding-right: 2%; align-content: center; border-radius: 10px; margin-bottom: 3%; margin-top: 3%; margin-left: 40%; width: 20%; overflow: auto; height: auto; border-style: solid; border-width: 3px; background-color: #ffe65d; border-color: #e2b50e">


                                <img src="../recursos/alert.svg" alt="" width="32" height="32" title="Alert" style="align-items: center" />
                                No se han encontrado registros en el rango de fecha seleccionado.
                        


                            </div>


                            <asp:GridView ID="GridView1" runat="server" CssClass="Grid" Width="100%" Font-Size="X-Small" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="Vertical" RowHeaderColumn="true">
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



        </div>
    </form>
</body>
</html>

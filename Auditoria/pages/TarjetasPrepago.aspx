<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Auditoria/pages/Auditoria.master" AutoEventWireup="true" CodeFile="TarjetasPrepago.aspx.cs" Inherits="reporte" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <%--  <form id="form1" runat="server">--%>
    <div >

        <div style="color:black;background-color:#edd88c ;padding-left:30px ;padding-top:5px;margin-left: 3%; margin-right: 3%;margin-bottom: 1%;margin-top: 1%; border-style: solid; border-width: 5px; border-color: #e2b50e; border-radius: 10px" runat="server">
            <label style="margin-left:65%">Usuario: </label>
            <asp:Label ID="lblSesion" runat="server" Text="usr"></asp:Label>
            <label> / </label>
            <label> Fecha: </label>
            <asp:Label ID="lblFecha" runat="server" Text="fecha"></asp:Label>

            <asp:Button ID="btnSalir" runat="server" Text="Salir" OnClick="btnSalir_Click" Class="btn-danger" Style="float:right; border-radius:6px; margin-right:2%"/>


        </div>
        
        <div style="margin-left: 3%; margin-right: 3%;margin-bottom: 3%;margin-top: 0% ;border-style: solid; border-width: 5px; border-color: #e2b50e; border-radius: 10px" runat="server">


            


            <div class="row">


                <div class="col-2" style="margin-top: 1%; margin-left: 2%;  font-size:small">


<%--                    <asp:RadioButton ID="RbtnOpcion1" runat="server" Text="01/01/2020 - Hoy" GroupName="Opciones" AutoPostBack="True" OnCheckedChanged="RbtnOpcion1_CheckedChanged" />
                    <br />
                    <asp:RadioButton ID="RbtnOpcion2" runat="server" Text="Rango de Fecha" Checked="True" GroupName="Opciones" AutoPostBack="True" OnCheckedChanged="RbtnOpcion2_CheckedChanged" />

                    <div style="margin-top: 5%">
                        <br />
                        <asp:CheckBox ID="CheckBoxPrepago" runat="server" Style="padding-top: 15px; border-top-width: 2px; border-color: #ffe65d; border-top-style: solid" Text=" Tarjetas Prepago" ToolTip="Buscar únicamente tarjetas prepago" />
                    </div>--%>


                    <div>
                        <asp:TextBox ID="txtNumTarjeta1" runat="server" Width="59px"></asp:TextBox>
                        XXXXX
                        <asp:TextBox ID="txtNumTarjeta2" runat="server" Width="32px"></asp:TextBox>
                    </div>


                </div>



                <div class="col-2" style="margin-top: 1%; margin-left: 2%">
                    Desde:
                <br />
                    <asp:TextBox ID="txtFechaInicio" runat="server" ReadOnly="true" Width="120px" Style="border-radius: 5px"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="34px" ImageUrl="~/Garitas/recursos/calendar3.png" OnClick="ImageButton1_Click" Width="32px" Style="border-radius: 20px" />
                    <%--  <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"  Style="margin-left:5%"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="34px" ImageUrl="~/images/demo/calendar2.png" OnClick="ImageButton1_Click" Width="32px" Style="" />--%>

                    <br />
                    <br />

                    <div>
                        <asp:Button ID="btnHideCalendar1" runat="server" Text="X" OnClick="btnHideCalendar1_Click" CssClass="btn-danger" Style="margin-left: 71%" />
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="100px" Width="160px" OnSelectionChanged="Calendar1_SelectionChanged" SelectedDate="<%# DateTime.Today %>">
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

                <div class="col-2" style="margin-top: 1%; margin-left: 2%">
                    Hasta:   
                <br />
                    <asp:TextBox ID="TxtFechaFin" runat="server" ReadOnly="true" Width="120px" Style="border-radius: 5px"></asp:TextBox>
                    <%--<asp:ImageButton ID="ImageButton2" runat="server" Height="34px" ImageUrl="~/images/demo/calendar2.png" OnClick="ImageButton1_Click" Width="32px" Style="" />--%>
                    <asp:ImageButton ID="ImageButton3" runat="server" Height="34px" ImageUrl="~/Garitas/recursos/calendar3.png" OnClick="ImageButton3_Click" Width="34px" Style="border-radius: 20px;" />

                    <%--  <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"  Style="margin-left:5%"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="34px" ImageUrl="~/images/demo/calendar2.png" OnClick="ImageButton1_Click" Width="32px" Style="" />--%>                    <%--<button type="button" class="btn btn-success">Success</button>--%>
                    <br />
                    <br />

                    <div>

                        <asp:Button ID="btnHideCalendar2" runat="server" Text="X" OnClick="btnHideCalendar2_Click" CssClass="btn-danger" Style="margin-left: 71%" />

                        <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
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

                <div class="col-1" style="margin: 2%; align-content: center">

                    <asp:Button ID="buscar" runat="server" Text="Buscar" OnClick="buscar_Click" CssClass="btn-success" Style="margin-left: 3%; font-size: large; border-radius: 5px" />

                </div>

                <div class="col" style="margin: 0%">



                    <%-- <br />
                    Rango Fecha: 
                        <br />
                    <strong>

                        <asp:Label ID="lblFechaInicio" runat="server" Text=""></asp:Label>
                        -
                        <asp:Label ID="lblFechaFin" runat="server" Text="Label"></asp:Label>
                    </strong>--%>
                    <br />
                    Total Registros: 
                   <strong>
                       <br />
                       <asp:Label ID="lblTextoDePrueba" runat="server" Text=""></asp:Label>
                   </strong>


                </div>

                <div class="col-2" style="margin-top: 2%; margin-left: 1%; top: 0px; left: 0px;">
                    <asp:ImageButton ID="Exportar" runat="server" ImageUrl="~/Garitas/recursos/excel.png" Style="margin-right: 30%" Height="50px" Width="50px" OnClick="Export2" />
                    <%--<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Garitas/recursos/excel.png" Style="margin-right: 30%" Height="50px" Width="50px" OnClick="Exportar_Click" />--%>

                    <br />
                    Exportar a Excel
                     
                </div>


                <div id="DivGrid" runat="server" style="align-content: center; border-radius: 10px; margin-bottom: 3%; margin-left: 2.5%; width: 95%; overflow: auto; height: 500px; border-style: solid; border-width: 3px; border-color: #e2b50e; background-color:#0e1e2f">


                    <div id="divCargando" runat="server" align="center" >
                       <br /><br />
                        Cargando registros . . .
                        <br />
                        <img  style="align-content: center;width:200px; height:100px" alt="" src="../recursos/loading.gif" />   
                        
                    </div>

                    <div id="DivNoHayRegistros" runat="server" align="justify" style="color: black; padding-top: 6px; padding-left: 2%; padding-right: 2%; align-content: center; border-radius: 10px; margin-bottom: 3%; margin-top: 3%; margin-left: 40%; width: 20%; overflow: auto; height: auto; border-style: solid; border-width: 3px; background-color: #ffe65d; border-color: #e2b50e">


                        <img src="../recursos/alert.svg" alt="" width="32" height="32" title="Alert" style="align-items: center" />
                        No se han encontrado registros en el rango de fecha seleccionado.
                        


                    </div>


                    <asp:GridView ID="GridView1" runat="server" CssClass="Grid" Width="100%" Font-Size="X-Small" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" RowHeaderColumn="true">
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


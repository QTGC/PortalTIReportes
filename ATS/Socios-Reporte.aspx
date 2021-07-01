<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Socios-Reporte.aspx.cs" Inherits="Garitas_Socios_Reporte" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
       
        <div>
            <h1>Reporte - Socios</h1>
            <div style="" runat="server">





                <div class="row">



                    <div class="col-6" style="margin-top: 1%; margin-right: 3%; align-content: center">
                   <asp:Label ID="lblTotal" runat="server" Text="Total Registros: " Style="margin-left: 5%"></asp:Label>
                        <strong>
                            <br />
                            <asp:Label ID="lblTextoDePrueba" runat="server" Text="" Style="margin-left: 5%"></asp:Label>
                        </strong>
                    </div>

                    <div class="col-2" style="margin-top: 1%; margin-right: 3%; align-content: center">

                        <asp:Button ID="buscar" runat="server" Text="Buscar" OnClick="buscar_Click" CssClass="btn-warning" Style="margin-left: 3%; font-size: large; border-radius: 5px; font-size: medium" />

                    </div>

                   
             


                    <div class="col-3" style="margin-top: 1%; float: right">
                        Exportar a Excel
                    <br />
                        <asp:ImageButton ID="Exportar" runat="server" ImageUrl="~/Garitas/recursos/excel.png" Style="margin-right: 30%; margin-left:25%" Height="30px" Width="30px" OnClick="Exportar_Click" />
                        <br />


                    </div>
                </div>

                <div id="DivGrid" runat="server" style="font-size: small; align-content: center; border-radius: 10px; margin-bottom: 3%; margin-left: 2.5%; width: 95%; overflow: auto; height: 700px; border-style: solid; border-width: 3px; border-color: #e2b50e">
                    <asp:GridView ID="GridView1" runat="server" CssClass="Grid" Width="100%" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="Vertical">
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

    </form>
</body>
</html>

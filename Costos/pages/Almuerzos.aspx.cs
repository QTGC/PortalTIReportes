using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Configuration;


public partial class Costos_pages_Almuerzos : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(@"Data Source=192.168.2.78;Initial Catalog=CoffeeSITenisUio; User ID=sa; Password=Pa$$word09");



    int dia = Convert.ToInt16(DateTime.Today.Day.ToString());
    int mes = Convert.ToInt16(DateTime.Today.Month.ToString());
    int anio = Convert.ToInt16(DateTime.Today.Year.ToString());


    protected void Page_Load(object sender, EventArgs e)
    {


        if (!Page.IsPostBack)
        {

            //if (Session["name"] == null)
            //{
            //    // Response.Write("<script language=javascript>alert('ERROR: La Fecha Final no puede ser inferior a la Fecha Inicial, Fecha establecida al día de hoy')</script>");

            //    Session.Abandon();
            //    Response.Redirect("inicio.aspx");
            //}

            //lblSesion.Text = Session["name"].ToString();

            Calendar1.Visible = false;
            Calendar2.Visible = false;
            DivGrid.Visible = true;

            btnHideCalendar1.Visible = false;
            btnHideCalendar2.Visible = false;

            //lblFecha.Text = DateTime.Today.ToString("dddd " + DateTime.Today.ToString("dd") + "/MM/yyyy");

            divCargando.Visible = false;

            //  hoy();
            //    buscar2();
            //     rangoFecha();

            opcion2();

            lblTextoDePrueba.Text = "";

            //lblFechaInicio.Text = Calendar1.SelectedDate.ToString("MM/dd/yyyy");
            //lblFechaFin.Text = Calendar2.SelectedDate.ToString("MM/dd/yyyy");


            DivNoHayRegistros.Visible = false;



            //     String queryCount;



            //     queryCount = "SELECT  count(*) as num  FROM QTGC.dbo.ICG_TMP_Interface_Ventas_Pagos left join[192.168.2.11].QTGC.DBO.RM00101   ON I_vCUSTNMBR = CUSTNMBR COLLATE Modern_Spanish_CI_AS  WHERE CONVERT(DATE, I_vDOCDATE, 103) >= '" + Calendar1.SelectedDate.ToString("MM/dd/yyyy") + "' and CONVERT(DATE, I_vDOCDATE, 103) <= '" + Calendar2.SelectedDate.ToString("MM/dd/yyyy") + "'";
            ////     queryCount = "select * from MONEDAS";


            //     //////////////
            //     SqlConnection con2 = new SqlConnection(@"Data Source=192.168.20.2;Initial Catalog=QTGC;User ID=ICGAdmin;Password=masterkey");
            //     con2.Open();

            //     SqlCommand comCount = new SqlCommand(queryCount, con2);
            //    // con2.ConnectionString = @"Data Source=192.168.20.2;Initial Catalog=QTGC;User ID=ICGAdmin;Password=masterkey";



            //     comCount.CommandText = queryCount;
            //     comCount.Connection = con2;

            //     SqlDataReader dr = comCount.ExecuteReader();

            //     if (dr.Read())
            //     {
            //         lblCount.Text = dr["num"].ToString();
            //     }
            //     con2.Close();
            ///////////////////////////////////////////////////////            DivNoHayRegistros.Visible = false;


            //  txtFecha.Text = DateTime.Today.ToString("dd/MM/yyyy");
            //  txtFecha.Text = DateTime.Now.ToString();

            //  buscar();

            //lblFecha.Text = txtFecha.Text;
            // txtFecha.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
            //lblTextoDePrueba.Text = GridView1.Rows.Count.ToString();

            //  buscar_Click(new object(), new EventArgs());

        }

    }


    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the run time error "  
        //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
    }

    private void hoy()
    {


        // lblTextoDePrueba.Text = dia.ToString() + mes.ToString() + anio.ToString();

        Calendar2.TodaysDate = new DateTime(anio, mes, dia);
        Calendar2.SelectedDate = new DateTime(anio, mes, dia);

        Calendar1.TodaysDate = new DateTime(anio, mes, dia);
        Calendar1.SelectedDate = new DateTime(anio, mes, dia);

        TxtFechaFin.Text = Calendar2.SelectedDate.ToString("dd/MM/yyyy");
        txtFechaInicio.Text = Calendar2.SelectedDate.ToString("dd/MM/yyyy");
    }


    private void ValidarFecha()
    {
        if (/*Calendar2.SelectedDate.ToString() == "" &&*/ Calendar1.SelectedDate > Calendar2.SelectedDate)
        {
            Response.Write("<script language=javascript>alert('ERROR: La Fecha Final no puede ser inferior a la Fecha Inicial, Fecha establecida al día de hoy')</script>");

            //Calendar2.SelectedDate = Convert.ToDateTime(DateTime.Now.Date);
            //Calendar2.VisibleDate = Convert.ToDateTime(DateTime.Now.ToString());

            hoy();

            buscar2();

        }
    }


    private void cargando(string flag)
    {

        if (flag == "on")
        {
            divCargando.Visible = true;
        }

        if (flag == "off")
        {
            divCargando.Visible = false;
        }

    }

    private void buscar2()
    {


        //  cargando("on");

        ValidarFecha();
        // String queryCount;
        String query;
        String query2;


        //prueba = "select * from MONEDAS";

        //queryCount = "SELECT  count(*) as 'num' FROM QTGC.dbo.ICG_TMP_Interface_Ventas_Pagos left join[192.168.2.11].QTGC.DBO.RM00101   ON I_vCUSTNMBR = CUSTNMBR COLLATE Modern_Spanish_CI_AS  WHERE CONVERT(DATE, I_vDOCDATE, 103) >= '" + Calendar1.SelectedDate.ToString("MM/dd/yyyy") + "' and CONVERT(DATE, I_vDOCDATE, 103) <= '" + Calendar2.SelectedDate.ToString("MM/dd/yyyy") + "'"; 

        query = "SELECT grp_Descripcion as Grupo , A.EMP_NUMDOC as Cedula, (A.EMP_APELLIDOS + ' ' + A.EMP_NOMBRES) as Nombres, CONVERT(VARCHAR(10),b.CON_FECHACREACION,105) as Fecha , d.ser_descripcion as  Consumo, b.CON_CANTIDAD as Cantidad, CASE DATEPART(DW,b.CON_FECHACREACION) WHEN '1' THEN 'Domingo' WHEN '2' THEN 'Lunes' WHEN '3' THEN 'Martes' WHEN '4' THEN 'Miercoles' WHEN '5' THEN 'Jueves' WHEN '6' THEN 'Viernes' WHEN '7' THEN 'Sabado' ELSE 'revisar dia' END as DiaSemana FROM  EMPLEADO as a left join CONSUMO as b  on (a.emp_codigo = b.emp_codigo) LEFT JOIN GRUPO as c ON (a.GRP_CODIGO = c.grp_Codigo)  left join SERVICIOS as d on ( b.SER_CODIGO = d.ser_codigo) WHERE (b.CON_FECHACREACION >= '2020-02-26' ) and (b.CON_FECHACREACION <= '2020-03-16') ORDER BY c.grp_Descripcion desc , a.EMP_NUMDOC desc ,FECHA , d.SER_CODIGO";

        query2 = "SELECT grp_Descripcion as Grupo , A.EMP_NUMDOC as Cedula, (A.EMP_APELLIDOS + ' ' + A.EMP_NOMBRES) as Nombres, CONVERT(VARCHAR(10),b.CON_FECHACREACION,105) as Fecha , d.ser_descripcion as  Consumo, b.CON_CANTIDAD as Cantidad, CASE DATEPART(DW,b.CON_FECHACREACION) WHEN '1' THEN 'Domingo' WHEN '2' THEN 'Lunes' WHEN '3' THEN 'Martes' WHEN '4' THEN 'Miercoles' WHEN '5' THEN 'Jueves' WHEN '6' THEN 'Viernes' WHEN '7' THEN 'Sabado' ELSE 'revisar dia' END as DiaSemana FROM  EMPLEADO as a left join CONSUMO as b  on (a.emp_codigo = b.emp_codigo) LEFT JOIN GRUPO as c ON (a.GRP_CODIGO = c.grp_Codigo)  left join SERVICIOS as d on ( b.SER_CODIGO = d.ser_codigo) WHERE (b.CON_FECHACREACION >= '"+ Calendar1.SelectedDate.ToString("MM/dd/yyyy") +"' ) and (b.CON_FECHACREACION <= '"+ Calendar2.SelectedDate.ToString("MM/dd/yyyy") + "') ORDER BY c.grp_Descripcion desc , a.EMP_NUMDOC desc ,FECHA , d.SER_CODIGO";

        //if (CheckBoxPrepago.Checked == true)
        //{
        //    query = "SELECT ROW_NUMBER() OVER(ORDER BY CONVERT(DATE, I_vDOCDATE, 103) ASC) AS '#', I_vSOPNUMBE as 'Número de Doc', I_vCUSTNMBR as 'Código', isnull(stmtname, '') as 'Nombre', I_vSHRTNAME as 'Dócumento', I_vDOCDATE as 'Fecha', I_vDOCAMNT as 'Valor', I_vRCTNCCRD 'Número de Tajeta', I_vAUTHCODE 'Autorización', I_vLOCNCODE 'Ambiente', LOTE, VOUCHER, ESTABLECIMIENTO, DESCRIPCION as 'Tipo de pago', DESCRIPCION_SRI as 'Descripción SRI', VALOR_IVA as 'Valor IVA' FROM QTGC.dbo.ICG_TMP_Interface_Ventas_Pagos left join[192.168.2.11].QTGC.DBO.RM00101   ON I_vCUSTNMBR = CUSTNMBR COLLATE Modern_Spanish_CI_AS  WHERE CONVERT(DATE, I_vDOCDATE, 103) >= '" + Calendar1.SelectedDate.ToString("MM/dd/yyyy") + "' and CONVERT(DATE, I_vDOCDATE, 103) <= '" + Calendar2.SelectedDate.ToString("MM/dd/yyyy") + "' and DESCRIPCION = 'TARJETA PREPAGO'";

        //}
        //else
        //{
        //    query = "SELECT ROW_NUMBER() OVER(ORDER BY CONVERT(DATE, I_vDOCDATE, 103) ASC) AS '#', I_vSOPNUMBE as 'Número de Doc', I_vCUSTNMBR as 'Código', isnull(stmtname, '') as 'Nombre', I_vSHRTNAME as 'Dócumento', I_vDOCDATE as 'Fecha', I_vDOCAMNT as 'Valor', I_vRCTNCCRD 'Número de Tajeta', I_vAUTHCODE 'Autorización', I_vLOCNCODE 'Ambiente', LOTE, VOUCHER, ESTABLECIMIENTO, DESCRIPCION as 'Tipo de pago', DESCRIPCION_SRI as 'Descripción SRI', VALOR_IVA as 'Valor IVA' FROM QTGC.dbo.ICG_TMP_Interface_Ventas_Pagos left join[192.168.2.11].QTGC.DBO.RM00101   ON I_vCUSTNMBR = CUSTNMBR COLLATE Modern_Spanish_CI_AS  WHERE CONVERT(DATE, I_vDOCDATE, 103) >= '" + Calendar1.SelectedDate.ToString("MM/dd/yyyy") + "' and CONVERT(DATE, I_vDOCDATE, 103) <= '" + Calendar2.SelectedDate.ToString("MM/dd/yyyy") + "'";

        //}



        SqlDataAdapter da = new SqlDataAdapter(query2, con);
        DataTable dt = new DataTable();

        try
        {
            da.Fill(dt);

        }

        catch (Exception err)
        {
            Response.Write("<script language=javascript>alert('ERROR: SELECCIONE UNA FECHA.')</script>");
        }




        this.GridView1.DataSource = dt;
        GridView1.DataBind();

        lblTextoDePrueba.Text = GridView1.Rows.Count.ToString();
        rangoFecha();


        if (GridView1.Rows.Count == 0)
        {
            DivNoHayRegistros.Visible = true;
        }
        else
        {
            DivNoHayRegistros.Visible = false;
        }

        //   
    }

    protected void buscar_Click(object sender, EventArgs e)
    {

        buscar2();

    }






    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
        btnHideCalendar1.Visible = true;
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Calendar2.Visible = true;
        btnHideCalendar2.Visible = true;
    }

    private void Export()
    {

        if (txtFechaInicio.Text == "")
        {
            Response.Write("<script language=javascript>alert('ERROR: SELECCIONE UNA FECHA.')</script>");
        }

        else
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Reporte_" + Calendar1.SelectedDate.ToString("dd/MM/yyyy") + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);



            //GridView1.CssClass = "textmode";
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;

            GridView1.RenderControl(htmltextwrtter);

            //string style = @"<style> .textmode { } </style>";
            //Response.Write(style);
            Response.Output.Write(strwritter.ToString());
            Response.Flush();


            Response.Write(strwritter.ToString());


            Response.End();
        }
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        //   this.BindGrid();

    }

    private void BindGrid()
    {
        string strConnString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Customers"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
    }



    protected void Export2(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Reporte_Almuerzos_" + DateTime.Today.ToString("dd/MM/yyyy") + ".xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            GridView1.AllowPaging = false;
            //   this.BindGrid();

            GridView1.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = Color.Beige;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView1.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridView1.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

    }

    public void Exportar3(object sender, EventArgs e)
    {
        Response.Clear();

        Response.Buffer = true;



        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");

        Response.Charset = "";

        Response.ContentType = "application/vnd.ms-excel";

        StringWriter sw = new StringWriter();

        HtmlTextWriter hw = new HtmlTextWriter(sw);



        GridView1.AllowPaging = false;

        GridView1.DataBind();



        //Change the Header Row back to white color

        GridView1.HeaderRow.Style.Add("background-color", "#FFFFFF");



        //Apply style to Individual Cells

        GridView1.HeaderRow.Cells[0].Style.Add("background-color", "green");

        GridView1.HeaderRow.Cells[1].Style.Add("background-color", "green");

        GridView1.HeaderRow.Cells[2].Style.Add("background-color", "green");

        GridView1.HeaderRow.Cells[3].Style.Add("background-color", "green");



        for (int i = 0; i < GridView1.Rows.Count; i++)

        {

            GridViewRow row = GridView1.Rows[i];



            //Change Color back to white

            row.BackColor = System.Drawing.Color.White;



            //Apply text style to each Row

            row.Attributes.Add("class", "textmode");



            //Apply style to Individual Cells of Alternating Row

            if (i % 2 != 0)

            {

                row.Cells[0].Style.Add("background-color", "#C2D69B");

                row.Cells[1].Style.Add("background-color", "#C2D69B");

                row.Cells[2].Style.Add("background-color", "#C2D69B");

                row.Cells[3].Style.Add("background-color", "#C2D69B");

            }

        }

        GridView1.RenderControl(hw);



        //style to format numbers to string

        string style = @"<style> .textmode { mso-number-format:\@; } </style>";

        Response.Write(style);

        Response.Output.Write(sw.ToString());

        Response.Flush();

        Response.End();
    }



    protected void Exportar_Click(object sender, ImageClickEventArgs e)
    {
        //Export2();
    }


    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

        DivGrid.Visible = true;
        btnHideCalendar1.Visible = false;
        Calendar1.Visible = false;
        ValidarFecha();
        //buscar_Click(new object(), new EventArgs());
        //   buscar2();
        //    lblFechaInicio.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
        //   txtFechaInicio.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
        rangoFecha();
    }



    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {

        DivGrid.Visible = true;
        btnHideCalendar2.Visible = false;
        Calendar2.Visible = false;

        ValidarFecha();

        //buscar_Click(new object(), new EventArgs());
        //   buscar2();
        //   lblFechaFin.Text = Calendar2.SelectedDate.ToString("dd/MM/yyyy");
        //   TxtFechaFin.Text = Calendar2.SelectedDate.ToString("dd/MM/yyyy");

        rangoFecha();

    }

    private void rangoFecha()
    {

        //lblFechaFin.Text = Calendar2.SelectedDate.ToString("dd/MM/yyyy");
        TxtFechaFin.Text = Calendar2.SelectedDate.ToString("dd/MM/yyyy");

        //lblFechaInicio.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
        txtFechaInicio.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");

    }

    protected void btnHideCalendar1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = false;
        btnHideCalendar1.Visible = false;
    }

    protected void btnHideCalendar2_Click(object sender, EventArgs e)
    {
        Calendar2.Visible = false;
        btnHideCalendar2.Visible = false;


    }

    protected void btnSalir_Click(object sender, EventArgs e)
    {

        Session.Abandon();
        Response.Redirect("inicio.aspx");


    }

    //public void CopyClipBoard()
    //{
    //    if(GridView1.Rows.Count > 0)
    //    {
    //        try
    //        {
    //            // Add the selection to the clipboard.
    //            Clipboard.SetDataObject( this.DataGridView1.GetClipboardContent());

    //            // Replace the text box contents with the clipboard text.
    //            this.TextBox1.Text = Clipboard.GetText();
    //        }
    //        catch (System.Runtime.InteropServices.ExternalException)
    //        {
    //            this.TextBox1.Text =
    //                "The Clipboard could not be accessed. Please try again.";
    //        }
    //    }
    //}


    private void opcion1()
    {
        ImageButton1.Visible = false;
        ImageButton3.Visible = false;
        //txtFechaInicio.Text = "01/01/2019";
        //TxtFechaFin.Text = DateTime.Today.ToString("dd/MM/yyyy");

        Calendar1.TodaysDate = new DateTime(2020, 1, 1);
        Calendar1.SelectedDate = new DateTime(2020, 1, 1);

        Calendar2.TodaysDate = new DateTime(anio, mes, dia);
        Calendar2.SelectedDate = new DateTime(anio, mes, dia);



        txtFechaInicio.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
        TxtFechaFin.Text = Calendar2.SelectedDate.ToString("dd/MM/yyyy");








    }
    private void opcion2()
    {
        ImageButton1.Visible = true;
        ImageButton3.Visible = true;
        hoy();
    }

    protected void RbtnOpcion1_CheckedChanged(object sender, EventArgs e)
    {

        opcion1();
    }



    protected void RbtnOpcion2_CheckedChanged(object sender, EventArgs e)
    {

        opcion2();
    }

}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


public partial class reporte : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(@"Data Source=192.168.2.17;Initial Catalog=SISEGQT;User ID=sa;Password=Pa$$word");

    

    int dia = Convert.ToInt16(DateTime.Today.Day.ToString());
    int mes = Convert.ToInt16(DateTime.Today.Month.ToString());
    int anio = Convert.ToInt16(DateTime.Today.Year.ToString());


    protected void Page_Load(object sender, EventArgs e)
    {
       

        if (!Page.IsPostBack)
        {
            
            Calendar1.Visible = false;
            Calendar2.Visible = false;
            DivGrid.Visible = true;

            btnHideCalendar1.Visible = false;
            btnHideCalendar2.Visible = false;

            hoy();
            buscar2();
            rangoFecha();

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


    private void buscar2()
    {

        ValidarFecha();
      //  txtFecha.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
       String ConsultaIngresos = "SELECT  /*1*/ CONVERT(VARCHAR(10), vist_HoraIngreso, 101) AS Fecha, /*2*/convert(varchar, VIST.vist_HoraIngreso, 108) as Hora,/*3*/  SOCIO.soc_Codigo AS Código, /*4*/	SOCIO.soc_Titular  as Socio, /*5*/CASE WHEN [vist_estado] ='A' THEN 'AUTORIZADO'  ELSE 'DENEGADO' END AS Estado, /*6*/TERM.TER_DESCRIPCION as 'Ingreso Garita'/*8*/ , VIST.vist_Auxi1 AS 'Visita Comentario' FROM dbo.VISITA AS VIST INNER JOIN dbo.SOCIO AS SOCIO ON VIST.soc_Codigo = SOCIO.soc_Codigo INNER JOIN dbo.TERMINAL AS TERM ON TERM.TER_CODIGO = VIST.vist_TC WHERE VIST.vist_HoraIngreso >= '" + Calendar1.SelectedDate.ToString("dd/MM/yyyy") + " 00:00:00' and VIST.vist_HoraIngreso <= '" + Calendar2.SelectedDate.ToString("dd/MM/yyyy") + " 23:59:00' ORDER BY Fecha , hora";
 //       String ConsultaIngresos = "SELECT  /*1*/ CONVERT(VARCHAR(10), vist_HoraIngreso, 101) AS Fecha, /*2*/convert(varchar, VIST.vist_HoraIngreso, 108) as Hora,/*3*/  SOCIO.soc_Codigo AS Código, /*4*/	SOCIO.soc_Titular  as Socio, /*5*/CASE WHEN [vist_estado] ='A' THEN 'AUTORIZADO'  ELSE 'DENEGADO' END AS Estado, /*6*/TERM.TER_DESCRIPCION as 'Ingreso Garita'/*8*/ , VIST.vist_Auxi1 AS 'Visita Comentario' FROM dbo.VISITA AS VIST INNER JOIN dbo.SOCIO AS SOCIO ON VIST.soc_Codigo = SOCIO.soc_Codigo INNER JOIN dbo.TERMINAL AS TERM ON TERM.TER_CODIGO = VIST.vist_TC WHERE VIST.vist_HoraIngreso >= '" + txtFecha.Text + " 00:00:00' and VIST.vist_HoraIngreso <= '" + txtFecha.Text + " 23:59:00' ORDER BY hora";

        // SqlCommand query = new SqlCommand(ConsultaIngresos, );

        SqlDataAdapter da = new SqlDataAdapter(ConsultaIngresos, con);
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
        //  lblFecha.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
        //  txtFecha.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
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

        if(txtFechaInicio.Text=="")
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
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
    }


    protected void Exportar_Click(object sender, ImageClickEventArgs e)
    {
        Export();
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

        lblFechaFin.Text = Calendar2.SelectedDate.ToString("dd/MM/yyyy");
        TxtFechaFin.Text = Calendar2.SelectedDate.ToString("dd/MM/yyyy");

        lblFechaInicio.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
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
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnReporte_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("reporte.aspx");
    }

    protected void btnInvitados_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("RegistrarInvitados.aspx");
    }

    protected void btnRegistrar_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("RegistrarSocios.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration; // this namespace is add I am adding connection name in web config file config connection name 

public partial class Auditoria_pages_Inicio : System.Web.UI.Page
{
   
   
    SqlConnection con1 = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DatabaseServiciosIT.mdf;Integrated Security=True");



    private void loginSQL()
    {

       
         try
         {
        con1.Open();


        string qry2 = "select * from Usuario where nombre_usr = '"+ txtUser.Text + "' and  pass_usr ='" + txtPass.Text + "'";
        //                string qry = "select * from Usuarios where id_usr ='" + txtUser.Text + "' and Password='" + txtPass.Text + "'";

        SqlCommand cmd = new SqlCommand(qry2, con1);
        SqlDataReader sdr = cmd.ExecuteReader();

        if (sdr.Read())
        {
          

                Session["name"] = sdr["nombre_usr"].ToString();
                Response.Redirect("TarjetasPrepago.aspx");
            }
        else
        {
                txtUser.Text = "";
                txtPass.Text = "";

                txtUser.Style.Add("border-width", "2px");
                txtUser.Style.Add("border-color", "red");

                txtPass.Style.Add("border-width", "2px");
                txtPass.Style.Add("border-color", "red");

                divFailedLogin.Visible = true;

            }



        }
        catch(Exception ex)
        {
            Response.Write(ex.Message);
        }

        con1.Close();

    }
    protected void Page_Load(object sender, EventArgs e)
    {
       // SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
      

//             public SqlConnection con = new SqlConnection(@"Data Source=192.168.20.2;Initial Catalog=QTGC;User ID=ICGAdmin;Password=masterkey");

   


        if (!Page.IsPostBack)
        {
            divFailedLogin.Visible = false;
            


        }




    }

   

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        loginSQL();
    }
}
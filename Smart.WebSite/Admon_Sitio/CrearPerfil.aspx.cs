using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Smart.WebSite.srAdmonSitio;

namespace Smart.WebSite.Admon_Sitio
{
    public partial class CrearPerfiles : System.Web.UI.Page
    {
        AdmonSitioContractClient rsAdmonSitio = new AdmonSitioContractClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            try
            {
                //Agregar perfil
                int PerfilID = 0;
                Perfiles_BE perfil = getPerfil();
                PerfilID = rsAdmonSitio.insert_Perfiles(perfil);
                lblMensajes.Text = "Perfil agregado ID: " + PerfilID.ToString() + "<br />";               
            }
            catch (Exception ex)
            {
                lblMensajes.Text = ex.Message;
            }
        }

        private Perfiles_BE getPerfil()
        {
            Perfiles_BE perfil = new Perfiles_BE();
            perfil.Funcion = tbFuncion.Text;
            perfil.Descripcion = tbDescripcion.Text;
            return perfil;
        }
    }
}
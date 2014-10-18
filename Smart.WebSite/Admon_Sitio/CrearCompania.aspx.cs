using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Smart.WebSite.srTest;
using Smart.WebSite.srAdmonSitio;
using System.Web.Management;
using System.Web.Configuration;
using System.Net.Mail;
using System.Net;

using Smart.WebSite.log;
using System.Xml.Serialization;
using System.IO;
using System.Globalization;
using System.Diagnostics;
using System.Linq.Expressions;
using Smart.WebSite.Helper;

namespace Smart.WebSite
{
    public partial class Default : System.Web.UI.Page
    {
        ServiceContractClient rsTest = new ServiceContractClient();
        AdmonSitioContractClient rsAdmonSitio = new AdmonSitioContractClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Usuario"] = "Victor Pineda";
                bitacoraIngreso();
            }
        }

        /// <summary>
        /// Se crea el registro, en bitácora, del usuario en la forma
        /// </summary>
        private void bitacoraIngreso()
        {
            logFactory bitacoraIngreso = new logFactory();
            try
            {
                bitacoraIngreso.bitacoraIngreso(nombreClase() + " - " + TipoAccion.Ingreso, TipoAccion.Ingreso);
            }
            catch (Exception ex)
            {
                lblMensajes.Text = ex.Message;
            }
        }
        
        /// <summary>
        /// Creación de compañía. El proceso es: 1 Agregar el registro compañía; 2 Agregar el membershipo en la base de datos;
        /// 3 Crear los perfiles mínimos para la administración y 4 Enviar correo de notificación al contacto
        /// </summary>
        protected void btnCrear_Click(object sender, EventArgs e)
        {
            CompaniasBitacoraAcciones_BE company = new CompaniasBitacoraAcciones_BE();
            company = accionesCompanias;
            
            try
            {
                //Agregar compania
                agregarCompania();
                
                //Agregar BD membership
                agregarMembership();
                
                //Crear perfiles [Pendiente, primero creación de perfiles]
                company.AgregarPerfil = false;

                //Enviar correo
                envioCorreo(tbCorreoContacto.Text);

                envioAcciones();

            }
            catch (Exception ex)
            {
                lblMensajes.Text = ex.Message;                
            }
                        
        }

        /// <summary>
        /// Se agrega la compañía en BD. Paso 1 del proceso de creación de compañia
        /// </summary>
        private void agregarCompania()
        {
            Dictionary<string, string> parametros = new Dictionary<string, string>();
            CompaniasBitacoraAcciones_BE company = new CompaniasBitacoraAcciones_BE();
            company = accionesCompanias;

            try
            {
                int CompaniaID = 0;
                Companias_BE compania = getCompania();
                CompaniaID = rsAdmonSitio.insert_Companias(compania);
                
                company.AgregarCompania = true;
                company.CompaniaId = CompaniaID;
                accionesCompanias = company;
            
                lblMensajes.Text = "Compania agregada ID: " + CompaniaID.ToString() + "<br />";               
              
                parametros.Add(NombrePropiedades.CompaniaNombrePropiedades.RazonSocial, compania.RazonSocial);
                parametros.Add(NombrePropiedades.CompaniaNombrePropiedades.Descripcion, compania.Descripcion);
                parametros.Add(NombrePropiedades.CompaniaNombrePropiedades.RFC, compania.RFC);
                parametros.Add(NombrePropiedades.CompaniaNombrePropiedades.NombreBD, compania.NombreBD);
                parametros.Add(NombrePropiedades.CompaniaNombrePropiedades.CorreoContacto, compania.CorreoContacto);
                parametros.Add(NombrePropiedades.CompaniaNombrePropiedades.NombreContacto, compania.NombreContacto);

                registroEventos(nombreClase() + " - " + TipoAccion.Crear, TipoAccion.Crear, nombreMetodo(), parametros);
               
            }
            catch (Exception ex)
            {
                registroError(nombreClase() + " - " + TipoAccion.Crear, TipoAccion.Crear, nombreMetodo(), ex, parametros);
                company.AgregarCompania = false;               
                accionesCompanias = company;
              
                lblMensajes.Text =      "Clase: " + nombreClase() + "<br />" +
                                        "Método: " + nombreMetodo() + "<br />" +
                                        "Mensaje de error: " + ex.Message + "<br />" +
                                        "Pila del error: " + ex.StackTrace;    
            }
            
        }

        /// <summary>
        /// Se agrega el membership de la admón. de la compañia creada. Paso 2 del proceso de creación de compañia
        /// </summary>
        private void agregarMembership()
        {
            Dictionary<string, string> parametros = new Dictionary<string, string>();
            CompaniasBitacoraAcciones_BE company = new CompaniasBitacoraAcciones_BE();
            company = accionesCompanias;

            try 
	        {	        
		        //http://www.nullskull.com/a/1650/aspnet-integrating-customized-roles-membership-and-profiles-in-aspnet-40.aspx
                SqlServices.Install(Servidor(), Usuario(), Constraseña(), tbNombreBD.Text, SqlFeatures.All);
                company.AgregarMembership = true;         
                accionesCompanias = company;

                lblMensajes.Text += "Base de datos membership: " + tbNombreBD.Text + "<br />";

                parametros.Add(NombrePropiedades.CompaniaNombrePropiedades.NombreBD, tbNombreBD.Text);

                registroEventos(nombreClase() + " - " + TipoAccion.Crear, TipoAccion.Crear, nombreMetodo(), parametros);

	        }
	        catch (Exception ex)
	        {
                registroError(nombreClase() + " - " + TipoAccion.Crear, TipoAccion.Crear, nombreMetodo(), ex, parametros);
                company.AgregarMembership = false;
                accionesCompanias = company;

                lblMensajes.Text =      "Clase: " + nombreClase() + "<br />" +
                                        "Método: " + nombreMetodo() + "<br />" +
                                        "Mensaje de error: " + ex.Message + "<br />" +
                                        "Pila del error: " + ex.StackTrace;    
	        }
        }

        /// <summary>
        /// Método que devuelve los parámetros de la entidad compañía
        /// </summary>
        /// <returns></returns>
        private Companias_BE getCompania()
        {
            Companias_BE compania = new Companias_BE();
            compania.RazonSocial = tbRazonSocial.Text;
            compania.Descripcion = tbDescripcion.Text;
            compania.RFC = tbRFC.Text;
            compania.NombreBD = tbNombreBD.Text;
            compania.CorreoContacto = tbCorreoContacto.Text;
            compania.NombreContacto = tbNombreContacto.Text;
            return compania;
        }

        /// <summary>
        /// Envio de correo a contacto descrito en la creación de la compañía, . Paso 4 del proceso de creación de compañia
        /// </summary>
        /// <param name="correoPara"></param>
        private void envioCorreo(string correoPara)
        {
            //http://7sabores.com/blog/enviar-correo-electronico-mediante-smtp-csharp
            // Definir instancia de la clase MailMessage
            MailMessage email = new MailMessage();
            email.To.Add(new MailAddress(correoPara));
            email.From = new MailAddress(cuentaCorreo());
            email.Subject = "Envio credencial - acceso aplicaciones SMART";
            email.Body = "Prueba envío de correo <b> prueba </b>";
            email.IsBodyHtml = true;
            email.Priority = MailPriority.Normal;

            // Definir instancia SMTP
            SmtpClient smtp = new SmtpClient();
            smtp.Host = servidorCorreo();
            smtp.Port = Convert.ToInt32(puertoCorreo());
            smtp.EnableSsl = true;//Esto es para que vaya a través de SSL que es obligatorio con GMail
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential(usuarioCorreo(), contraseñaCorreo());

            Dictionary<string, string> parametros = new Dictionary<string, string>();
            CompaniasBitacoraAcciones_BE companiID = new CompaniasBitacoraAcciones_BE();
            CompaniasBitacoraAcciones_BE company = new CompaniasBitacoraAcciones_BE();
            company = accionesCompanias;

            parametros.Add("CorreoPara", correoPara);
            // Enviar correo 
            try
            {
                smtp.Send(email);
                email.Dispose();
                accionesCompanias.EnvioCorreo = true;
                company.EnvioCorreo = true;
                accionesCompanias = company;
                lblMensajes.Text = "Envio correcto de correo a cuenta: " + tbCorreoContacto.Text + "<br />";
                               
                registroEventos(nombreClase() + " - " + TipoAccion.EnvioCorreo, TipoAccion.EnvioCorreo, nombreMetodo(), parametros);
            }
            catch (Exception ex)
            {
                registroError(nombreClase() + " - " + TipoAccion.Crear, TipoAccion.Crear, nombreMetodo(), ex, parametros);
                company.EnvioCorreo = false;
                accionesCompanias = company;

                lblMensajes.Text =      "Clase: " + nombreClase() + "<br />" +
                                        "Método: " + nombreMetodo() + "<br />" +
                                        "Mensaje de error: " + ex.Message + "<br />" +
                                        "Pila del error: " + ex.StackTrace;            

            }
        }

        private void envioAcciones()
        {
            Dictionary<string, string> parametros = new Dictionary<string, string>();
            
            try
            {
                rsAdmonSitio.insert_CompaniasBitacoraAcciones(accionesCompanias);

                parametros.Add(NombrePropiedades.AccionesCompaniasPropiedades.CompaniaId, accionesCompanias.CompaniaId.ToString());
                parametros.Add(NombrePropiedades.AccionesCompaniasPropiedades.AgregarCompania, accionesCompanias.AgregarCompania.ToString());
                parametros.Add(NombrePropiedades.AccionesCompaniasPropiedades.AgregarMembership, accionesCompanias.AgregarMembership.ToString());
                parametros.Add(NombrePropiedades.AccionesCompaniasPropiedades.AgregarPerfil, accionesCompanias.AgregarPerfil.ToString());
                parametros.Add(NombrePropiedades.AccionesCompaniasPropiedades.EnvioCorreo, accionesCompanias.EnvioCorreo.ToString());
                registroEventos(nombreClase() + " - " + TipoAccion.AccionesCompania, TipoAccion.AccionesCompania, nombreMetodo(), parametros);
            }
            catch (Exception ex)
            {
                registroError(nombreClase() + " - " + TipoAccion.Crear, TipoAccion.Crear, nombreMetodo(), ex, parametros);

                lblMensajes.Text =      "Clase: " + nombreClase() + "<br />" +
                                        "Método: " + nombreMetodo() + "<br />" +
                                        "Mensaje de error: " + ex.Message + "<br />" +
                                        "Pila del error: " + ex.StackTrace;      
            }

        }

#region Test
        protected void btnCrears_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> parametros = new Dictionary<string, string>();
            parametros.Add("Parametro_c 1", "Arg 1");
            parametros.Add("Parametro_c 2", "Arg 2");
            parametros.Add("Parametro_c 3", "Arg 3");
            try
            {
                registroEventos(nombreClase() + " - " + TipoAccion.Crear, TipoAccion.Crear, nombreMetodo(), parametros);
            }
            catch (Exception ex)
            {
                lblMensajes.Text = ex.Message;
            }
        }        

        private void registroEventos(string modulo, TipoAccion _tipoAccion, string metodo, Dictionary<string, string> parametrosAccion = null)
        {
            logFactory _registroEventos = new logFactory();

            try
            {
                _registroEventos.bitacoraAccion(modulo, _tipoAccion, metodo, parametrosAccion);
            }
            catch (Exception ex)
            {
                lblMensajes.Text = ex.Message;
            }

        }

        private void registroError(string modulo, TipoAccion _tipoAccion, string metodo, Exception _ex, Dictionary<string, string> parametrosAccion = null)
        {
            logFactory _registroEventos = new logFactory();

            try
            {
                _registroEventos.bitacoraError(modulo, _tipoAccion, metodo, _ex, parametrosAccion);
            }
            catch (Exception ex)
            {
                lblMensajes.Text = ex.Message;
            }
        }

        protected void btnLeer_Click(object sender, EventArgs e)
        {
            try
            {
                registroEventos(nombreClase() + " - " + TipoAccion.Leer, TipoAccion.Leer, nombreMetodo());
            }
            catch (Exception ex)
            {
                lblMensajes.Text = ex.Message;
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> parametros = new Dictionary<string, string>();
            parametros.Add("Id_Actualizar", "Id");
            parametros.Add("Parametro_a 1", "Arg 1");
            parametros.Add("Parametro_a 2", "Arg 2");
            parametros.Add("Parametro_a 3", "Arg 3");
            try
            {
                registroEventos(nombreClase() + " - " + TipoAccion.Actualizar, TipoAccion.Actualizar, nombreMetodo(), parametros);
            }
            catch (Exception ex)
            {
                lblMensajes.Text = ex.Message;
            }

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> parametros = new Dictionary<string, string>();
            parametros.Add("Id_Eliminar", "Id");
            //string parametros = "ID";
            try
            {
                registroEventos(nombreClase() + " - " + TipoAccion.Eliminar, TipoAccion.Eliminar, nombreMetodo(), parametros);
            }
            catch (Exception ex)
            {
                lblMensajes.Text = ex.Message;
            }

        }
#endregion

#region Propiedades
        private string Servidor()
        {
            return WebConfigurationManager.AppSettings["Servidor"];
        }        
        private string Usuario()
        {
            return WebConfigurationManager.AppSettings["Usuario"];
        }        
        private string Constraseña()
        {
            return WebConfigurationManager.AppSettings["Contraseña"];
        }

        private string cuentaCorreo()
        {
            return WebConfigurationManager.AppSettings["cuentaCorreo"];
        }
        private string servidorCorreo()
        {
            return WebConfigurationManager.AppSettings["servidorCorreo"];
        }
        private string puertoCorreo()
        {
            return WebConfigurationManager.AppSettings["puertoCorreo"];
        }
        private string usuarioCorreo()
        {
            return WebConfigurationManager.AppSettings["usuarioCorreo"];
        }
        private string contraseñaCorreo()
        {
            return WebConfigurationManager.AppSettings["contraseñaCorreo"];
        }

        private string nombreClase()
        {
            return this.GetType().Name;
        }
        private string nombreMetodo()
        {
            StackTrace st = new StackTrace();
            StackFrame sf = st.GetFrame(1);
            return sf.GetMethod().Name;
        }

        private CompaniasBitacoraAcciones_BE accionesCompanias {
            get
            {
                if (ViewState["accionesCompanias"] != null)
                    return (CompaniasBitacoraAcciones_BE)(ViewState["accionesCompanias"]);
                else
                {
                    CompaniasBitacoraAcciones_BE obj = new CompaniasBitacoraAcciones_BE();
                    obj.CompaniaId = 0;
                    obj.AgregarCompania = false;
                    obj.AgregarMembership = false;
                    obj.AgregarPerfil = false;
                    obj.EnvioCorreo = false;
                    return obj;
                }
            }
            set
            {
                ViewState["accionesCompanias"] = value;
            }
        }
#endregion              
                
    }   
    
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Xml.Serialization;
using System.IO;
using System.Web.Configuration;
using System.Xml;

namespace Smart.WebSite.log
{
    public class Header
    {
        public string Fecha { get; set; }
        public string Modulo { get; set; }
        public string Usuario { get; set; }
    }
    
    public enum TipoAccion
    {
        Crear,
        Leer,
        Actualizar,
        Eliminar,
        Error,
        Ingreso, 
        EnvioCorreo,
        AccionesCompania
    }

    public enum ElementoXML
     {
         ingreso,
         header,
         tipoAccion,
         accion,
         error,
         detalleError
     }
    
    public enum ElementoXML_IngresoHeader
     {
         fecha,
         modulo,
         usuario

     }

    public enum ElementoXML_IngresoTipoAccion
     {
         tipoAccion
     }

    public class DetalleAccion
     {
         public string Metodo { get; set; }
         public Dictionary<string, string> Parametros { get; set; }
     }

    public enum ElementoXML_DetalleAccion
    {
        metodo,
        parametros,
        parametro
    }

    public class Error
     {
         public string MensajeError { get; set; }
         public string PilaError { get; set; }
     }

    public enum ElementoXML_Error
    {
        mensajeError,
        pilaError
    }
   
    public class Ingreso
    {
        public Header header { get; set; }
        public TipoAccion tipoAccion { get; set; }

    }

    public class Accion
    {
        public Ingreso ingreso { get; set; }
        public DetalleAccion detalle { get; set; }
    }

    public class Incidencia
    {
        public Accion accion { get; set; }
        public Error error { get; set; }        
    }

    public class logFactory
    {
        private Header getHeader(string modulo)
        {
            Header header = new Header();
            DateTime fecAct = DateTime.Now;
            header.Fecha = fecAct.ToShortDateString() + " " + fecAct.ToShortTimeString();
            header.Modulo = modulo;
            HttpContext usuario = HttpContext.Current;
            header.Usuario = usuario.Session["Usuario"].ToString();
            return header;
        }

        private Ingreso getingreso(string modulo, TipoAccion tipoAccion)
        {
            Header header = getHeader(modulo);
            Ingreso ingreso = new Ingreso();
            ingreso.header = new Header();
            ingreso.header = header;
            ingreso.tipoAccion = tipoAccion;
            return ingreso;
        }

        private XmlDocument XMLDoc;

        private XmlElement getIngresoElement(string modulo, TipoAccion _tipoAccion)
        {
            //Crear elemento ingreso
            Ingreso objIngreso = new Ingreso();
            objIngreso = getingreso(modulo, _tipoAccion);
            XmlElement ingresoElement = XMLDoc.CreateElement(ElementoXML.ingreso.ToString());

            //Crear elemento header            
            XmlElement headerElement = XMLDoc.CreateElement(ElementoXML.header.ToString());

            XmlElement fechaElement = XMLDoc.CreateElement(ElementoXML_IngresoHeader.fecha.ToString());
            XmlText fechaAttr = XMLDoc.CreateTextNode(objIngreso.header.Fecha);
            fechaElement.AppendChild(fechaAttr);

            XmlElement moduloElement = XMLDoc.CreateElement(ElementoXML_IngresoHeader.modulo.ToString());
            XmlText moduloAttr = XMLDoc.CreateTextNode(objIngreso.header.Modulo);
            moduloElement.AppendChild(moduloAttr);

            XmlElement usuarioElement = XMLDoc.CreateElement(ElementoXML_IngresoHeader.usuario.ToString());
            XmlText usuarioAttr = XMLDoc.CreateTextNode(objIngreso.header.Usuario);
            usuarioElement.AppendChild(usuarioAttr);

            headerElement.AppendChild(fechaElement);
            headerElement.AppendChild(moduloElement);
            headerElement.AppendChild(usuarioElement);

            //Crear elemento tipo acción                        
            XmlElement tipoAccionElement = XMLDoc.CreateElement(ElementoXML_IngresoTipoAccion.tipoAccion.ToString());
            XmlText tipoAccionAtt = XMLDoc.CreateTextNode(objIngreso.tipoAccion.ToString());
            tipoAccionElement.AppendChild(tipoAccionAtt);

            //Agregar elemento header a ingreso
            ingresoElement.AppendChild(headerElement);
            //Agregar tipo accion a ingreso
            ingresoElement.AppendChild(tipoAccionElement);

            return ingresoElement;
        }

        DetalleAccion getDetalleAccion(string metodo, Dictionary<string,string> parametrosAccion)
        {
            DetalleAccion detalleAccion = new DetalleAccion();
            detalleAccion.Metodo = metodo;
            detalleAccion.Parametros = new Dictionary<string, string>();
            detalleAccion.Parametros = parametrosAccion;

            return detalleAccion;
        }

        private XmlElement getAccionElement(string modulo, TipoAccion _tipoAccion, string _metodo, Dictionary<string, string> parametrosAccion)
        {
            //Crear elemento  detalle accion
            DetalleAccion objDetalleAccion = new DetalleAccion();
            objDetalleAccion = getDetalleAccion(_metodo, parametrosAccion);            
            XmlElement detalleAccionElement = XMLDoc.CreateElement(ElementoXML.tipoAccion.ToString());
            
            //Crear elemento metodo
            XmlElement metodoElement = XMLDoc.CreateElement(ElementoXML_DetalleAccion.metodo.ToString());
            XmlText metodoAtt = XMLDoc.CreateTextNode(objDetalleAccion.Metodo.ToString());
            metodoElement.AppendChild(metodoAtt);

            //Crear elemento parametros
            XmlElement parametrosElement = XMLDoc.CreateElement(ElementoXML_DetalleAccion.parametros.ToString());

            if (objDetalleAccion.Parametros != null)
            {
                if (objDetalleAccion.Parametros.Count > 0)
                {
                    foreach (var parametro in objDetalleAccion.Parametros)
                    {
                        XmlElement parametroElement = XMLDoc.CreateElement(ElementoXML_DetalleAccion.parametro.ToString());
                        parametroElement.SetAttribute("NombreParametro", parametro.Key);
                        XmlText parametroTxt = XMLDoc.CreateTextNode(parametro.Value.ToString());                        
                        parametroElement.AppendChild(parametroTxt);
                        parametrosElement.AppendChild(parametroElement);
                    }
                }
            }

            //Agregar metodo en detalle acción
            detalleAccionElement.AppendChild(metodoElement);
            //Agregar parameteros en detalle acción
            detalleAccionElement.AppendChild(parametrosElement);

            XmlElement ingresoElement = getIngresoElement(modulo, _tipoAccion);            
            XmlElement accionElement = XMLDoc.CreateElement(ElementoXML.accion.ToString());

            //agregar ingreso a accion
            accionElement.AppendChild(ingresoElement);
            //agregar detalle accion a acción
            accionElement.AppendChild(detalleAccionElement);

            return accionElement;
        }

        private XmlElement getErrorElement(string modulo, TipoAccion _tipoAccion, string metodo, Exception _ex, Dictionary<string, string> parametrosAccion)
        {
            //Crear elemento mensaje
            XmlElement errorMensajeElement = XMLDoc.CreateElement(ElementoXML_Error.mensajeError.ToString());
            errorMensajeElement.SetAttribute("NombreParametro", ElementoXML_Error.mensajeError.ToString());
            XmlText errorMensajeTxt = XMLDoc.CreateTextNode(_ex.Message);
            errorMensajeElement.AppendChild(errorMensajeTxt);

            //Crear elemento pila error
            XmlElement errorPilaMensajeElement = XMLDoc.CreateElement(ElementoXML_Error.pilaError.ToString());
            errorPilaMensajeElement.SetAttribute("NombreParametro", ElementoXML_Error.pilaError.ToString());
            XmlText errorPilaMensajeTxt = XMLDoc.CreateTextNode(_ex.StackTrace);
            errorPilaMensajeElement.AppendChild(errorPilaMensajeTxt);

            //Crear elemento acción
            XmlElement accionElement = getAccionElement(modulo, _tipoAccion, metodo, parametrosAccion);

            //Crear elemento detalle error
            XmlElement detalleError = XMLDoc.CreateElement(ElementoXML.detalleError.ToString());            

            //Crear elemento error
            XmlElement errorElement = XMLDoc.CreateElement(ElementoXML.error.ToString());

            //Agregar mensaje error a detalle error
            detalleError.AppendChild(errorMensajeElement);
            //Agregar pila error a detalle error
            detalleError.AppendChild(errorPilaMensajeElement);
            //Agregar accion a error
            errorElement.AppendChild(accionElement);
            //Agregar detalle error a erro
            errorElement.AppendChild(detalleError);            
            return errorElement;
        }

        public void bitacoraIngreso(string modulo, TipoAccion _tipoAccion)
        {
            //http://www.devx.com/tips/Tip/21168
            string res = "";
            //Verififcar existencia de archivo XML
            string ruta = @repositorio();
            string fileXml = @archivoRepositorio();
            string rutaXML = @ruta + @fileXml;          
            try
            {
                validaExistenciaDirFile(ruta, fileXml);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            //Carga archivo
            try
            {
                
                XMLDoc= new XmlDocument();          
                XMLDoc.Load(@rutaXML);

            }
            catch (Exception ex)
            {
               throw new Exception("Eror guardando log, mensaje: " + ex.Message + "<br />" + "Pila del error: " +  ex.StackTrace + "<br />");               
            }
          

            //Obtener elemento raíz
            string raiz = elementoRaizXML();
            XmlNode log = XMLDoc.SelectSingleNode(raiz);

            XmlElement ingresoElement = getIngresoElement(modulo, _tipoAccion);

            //Agregar ingreso a raiz
            log.AppendChild(ingresoElement);
            XMLDoc.DocumentElement.PrependChild(ingresoElement);
            //Cerra archivo
            XMLDoc.Save(ruta + fileXml);
            
            
        }

        public void bitacoraAccion(string modulo, TipoAccion _tipoAccion, string metodo, Dictionary<string, string> parametrosAccion = null)
        {
            //http://www.devx.com/tips/Tip/21168
            string res = "";
            //Verififcar existencia de archivo XML
            string ruta = @repositorio();
            string fileXml = @archivoRepositorio();
            string rutaXML = @ruta + @fileXml;
            try
            {
                validaExistenciaDirFile(ruta, fileXml);
            }
            catch (Exception ex)
            {
               throw ex;
            }

            //Carga archivo
            try
            {

                XMLDoc = new XmlDocument();
                XMLDoc.Load(@rutaXML);

            }
            catch (Exception ex)
            {
                throw new Exception("Eror guardando log, mensaje: " + ex.Message + "<br />" + "Pila del error: " + ex.StackTrace + "<br />");                
            }


            //Obtener elemento raíz
            string raiz = elementoRaizXML();
            XmlNode log = XMLDoc.SelectSingleNode(raiz);

            XmlElement accionElement = getAccionElement(modulo, _tipoAccion, metodo, parametrosAccion);

            //Agregar acción a raiz
            log.AppendChild(accionElement);
            XMLDoc.DocumentElement.PrependChild(accionElement);
            //Cerra archivo
            XMLDoc.Save(ruta + fileXml);          
        }

        public void bitacoraError(string modulo, TipoAccion _tipoAccion, string metodo, Exception _ex, Dictionary<string, string> parametrosAccion = null)
        {
            //http://www.devx.com/tips/Tip/21168
            string res = "";
            //Verififcar existencia de archivo XML
            string ruta = @repositorio();
            string fileXml = @archivoRepositorio();
            string rutaXML = @ruta + @fileXml;
            try
            {
                validaExistenciaDirFile(ruta, fileXml);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            //Carga archivo
            try
            {

                XMLDoc = new XmlDocument();
                XMLDoc.Load(@rutaXML);

            }
            catch (Exception ex)
            {
                throw new Exception("Eror guardando log, mensaje: " + ex.Message + "<br />" + "Pila del error: " + ex.StackTrace + "<br />");
            }


            //Obtener elemento raíz
            string raiz = elementoRaizXML();
            XmlNode log = XMLDoc.SelectSingleNode(raiz);

            XmlElement errorElement = getErrorElement(modulo, _tipoAccion, metodo, _ex, parametrosAccion);

            //Agregar acción a raiz
            log.AppendChild(errorElement);
            XMLDoc.DocumentElement.PrependChild(errorElement);
            //Cerra archivo
            XMLDoc.Save(ruta + fileXml);          
        }

        private void validaExistenciaDirFile(string ruta , string fileXML)
        {           
            try
            {            
                //Verificar existencia de directorio
                if (Directory.Exists(ruta) == false)
                    Directory.CreateDirectory(repositorio());
                
           }
            catch (Exception ex)
            {                
                throw new Exception("Error ren la creacion de directorio del log, mensaje: " + ex.Message + "<br />" + "Pila del error: " + ex.StackTrace + "<br />");
            }

            try
            {
                if (File.Exists(ruta + fileXML) == false)
                {
                    XmlDocument docXML = new XmlDocument();
                    //Crear header
                    XmlDeclaration header = docXML.CreateXmlDeclaration("1.0", "utf-8", null);
                    //Crear elemento raíz, log
                    XmlElement raiz = docXML.CreateElement("log");
                    docXML.InsertBefore(header, docXML.DocumentElement);
                    docXML.AppendChild(raiz);
                    docXML.Save(ruta + fileXML);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error ren la creacion de archivo del log, mensaje: " + ex.Message + "<br />" + "Pila del error: " + ex.StackTrace + "<br />");
            }
        }

        #region Propiedades

        private string repositorio()
        {
            return WebConfigurationManager.AppSettings["repositorio"];
        }

        private string archivoRepositorio()
        {
            return WebConfigurationManager.AppSettings["archivoRepositorio"];
        }

        private string elementoRaizXML()
        {
            return WebConfigurationManager.AppSettings["elementoRaizXML"];
        }

        #endregion
    }
   
}

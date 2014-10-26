using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using Smart.BussinesEntities;
using Smart.Logic;

namespace Smart.Services
{
    public partial class AdmonSitioService : IAdmonSitioContract
    {
        public int insert_Companias(Companias_BE compania)
        {
            int? result =0;
            try
            {               
                result = (new AdmonSitio_Logic()).insert_Companias(compania);               
            }
            catch (Exception ex)
            {              
                #if (DEBUG)
                    Console.WriteLine("Error en " + nombreMetodo() + ": " + ex.Message);
                #else
                    EventLogManager.LogErrorEntry("Error en " + nombreMetodo() + ": " + ex.Message);
                    //TODO: Codificar envío de notificación de error al EventLog
#endif
            }
            return result.Value;
        }

        public int insert_Perfiles(Perfiles_BE perfil)
        {
            int? result = 0;
            try
            {               
                result = (new AdmonSitio_Logic()).insert_Perfiles(perfil);               
            }
            catch (Exception ex)
            {
#if (DEBUG)
                Console.WriteLine("Error en " + nombreMetodo() + ": " + ex.Message);
#else
                    EventLogManager.LogErrorEntry("Error en " + nombreMetodo() + ": " + ex.Message);
                    //TODO: Codificar envío de notificación de error al EventLog
#endif
            }
            return result.Value;
        }

        public int insert_CompaniasBitacoraAcciones(CompaniasBitacoraAcciones_BE acciones)
        {
            int? result = 0;
            try
            {               
                result = (new AdmonSitio_Logic()).insert_CompaniasBitacoraAcciones(acciones);               
            }
            catch (Exception ex)
            {
#if (DEBUG)
                Console.WriteLine("Error en " + nombreMetodo() + ": " + ex.Message);
#else
                    EventLogManager.LogErrorEntry("Error en " + nombreMetodo() + ": " + ex.Message);
                    //TODO: Codificar envío de notificación de error al EventLog
#endif
            }
            return result.Value;
        }

        #region Propiedades

        private string nombreMetodo()
        {
            StackTrace st = new StackTrace();
            StackFrame sf = st.GetFrame(1);
            return sf.GetMethod().Name;
        }

        #endregion
    }
}

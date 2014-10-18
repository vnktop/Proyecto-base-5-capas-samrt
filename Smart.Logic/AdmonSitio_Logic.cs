using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Smart.BussinesEntities;
using Smart.DataAccess;

namespace Smart.Logic
{
    public class AdmonSitio_Logic
    {
        #region Constructor

        private AdmonSitio_DA admonSitio_da;

        public AdmonSitio_Logic()
        {
            admonSitio_da = new AdmonSitio_DA();
        }

        #endregion

        public int insert_Companias(Companias_BE compania)
        {
            int result = 0;
            try
            {
                result = admonSitio_da.insert_Companias(compania);
            }
            catch (Exception ex)
            {                
                throw ex;
            }
            return result;
        }

        public int insert_Perfiles(Perfiles_BE perfil)
        {
            int result = 0;
            try
            {
                result = admonSitio_da.insert_Perfiles(perfil);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int insert_CompaniasBitacoraAcciones(CompaniasBitacoraAcciones_BE acciones)
        {
            int result = 0;
            try
            {
                result = admonSitio_da.insert_CompaniasBitacoraAcciones(acciones);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

    }
}

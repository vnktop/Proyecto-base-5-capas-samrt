using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Smart.BussinesEntities;
using Smart.DataAccess.Context;

namespace Smart.DataAccess
{
    public class AdmonSitio_DA
    {
        public int insert_Companias(Companias_BE compania)
        {
            int? CompaniaID = 0;            
            try
            {                                
                using (companiasDataContext dc = new companiasDataContext(Helper.ConnectionString()))
                {                   
                    dc.stp_smart_Insert_Compania(
                        ref CompaniaID,
                        compania.RazonSocial,
                        compania.Descripcion,
                        compania.RFC,
                        compania.NombreBD,
                        compania.CorreoContacto,
                        compania.NombreContacto
                        );                   
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return CompaniaID.Value;
        }

        public int insert_Perfiles(Perfiles_BE perfil)
        {
            int? PerfilD = 0;
            try
            {
                using (companiasDataContext dc = new companiasDataContext(Helper.ConnectionString()))
                {
                    dc.stp_smart_Insert_Perfil(
                        ref PerfilD,
                        perfil.Funcion,
                        perfil.Descripcion
                        );
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return PerfilD.Value;
        }

        public int insert_CompaniasBitacoraAcciones(CompaniasBitacoraAcciones_BE perfil)
        {
            int? PerfilD = 0;
            try
            {
                using (companiasDataContext dc = new companiasDataContext(Helper.ConnectionString()))
                {
                    dc.stp_smart_Insert_CompaniasBitacoraAcciones(
                        ref PerfilD,
                        perfil.CompaniaId,
                        perfil.AgregarCompania,
                        perfil.AgregarMembership,
                        perfil.AgregarPerfil,
                        perfil.EnvioCorreo
                        );
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return PerfilD.Value;
        }
    }
}

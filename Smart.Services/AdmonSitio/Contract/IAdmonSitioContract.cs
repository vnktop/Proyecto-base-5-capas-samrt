using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.ServiceModel;
using Smart.BussinesEntities;

namespace Smart.Services
{
    [ServiceContract]
    interface IAdmonSitioContract
    {
        [OperationContract]
        int insert_Companias(Companias_BE compania);
        [OperationContract]
        int insert_Perfiles(Perfiles_BE perfil);
        [OperationContract]
        int insert_CompaniasBitacoraAcciones(CompaniasBitacoraAcciones_BE acciones);
    }
}

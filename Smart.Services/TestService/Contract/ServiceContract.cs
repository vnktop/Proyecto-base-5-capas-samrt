using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.ServiceModel;
using Smart.BussinesEntities;

namespace Smart.Services
{
    [ServiceContract]
    interface IServiceContract
    {
        [OperationContract]
        List<BE_Test> listar_Test();
    }
}

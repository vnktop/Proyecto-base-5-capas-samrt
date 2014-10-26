using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Runtime.Serialization;

namespace Smart.BussinesEntities
{
    [DataContract]
    public class CompaniasBitacoraAcciones_BE
    {       
        [DataMember]
        public int CompaniaId { get; set; }
        [DataMember]
        public bool AgregarCompania { get; set; }
        [DataMember]
        public bool AgregarMembership { get; set; }
        [DataMember]
        public bool AgregarPerfil { get; set; }
        [DataMember]
        public bool EnvioCorreo { get; set; }
    }
}

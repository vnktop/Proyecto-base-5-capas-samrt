using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Runtime.Serialization;

namespace Smart.BussinesEntities
{
    [DataContract]
    public class Perfiles_BE
    {
        [DataMember]
        public int PerfilID { get; set; }
        [DataMember]
        public string Funcion { get; set; }
        [DataMember]
        public string Descripcion { get; set; }
        [DataMember]
        public DateTime FechaSis { get; set; }
        [DataMember]
        public Boolean EsActivo { get; set; }
    }
}

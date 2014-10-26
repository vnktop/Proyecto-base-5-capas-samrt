using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Runtime.Serialization;
using System.Linq.Expressions;

namespace Smart.BussinesEntities
{
    [DataContract]
    public class Companias_BE
    {
        [DataMember]
        public int? CompaniaId { get; set; }
        [DataMember]
        public string RazonSocial { get; set; }
        [DataMember]
        public string Descripcion { get; set; }
        [DataMember]
        public string RFC { get; set; }
        [DataMember]
        public string NombreBD { get; set; }
        [DataMember]
        public string CorreoContacto { get; set; }
        [DataMember]
        public string NombreContacto { get; set; }
        [DataMember]
        public DateTime FechaSis { get; set; }
        [DataMember]
        public bool EsActiva { get; set; }
       
    }
}

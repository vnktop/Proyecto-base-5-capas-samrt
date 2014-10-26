﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Smart.BussinesEntities
{
    [DataContract]
    public class ServiceResult
    {
        public ServiceResult()
        {
            ServiceOK = false;
            ResultValue = null;
            ErrorMessage = string.Empty;
        }

        [DataMember]
        public bool ServiceOK { get; set; }
        [DataMember]
        public object ResultValue { get; set; }
        [DataMember]
        public string ErrorMessage { get; set; }
    }
}

﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Configuration;

namespace Smart.DataAccess
{
    public static class Helper
    {
        public static string ConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["Smart.DataAccess.Properties.Settings.CS_Test"].ConnectionString;
        }
    }
}

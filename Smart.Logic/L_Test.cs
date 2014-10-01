using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Smart.BussinesEntities;
using Smart.DataAccess;

namespace Smart.Logic
{
    public class L_Test
    {
        #region Constructor DA
        private DA_Test c_DA_Test;

        public L_Test()
        {
            c_DA_Test = new DA_Test();
        }

        #endregion

        public List<BE_Test> listar_Test()
        {
            List<BE_Test> results = new List<BE_Test>();
            try
            {
                results = c_DA_Test.listar_Test();
            }
            catch (Exception e)
            {

                throw e;
            }
            return results;
        }
    }
}

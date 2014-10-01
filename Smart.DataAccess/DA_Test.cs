using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Smart.BussinesEntities;
using Smart.DataAccess.Context;

namespace Smart.DataAccess
{
    public class DA_Test
    {
        public List<BE_Test> listar_Test()
        {
            List<BE_Test> results = new List<BE_Test>();
            try
            {
                using (ContextTestDataContext dc = new ContextTestDataContext(Helper.ConnectionString()))
                {
                    var query = from item in dc.stp_ListarTest()
                                select new BE_Test
                                {
                                    id = item.id,
                                    Descripcion = item.Descripcion
                                };
                    results.AddRange(query);
                }
            }
            catch (Exception e)
            {

                throw e;
            }
            return results;
        }
    }
}

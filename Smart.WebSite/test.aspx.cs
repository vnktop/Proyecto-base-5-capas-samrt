using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Smart.WebSite.srTest;

namespace Smart.WebSite
{
    public partial class test : System.Web.UI.Page
    {
        ServiceContractClient rsTest = new ServiceContractClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                testLoad();
            }
        }

        private void testLoad()
        {
            ddlTest.DataTextField = "Descripcion";
            ddlTest.DataValueField = "Id";
            ddlTest.DataSource = rsTest.listar_Test();
            ddlTest.DataBind();
        }
    }
}
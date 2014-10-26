using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Smart.WebSite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if (Membership.ValidateUser(login.UserName, login.Password))
                if (Roles.IsUserInRole(login.UserName, "Administrador"))
                    Response.Redirect("~/Admon_Sitio/admonSMART_SMenu.aspx");
                else login.FailureText = "usuario no admon";
            else
                login.FailureText = "credencial no valida";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Linq.Expressions;
using Smart.WebSite.srAdmonSitio;

namespace Smart.WebSite.Helper
{
    public static class NombrePropiedades
    {
        //http://handcraftsman.wordpress.com/2008/11/11/how-to-get-c-property-names-without-magic-strings/
        public static class CompaniaNombrePropiedades
        {            
            public static readonly string RazonSocial = ((MemberExpression)((Expression<Func<Companias_BE, string>>)(s => s.RazonSocial)).Body).Member.Name;
            public static readonly string Descripcion = ((MemberExpression)((Expression<Func<Companias_BE, string>>)(s => s.Descripcion)).Body).Member.Name;
            public static readonly string RFC = ((MemberExpression)((Expression<Func<Companias_BE, string>>)(s => s.RFC)).Body).Member.Name;
            public static readonly string NombreBD = ((MemberExpression)((Expression<Func<Companias_BE, string>>)(s => s.NombreBD)).Body).Member.Name;
            public static readonly string CorreoContacto = ((MemberExpression)((Expression<Func<Companias_BE, string>>)(s => s.CorreoContacto)).Body).Member.Name;
            public static readonly string NombreContacto = ((MemberExpression)((Expression<Func<Companias_BE, string>>)(s => s.NombreContacto)).Body).Member.Name;
        }

        public static class AccionesCompaniasPropiedades
        {
            public static readonly string CompaniaId = ((MemberExpression)((Expression<Func<CompaniasBitacoraAcciones_BE, int>>)(s => s.CompaniaId)).Body).Member.Name;
            public static readonly string AgregarCompania = ((MemberExpression)((Expression<Func<CompaniasBitacoraAcciones_BE, bool>>)(s => s.AgregarCompania)).Body).Member.Name;
            public static readonly string AgregarMembership = ((MemberExpression)((Expression<Func<CompaniasBitacoraAcciones_BE, bool>>)(s => s.AgregarMembership)).Body).Member.Name;
            public static readonly string AgregarPerfil = ((MemberExpression)((Expression<Func<CompaniasBitacoraAcciones_BE, bool>>)(s => s.AgregarPerfil)).Body).Member.Name;
            public static readonly string EnvioCorreo = ((MemberExpression)((Expression<Func<CompaniasBitacoraAcciones_BE, bool>>)(s => s.EnvioCorreo)).Body).Member.Name;
        }
    }
}
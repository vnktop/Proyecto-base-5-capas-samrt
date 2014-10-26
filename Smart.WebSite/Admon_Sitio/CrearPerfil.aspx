<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearPerfil.aspx.cs" Inherits="Smart.WebSite.Admon_Sitio.CrearPerfiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblFuncion" runat="server" Text="Función"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbFuncion" runat="server" MaxLength="15"/>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvtbFuncion" runat="server" ControlToValidate="tbFuncion" Text="*" ErrorMessage="Función" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>                   
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDescripcion" Text="Descripción" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="tbDescripcion" runat="server" MaxLength="50" />  
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: right;">
                    <asp:Button Text="Crear" runat="server" OnClick="Unnamed1_Click" />
                </td>
            </tr>           
        </table>
    </div>
    <div id="validationSummary" runat="server">
        <asp:ValidationSummary ID="vsPerfil" runat="server" DisplayMode="BulletList" HeaderText="Favor de ingresar los siguientes valores" ShowSummary="true" ShowValidationErrors="true" />
    </div>
    <div>
        <asp:Label ID="lblMensajes" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>

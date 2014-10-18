<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearCompania.aspx.cs" Inherits="Smart.WebSite.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>    
    <form id="form1" runat="server">
        <asp:ScriptManager ID="smTmp" runat="server"></asp:ScriptManager>
    <div>
        <table>
            <tr>
                <td>    
                    <asp:Label ID="lblRazonSocial" runat="server" Text="Razón social"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbRazonSocial" runat="server" MaxLength="100"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvtbRazonSocial" runat="server" ControlToValidate="tbRazonSocial" Text="*" ErrorMessage="Razón social" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>    
                    <asp:Label ID="lblDescripcion" runat="server" Text="Descripción"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbDescripcion" runat="server" MaxLength="150"></asp:TextBox>
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td>    
                    <asp:Label ID="lblRFC" runat="server" Text="RFC"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbRFC" runat="server" MaxLength="15"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvRFC" runat="server" ControlToValidate="tbRFC" Text="*" ErrorMessage="RFC" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revtbRFC"  ValidationExpression="^[a-zA-Z]{4}\d{6}[a-zA-Z]{2}\d{1}$"
                            runat="server" ControlToValidate="tbRFC" Text="*" ErrorMessage="Formato RFC Incorrecto. Verifique Homoclave fisica[4 carácteres], moral[3 carácteres]; formato fecha: YYMMDD; Homoclave [3 carácteres]" SetFocusOnError="true"
                            ></asp:RegularExpressionValidator>    
                </td>
            </tr>
            <tr>
                <td>    
                    <asp:Label ID="lblNombreBD" runat="server" Text="Nombre base de datos"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbNombreBD" runat="server" MaxLength="15"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvtbNombreBD" runat="server" ControlToValidate="tbNombreBD" Text="*" ErrorMessage="Nombre base de datos" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>                   
                </td>
            </tr>
            <tr>
                <td>    
                    <asp:Label ID="lblCorreoContacto" runat="server" Text="Correo contacto"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbCorreoContacto" runat="server" MaxLength="30"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvtbCorreoContacto" runat="server" ControlToValidate="tbCorreoContacto" Text="*" ErrorMessage="Correo contacto" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>                   
                    <asp:RegularExpressionValidator ID="revtbCorreoContacto" 
                        runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="tbCorreoContacto" Text="*" ErrorMessage="Formato Correo electrónico Incorrecto " SetFocusOnError="true"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>    
                    <asp:Label ID="lblNombreContacto" runat="server" Text="Nombre de contacto"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbNombreContacto" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvtbNombreContacto" runat="server" ControlToValidate="tbNombreContacto" Text="*" ErrorMessage="Nombre de contacto" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>                   
                </td>
            </tr>

            <tr>
                <td colspan="3" style="text-align: right;">
                    <asp:UpdatePanel ID="upCrear" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnCrear" runat="server" Text="Crear" OnClick="btnCrear_Click" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnCrear" EventName="click" />                            
                        </Triggers>
                    </asp:UpdatePanel>                    
                </td>
            </tr>           
        </table>
    </div>
        <div id="validationSummary" runat="server">
            <asp:ValidationSummary ID="vsCompania" runat="server" DisplayMode="BulletList" HeaderText="Favor de ingresar los siguientes valores" ShowSummary="true" ShowValidationErrors="true" />
        </div>
        <div>
            <asp:UpdatePanel ID="upMensajes" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lblMensajes" runat="server"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>            
        </div>
        <%--TEST--%>
        <%--<div>
            <asp:Button ID="btnCrears" runat="server" Text="Crear" OnClick="btnCrears_Click" CausesValidation="false" />
            <asp:Button ID="btnLeer" runat="server" Text="Leer" CausesValidation="false" OnClick="btnLeer_Click" />
            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CausesValidation="false" OnClick="btnActualizar_Click" />
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CausesValidation="false" OnClick="btnEliminar_Click" />
            <asp:Button ID="btnError" runat="server" Text="Error" CausesValidation="false" />
            
        </div>--%>
    </form>
</body>
</html>

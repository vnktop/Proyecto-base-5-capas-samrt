<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearPerfil.aspx.cs" Inherits="Smart.WebSite.Admon_Sitio.CrearPerfiles" MasterPageFile="~/masterPage.Master" %>

<asp:Content ID="ch" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cb" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-lg-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">Crear perfil</div>
                    </div>
                    <div style="padding-top: 30px" class="panel-body">
                        <div style="display: none" id="login-alert" class="col-md-8"></div>
                        <form id="loginform" class="form-horizontal" role="form">
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="tbFuncion" runat="server" MaxLength="15" CssClass="form-control" placeholder="<Función>" />
                                <asp:RequiredFieldValidator ID="rfvtbFuncion" runat="server" ControlToValidate="tbFuncion" Text="*" ErrorMessage="Función" Display="Dynamic" SetFocusOnError="true" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
                            </div>
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                <asp:TextBox ID="tbDescripcion" runat="server" MaxLength="50" CssClass="form-control" placeholder="<Descripción>" />
                            </div>
                            <div style="margin-top: 10px" class="form-group">
                                <!-- Button -->
                                <div class="col-sm-12 controls">
                                    <asp:Button Text="Crear" runat="server" OnClick="Unnamed1_Click" CssClass="btn-success btn" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div id="validationSummary" runat="server">
                    <asp:ValidationSummary ID="vsPerfil" runat="server" DisplayMode="BulletList" HeaderText="Favor de ingresar los siguientes valores" ShowSummary="true" ShowValidationErrors="true" CssClass="alert alert-warning" />
                </div>
                <div>
                    <asp:Label ID="lblMensajes" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

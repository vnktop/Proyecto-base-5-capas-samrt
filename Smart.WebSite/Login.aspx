<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Smart.WebSite.Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Estilos/bootstrap.css" rel="stylesheet" media="screen" />
    <link href="Estilos/bootswatch.min.css" rel="stylesheet" />

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        body
        {
            background: url(Images/pergamino_dubai.png) no-repeat center center fixed;
        }

        h1
        {
            color: #141d27;
        }
    </style>

    <link rel="stylesheet" href="/../cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <asp:Login ID="login" runat="server" OnAuthenticate="login_Authenticate">
                        <LabelStyle />
                        <LayoutTemplate>

                            <div id="loginbox" style="margin-top: 50px;" class="mainbox ">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <div class="panel-title">Ingreso</div>
                                    </div>
                                    <div style="padding-top: 30px" class="panel-body">
                                        <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                                        <form id="loginform" class="form-horizontal" role="form">
                                            <div style="margin-bottom: 25px" class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="<usuario>"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" Text="El nombre de usuario es obligatorio." ToolTip="El nombre de usuario es obligatorio." ValidationGroup="login" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
                                            </div>
                                            <div style="margin-bottom: 25px" class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                                <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" placeholder="<contraseña>"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" Text="La contraseña es obligatoria." ToolTip="La contraseña es obligatoria." ValidationGroup="login" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
                                            </div>
                                            <%-- <div class="input-group">
                                            <div class="checkbox">
                                                <label>
                                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Recordármelo la próxima vez." />
                                                </label>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </div>
                                        </div>--%>
                                            <div style="margin-top: 10px" class="form-actions">
                                                <!-- Button -->
                                                <div class="col-sm-12 controls">
                                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn-success btn" Text="Inicio de sesión" ValidationGroup="login" />
                                                    <span class="label label-primary">
                                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></span>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </LayoutTemplate>
                    </asp:Login>
                </div>
            </div>
        </div>

    </form>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../Script/bootstrap.min.js"></script>
    <script src="../Script/bootswatch.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#signInForm').bootstrapValidator();
        });
    </script>
</body>
</html>

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


    <%--<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css" />--%>

</head>
<body>
    <form id="form1" runat="server" class="form-horizontal" method="post">
        <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>

        <div class="container">
            <div class="row">
                <div class="col-md-6">


                    <asp:Login ID="login" runat="server" OnAuthenticate="login_Authenticate">
                        <LabelStyle />
                        <LayoutTemplate>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-lg-offset-2">
                                        <div id="loginbox" style="margin-top: 50px;" class="mainbox ">
                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <div class="panel-title">Ingreso</div>
                                                </div>
                                                <div style="padding-top: 30px" class="panel-body">
                                                    <div style="display: none" id="login-alert"></div>
                                                    <%--http://www.devcurry.com/2014/08/validate-form-using-jquery-and_5.html--%>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">Usuario</label>
                                                        <div class="col-md-6 input-group">
                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                            <asp:TextBox ID="UserName" runat="server" CssClass="form-control" ValidationGroup="login"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">Contraseña</label>
                                                        <div class="col-md-6 input-group">
                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                                            <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" ValidationGroup="login"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-md-9 col-md-offset-3">
                                                            <div id="messages"></div>
                                                        </div>
                                                    </div>
                                                    <div style="margin-top: 10px" class="form-actions">
                                                        <!-- Button -->
                                                        <div class="col-sm-12 controls">
                                                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn-success btn" Text="Inicio de sesión" ValidationGroup="login" />
                                                            <%--<span class="label label-primary">--%>
                                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                            <%--</span>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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

<%--    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>--%>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/js/bootstrapValidator.min.js"> </script>

    <script>
        $(document).ready(function () {
            $('#form1').bootstrapValidator({
                container: '#messages',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    login$fullName: {
                        validators: {
                            notEmpty: {
                                message: 'Se requiere usuario'
                            }
                        }
                    },
                    login$UserName: {
                        validators: {
                            notEmpty: {
                                message: 'Se requiere usuario'
                            }
                        }
                    },
                    login$Password: {
                        validators: {
                            notEmpty: {
                                message: 'Se requiere contraseña'
                            }
                        }
                    },
                    email: {
                        validators: {
                            notEmpty: {
                                message: 'The email address is required and cannot be empty'
                            },
                            emailAddress: {
                                message: 'The email address is not valid'
                            }
                        }
                    },
                    title: {
                        validators: {
                            notEmpty: {
                                message: 'The title is required and cannot be empty'
                            },
                            stringLength: {
                                max: 100,
                                message: 'The title must be less than 100 characters long'
                            }
                        }
                    },
                    content: {
                        validators: {
                            notEmpty: {
                                message: 'The content is required and cannot be empty'
                            },
                            stringLength: {
                                max: 500,
                                message: 'The content must be less than 500 characters long'
                            }
                        }
                    }
                }
            });
        });

    </script>

</body>
</html>

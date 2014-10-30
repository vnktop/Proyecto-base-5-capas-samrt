<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearPerfil.aspx.cs" Inherits="Smart.WebSite.Admon_Sitio.CrearPerfiles" MasterPageFile="~/masterPage.Master" %>

<asp:Content ID="ch" ContentPlaceHolderID="head" runat="server">

    <%-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/js/bootstrapValidator.min.js"> </script>--%>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#form1').bootstrapValidator({
                container: '#messages',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    //http://bootstrapvalidator.com/examples/integrating-asp-net/
                    <%=tbFuncion.UniqueID%>: {
                        validators: {
                            notEmpty: {
                                message: 'Se requiere función'
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
                        <div class="form-group">
                            <%--<label class="col-md-3 control-label">Función</label>--%>
                            <div class="col-md-6 input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="tbFuncion" runat="server" CssClass="form-control" placeholder="<Función 30 caracteres>" MaxLength="30"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-10 input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                <asp:TextBox ID="tbDescripcion" runat="server" MaxLength="50" CssClass="form-control" Rows="2" TextMode="MultiLine" placeholder="<Descripción 50 caracteres>" />
                            </div>
                        </div>                        
                        <div class="form-group">
                            <!-- Button -->
                            <div class="col-md-10 input-group">
                                <asp:Button ID="Button1" Text="Crear" runat="server" CssClass="btn-success btn" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <div id="messages"></div>
                            </div>
                        </div>
                    </div>

                </div>               
                <div>
                    <asp:Label ID="lblMensajes" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

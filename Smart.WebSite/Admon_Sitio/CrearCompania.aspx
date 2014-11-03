<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearCompania.aspx.cs" Inherits="Smart.WebSite.Default" MasterPageFile="~/masterPage.Master" %>

<asp:Content ID="Ch" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#form1').bootstrapValidator({
                container: '#messages',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-check',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    //http://bootstrapvalidator.com/examples/integrating-asp-net/
                    <%=tbRazonSocial.UniqueID%>: {
                        validators: {
                            notEmpty: {
                                message: 'Se requiere Razón social'
                            }
                        }
                    },                   
                    <%=tbRFC.UniqueID%>: {
                        validators: {
                            notEmpty: {
                                message: 'Se requiere RFC'
                            },
                            regexp: {
                                regexp:/^[a-zA-Z]{4}\d{6}[a-zA-Z]{2}\d{1}$/,
                                message: 'Formato RFC no valido: Verifique Homoclave persona fisica[4 carácteres], persona moral[3 carácteres]; formato fecha: YYMMDD; Homoclave [3 carácteres]'
                            }    
                        }
                    },
                    <%=tbNombreBD.UniqueID%>: {
                        validators: {
                            notEmpty: {
                                message: 'Se requiere nombre BD'
                            }
                        }
                    },     
                    <%=tbCorreoContacto.UniqueID%>: {
                        validators: {
                            notEmpty: {
                                message: 'Se requiere Correo'
                            },
                            emailAddress: {
                                message: 'Formato correo no valido'
                            }
                        }
                    },
                    <%=tbNombreContacto.UniqueID%>: {
                        validators: {
                            notEmpty: {
                                message: 'Se requiere nombre contacto'
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

<asp:Content ID="Cb" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    <asp:ScriptManager ID="smTmp" runat="server"></asp:ScriptManager>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-lg-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">Crear compañía</div>
                    </div>
                    <div style="padding-top: 30px" class="panel-body">
                        <div style="display: none" id="login-alert" class="col-md-8"></div>
                        <div class="form-group">
                            <div class="col-md-10 input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="tbRazonSocial" runat="server" MaxLength="100" CssClass="form-control" placeholder="<Razón social 100 caracteres>"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-10 input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                <asp:TextBox ID="tbDescripcion" runat="server" MaxLength="150" CssClass="form-control" Rows="2" TextMode="MultiLine" placeholder="<Descripción 150 caracteres>" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-4 input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="tbRFC" runat="server" MaxLength="15" CssClass="form-control" placeholder="<RFC 15 caracteres>"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-4 input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                <asp:TextBox ID="tbNombreBD" runat="server" MaxLength="15" CssClass="form-control" placeholder="<Nombre BD 15 caracteres>" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <asp:TextBox ID="tbCorreoContacto" runat="server" MaxLength="30" CssClass="form-control" placeholder="<Correo 30 caracteres>" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-8 input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="tbNombreContacto" runat="server" MaxLength="50" CssClass="form-control" placeholder="<Nombre contacto 50 caracteres>" />
                            </div>
                        </div>
                        <div class="form-group">
                            <!-- Button -->
                            <div class="col-md-10 input-group">
                                <asp:UpdatePanel ID="upCrear" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btnCrear" Text="Crear" runat="server" CssClass="btn-success btn" OnClick="btnCrear_Click" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnCrear" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <div id="messages"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

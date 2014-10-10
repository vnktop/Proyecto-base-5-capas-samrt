<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MasterControles.aspx.cs" Inherits="Smart.WebSite.MasterControles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Estilos/bootstrap.css" rel="stylesheet" media="screen"/>
    <link href="Estilos/bootswatch.min.css" rel="stylesheet" />    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>    
    <style type="text/css">
        /* general styles */
html, body {
  height: 100%;
  width: 100%;
}

/* padded section */
.pad-section {
  padding: 50px 0;
}
.pad-section img {
  width: 100%;
}

/* vertical-centered text */
.text-vcenter {
  display: table-cell;
  text-align: center;
  vertical-align: middle;
}
.text-vcenter h1 {
  font-size: 4.5em;
  font-weight: 700;
  margin: 0;
  padding: 0;
}

/* additional sections */
#home {
  background: url(Images/pergamino_dubai.png) no-repeat center center fixed; 
  display: table;
  height: 400px;
  position: relative;
  width: 100%;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

#about {
}

#services {
  background-color: #306d9f;
  color: #ffffff;
}
#services .glyphicon {
  border: 2px solid #FFFFFF;
  border-radius: 50%;
  display: inline-block;
  font-size: 60px;
  height: 140px;
  line-height: 140px;
  text-align: center;
  vertical-align: middle;
  width: 140px;
}

#information {
  background: url(Images/towers.png) no-repeat center center fixed; 
  display: table;
  height: 800px;
  position: relative;
  width: 100%;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
#information .panel {
  opacity: 0.85;
}

#google_map {
  height: 500px;
}

footer {
  padding: 20px 0;
}
footer .glyphicon {
  color: #333333;
  font-size: 60px;
}
footer .glyphicon:hover {
  color: #306d9f;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">  
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">       
        <div class="navbar-header">
          <a href="../" class="navbar-brand">SMART</a>
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div> 
        <div class="navbar-collapse collapse" id="navbar-main">
          <ul class="nav navbar-nav">
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes">Compañias <span class="caret"></span></a>
              <ul class="dropdown-menu" aria-labelledby="themes">
                <li><a href="AdmonSitio/CrearCompania.aspx/">Insertar compañia</a></li>                
                <li><a href="AdmonSitio/EliminarCompania.aspx">Inhabilitar compañía</a></li>                
              </ul>
            </li>          
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes">Perfiles <span class="caret"></span></a>
              <ul class="dropdown-menu" aria-labelledby="themes">
                  <li><a href="AdmonSitio/CrearPerfil.aspx">Crear perfil</a></li>
                  <li><a href="AdmonSitio/EliminarPerfil.aspx">Inhabilitar perfil</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="download">Aplicaciones <span class="caret"></span></a>
              <ul class="dropdown-menu" aria-labelledby="download">
                <li><a href="AdmonSitio/AgregarAolicacion.aspx">Agregar aplicación</a></li>
                <li><a href="AdmonSitio/EliminarAplicacion.aspx">Eliminar aplicación</a></li>              
              </ul>
            </li>
            <li>
              <a href="AdmonSitio/RelacionPerApli.aspx">Relación perfil - aplicación</a>
            </li>                                                                        
          </ul>     
          
          <ul class="nav navbar-nav navbar-right">
            <li><a href="login.aspx">Logout</a></li>            
          </ul>     
        </div>
      </div>
    </div>

    <div class="container">
        <div class="bs-docs-section clearfix">      
            <div class="row">
                <div class="col-lg-12">
                    <h1>Estilos controles ASP.NET - Bootstrap/Bootswatch</h1>
                </div>
            </div>
        </div>
            <div class="row">
              <div class="col-lg-4">
                <div class="dropdown">            
                    <h2>DDL</h2>
                    <asp:DropDownList ID="ddlTest" runat="server" class="form-control" Width="300px"></asp:DropDownList>
                </div>     
              </div>

              <div class="col-lg-4">
                  <div class="table-responsive">     
                    <h2>Gridview</h2>          
                    <asp:GridView ID="gv" runat="server" CssClass="table-hover table" cellspacing="0" style="border-collapse:collapse;"></asp:GridView>              
                 </div>
              </div>
              <div class="col-lg-4">
                  <h2>Etiquetas</h2>
                  <asp:Label ID="lblDefault" runat="server" CssClass="label-default label" Text="Defautl"></asp:Label>
                  <asp:Label ID="lblPrimary" runat="server" CssClass="label-primary label" Text="Primary"></asp:Label>
                  <asp:Label ID="lblSuccess" runat="server" CssClass="label-success label" Text="Success"></asp:Label>
                  <asp:Label ID="lblWarning" runat="server" CssClass="label-warning label" Text="Warning"></asp:Label>
                  <asp:Label ID="lblDanger" runat="server" CssClass="label-danger label" Text="Danger"></asp:Label>
                  <asp:Label ID="lblInfo" runat="server" CssClass="label-info label" Text="Info"></asp:Label>
              </div>
            </div>
            <hr class="divider"/>
            <div class="row">
                <div class="col-lg-4">
                    <h2>Botones</h2>
                    <asp:Button ID="btnDefault" runat="server" CssClass="btn-default btn" Text="Default" />
                    <asp:Button ID="btnPrimary" runat="server" CssClass="btn-primary btn" Text="Primary" />
                    <asp:Button ID="btnSuccess" runat="server" CssClass="btn-success btn" Text="Success" />
                    <asp:Button ID="btnInfo" runat="server" CssClass="btn-info btn" Text="Info" />
                    <asp:Button ID="btnWarning" runat="server" CssClass="btn-warning btn" Text="Warning" />
                    <asp:Button ID="btnDanger" runat="server" CssClass="btn-danger btn" Text="Danger" />
                    <asp:LinkButton ID="lbLink" runat="server" CssClass="btn-link btn" Text="Link"></asp:LinkButton>
                </div>
                <div class="col-lg-4">             
                    <h2>Formulario</h2>                
                        <div class="row">
                            <div class="col-lg-12">
                                 <div class="well">
                                    <%--<form class="form-horizontal"> --%>                                
                                        <fieldset>                        
                                            <legend>Crear compañía</legend>
                                                <div class="row">
                                                    <asp:Label ID="lblRazonSocial" runat="server" CssClass="col-lg-4 control-label" Text="Razón social"></asp:Label>
                                                    <div class="col-lg-8">
                                                        <asp:TextBox ID="tbRazonSocial" runat="server" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvtbRazonSocial" runat="server" ControlToValidate="tbRazonSocial"
                                                                CssClass="text-danger" ErrorMessage="Ingresar razón social" Display="Dynamic" />
                                                    </div>                            
                                                </div>
                                                <div class="row">
                                                    <asp:Label ID="lblRepS" runat="server" Text="Es representante" CssClass="col-lg-4 control-label" ></asp:Label>
                                                    <div class="col-lg-8">     
                                                        <div class="radio">                                                                                                       
                                                            <label>
                                                                <asp:RadioButton ID="cbRep" runat="server" CssClass="radio" Text="SI" GroupName="EsRep"/>
                                                                <asp:RadioButton  ID="cbRepN" runat="server" CssClass="radio" Text="NO"  GroupName="EsRep"/>                                                
                                                            </label>
                                                        </div>                                               
                                                    </div>
                                                </div>
                                                 <div class="row">
                                                    <asp:Label ID="lblTextArea" runat="server" CssClass="col-lg-4 control-label" Text="Comentarios"></asp:Label>
                                                    <div class="col-lg-8">
                                                        <asp:TextBox ID="tbTextArea" runat="server" Rows="3" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvtbTextArea" runat="server" ControlToValidate="tbTextArea"
                                                                CssClass="text-danger" ErrorMessage="Ingresar texto" Display="Dynamic" />
                                                    </div>                            
                                                </div>
                                                <hr  />
                                                <div class="row">
                                                <div class="col-lg-8 col-lg-offset-4">
                                                    <asp:Button id="btnCancel" runat="server" CssClass="btn-default btn"  Text="Cancelar" />
                                                    <asp:Button ID="tbSubmit" runat="server" CssClass="btn-primary btn" Text="Enviar" />                            
                                                </div>
                                            </div>                     
                                        </fieldset> 
                                   <%-- </form>--%>
                                </div>
                             </div>
                         </div>                    
                </div>
                <div class="col-lg-4">
                    <h2>Cajas de texto</h2>
                    <div class="form-group">
                        <asp:Label ID="lblFocused" runat="server" CssClass="control-label" Text="Focused input"></asp:Label>
                        <asp:TextBox ID="tbFocusedInput" CssClass="form-control" runat="server" Text="Focused input here"></asp:TextBox>                
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDisabled" runat="server" CssClass="control-label" Text="Disabled input"></asp:Label>
                        <asp:TextBox ID="tbDisabled" CssClass="form-control" runat="server" Text="Disabled input here" Enabled="false"></asp:TextBox> 
                    </div>
                     <div class="form-group has-warning">
                        <asp:Label ID="lblWarnings" runat="server" CssClass="control-label" Text="Input warning"></asp:Label>
                        <asp:TextBox ID="tbWarning" CssClass="form-control" runat="server" Text="input warning here"></asp:TextBox> 
                    </div>
                     <div class="form-group has-error">
                        <asp:Label ID="lblErrors" runat="server" CssClass="control-label" Text="Input warning"></asp:Label>
                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text="Input warning here"></asp:TextBox> 
                    </div>
                     <div class="form-group has-success">
                        <asp:Label ID="lblSuccesss" runat="server" CssClass="control-label" Text="Input success"></asp:Label>
                        <asp:TextBox ID="tbSuccesss" CssClass="form-control" runat="server" Text="Input success here"></asp:TextBox> 
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblLargeInput" runat="server" CssClass="control-label" Text="Large Input"></asp:Label>
                        <asp:TextBox ID="tbLargeInput" CssClass="form-control input-lg" runat="server" Text="Large Input here"></asp:TextBox> 
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDefaultInput" runat="server" CssClass="control-label" Text="Default Input"></asp:Label>
                        <asp:TextBox ID="tbDefaultInput" CssClass="form-control" runat="server" Text="Default Input here"></asp:TextBox> 
                    </div>
                     <div class="form-group">
                        <asp:Label ID="lblSmallInput" runat="server" CssClass="control-label" Text="Small Input"></asp:Label>
                        <asp:TextBox ID="tbSmallInput" CssClass="form-control input-sm" runat="server" Text="Small Input here"></asp:TextBox> 
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblInputAddOnss" runat="server" Text="Input Add ons" CssClass="control-label"></asp:Label>
                      <%--<label class="control-label">Input addons</label>--%>
                      <div class="input-group">
                        <span class="input-group-addon">$</span>
                        <asp:TextBox ID="tb" runat="server" CssClass="form-control"></asp:TextBox>
                       <%-- <input type="text" class="form-control">--%>
                        <span class="input-group-btn">
                           <asp:Button ID="bt" runat="server" CssClass="btn btn-default" Text="Button"/>
                          <%--<button class="btn btn-default" type="button">Button</button>--%>
                        </span>
                      </div>
                </div>
            </div>
        </div>

        <hr class="divider"/>
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
                <h2>JUMBOTRON</h2>
                <div class="jumbotron">
                    <h1>PLD</h1>
                        <p>El cumplimiento de la Ley Federal para la Prevención e Identificación de Operaciones con Recursos de Procedencia Ilícita trae consigo aparejados beneficios, en general, para la sociedad mexicana en su conjunto y, en lo particular, para quienes realicen las Actividades Vulnerables.</p>
                        <p><a class="btn btn-primary btn-lg">Learn more</a></p>
                </div>
             </div>           
        </div>

        <hr class="divider"/>
        <div class="row">
            <div class="col-lg-4">
                <h3>Paneles</h3>
                <div class="panel panel-primary">
                  <div class="panel-heading">
                    <h3 class="panel-title">Panel primary</h3>
                  </div>
                  <div class="panel-body">
                    Panel content
                  </div>
                </div>

                <div class="panel panel-success">
                  <div class="panel-heading">
                    <h3 class="panel-title">Panel success</h3>
                  </div>
                  <div class="panel-body">
                    Panel content
                  </div>
                </div>

                <div class="panel panel-warning">
                  <div class="panel-heading">
                    <h3 class="panel-title">Panel warning</h3>
                  </div>
                  <div class="panel-body">
                    Panel content
                  </div>
                </div>
                <div class="panel panel-danger">
                  <div class="panel-heading">
                    <h3 class="panel-title">Panel danger</h3>
                  </div>
                  <div class="panel-body">
                    Panel content
                  </div>
                </div>

                <div class="panel panel-info">
                  <div class="panel-heading">
                    <h3 class="panel-title">Panel info</h3>
                  </div>
                  <div class="panel-body">
                    Panel content
                  </div>
                </div>
             </div>
            <div class="col-lg-4">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="page-header">
                      <h2 id="tables">Dialogs</h2>
                    </div>
                  </div>
                </div>               
                <div class="row">      
                    <div class="col-lg-12">
                       <%--http://www.sitepoint.com/understanding-bootstrap-modals/--%>                                      
                      <h2>Bootstrap 3.1.0 - Modal Demo</h2>

                      <div class="row text-center">
                          <h3>The Basic Modal</h3>
                          <a href="#" class="btn btn-lg btn-success" data-toggle="modal" data-target="#basicModal">Click to open Modal</a>
                      </div>
                      <hr />
                      <div class="row text-center">
                          <h3>The Large Modal</h3>
                          <a href="#" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#largeModal">Click to open Modal</a>
                      </div>
                      <hr />
                      <div class="row text-center">
                          <h3>The Small Modal</h3>
                          <a href="#" class="btn btn-lg btn-danger" data-toggle="modal" data-target="#smallModal">Click to open Modal</a>
                      </div>
                        <hr />
                       <div class="row text-center">
                           <h3>Cambiando botón por anchor (y)</h3>
                        <%--Si se llama con botón el modal desaparece, por eso se investiga y al probar con el anchor no desaparece--%>
                        <%--<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Launch demo modal</button>--%>                      
                        <a href="#" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Launch demo modal</a>

                       </div>

                    </div>

                    </div>
                </div>           
            <div class="col-lg-4">
            <h2>Modals</h2>
              <div class="modal">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                      <h4 class="modal-title">Modal title</h4>
                    </div>
                    <div class="modal-body">
                      <p>One fine body…</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <hr />         
        <div class="row">
            <div class="col-lg-12">
                <%--http://www.bootply.com/62603--%>
                <h3>Carusel</h3>
                <!-- Carousel
                ================================================== -->
                <div id="myCarousel" class="carousel slide">
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                  </ol>
                  <div class="carousel-inner">
                    <div class="item active">                      
                      <img src="Images/bg_suburb.jpg" class="img-responsive" />
                      <div class="container">
                        <div class="carousel-caption">
                          <h1>Bootstrap 3 Carousel Layout</h1>
                          <pthis is="" an="" example="" layout="" with="" carousel="" that="" uses="" the="" bootstrap="" 3="" styles.<="" small=""><p></p>
                          <p><a class="btn btn-lg btn-primary" href="http://getbootstrap.com">Learn More</a>
                        </p></pthis></div>
                      </div>
                    </div>
                    <div class="item">                      
                      <img src="Images/flash-placeholder.jpg"  class="img-responsive"/>
                      <div class="container">
                        <div class="carousel-caption">
                          <h1>Changes to the Grid</h1>
                          <p>Bootstrap 3 still features a 12-column grid, but many of the CSS class names have completely changed.</p>
                          <p><a class="btn btn-large btn-primary" href="#">Learn more</a></p>
                        </div>
                      </div>
                    </div>
                    <div class="item">
                      <img src="http://placehold.it/1500X500" class="img-responsive">
                      <div class="container">
                        <div class="carousel-caption">
                          <h1>Percentage-based sizing</h1>
                          <p>With "mobile-first" there is now only one percentage-based grid.</p>
                          <p><a class="btn btn-large btn-primary" href="#">Browse gallery</a></p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- Controls -->
                  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="icon-prev"></span>
                  </a>
                  <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="icon-next"></span>
                  </a>  
                </div>
                <!-- /.carousel -->
            </div>
        </div>
        </div> 
        
       

<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Basic Modal</h4>
      </div>
      <div class="modal-body">
        <h3>Modal Body</h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
        
<div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="H1">Large Modal</h4>
      </div>
      <div class="modal-body">
        <h3>Modal Body</h3>
          <asp:Label ID="lblModalB" runat="server" Text="Body modal inside asp label" CssClass="label-warning"></asp:Label>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       <%-- <button type="button" class="btn btn-primary">Save changes</button>--%>
        <asp:Button ID="btn" runat="server" CssClass="btn-primary btn" Text="Almacenar" />
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="smallModal" tabindex="-1" role="dialog" aria-labelledby="smallModal" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="H2">Small Modal</h4>
      </div>
      <div class="modal-body">
        <h3>Modal Body</h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="H3">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<%--http://www.script-tutorials.com/demos/391/index.html#about--%>
<%--scroll efect--%>
<!-- first section - Home -->
<h2>Scroll efect</h2>
<div id="home" class="home">
  <div class="text-vcenter">
    <h1>Hello World</h1>
    <h3>This is bootstrap-based layout</h3>
    <a href="#about" class="btn btn-default btn-lg">Continue</a>
  </div>
</div>
<!-- /first section -->

<!-- second section - About -->
<div id="about" class="pad-section">
  <div class="container">
    <div class="row">
      <div class="col-sm-6">
        <img src="Images/logo.png" />
      </div>
      <div class="col-sm-6 text-center">
        <h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in sem cras amet.</h2>
        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed interdum metus et ligula venenatis, at rhoncus nisi molestie. Pellentesque porttitor elit suscipit massa laoreet metus.</p>
      </div>
    </div>
  </div>
</div>
<!-- /second section -->


<!-- third section - Services -->
<div id="services" class="pad-section">
  <div class="container">
    <h2 class="text-center">Our Services</h2> <hr />
    <div class="row text-center">
      <div class="col-sm-3 col-xs-6">
        <i class="glyphicon glyphicon-cloud"> </i>
        <h4>Service 1</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in sem cras amet. Donec in sem cras amet.</p>
      </div>
      <div class="col-sm-3 col-xs-6">
        <i class="glyphicon glyphicon-leaf"> </i>
        <h4>Service 2</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in sem cras amet. Donec in sem cras amet.</p>
      </div>
      <div class="col-sm-3 col-xs-6">
        <i class="glyphicon glyphicon-phone-alt"> </i>
        <h4>Service 3</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in sem cras amet. Donec in sem cras amet.</p>
      </div>
      <div class="col-sm-3 col-xs-6">
        <i class="glyphicon glyphicon-bullhorn"> </i>
        <h4>Service 4</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in sem cras amet. Donec in sem cras amet.</p>
      </div>
    </div>
  </div>
</div>
<!-- /third section -->

<!-- fourth section - Information -->
<div id="information" class="pad-section">
  <div class="container">
    <div class="row">
      <div class="col-sm-6">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h2 class="panel-title">Additional information</h2>
          </div>
          <div class="panel-body lead">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit adipiscing blandit. Aliquam placerat, velit a fermentum fermentum, mi felis vehicula justo, a dapibus quam augue non massa. Duis euismod, augue et tempus consequat, lorem mauris porttitor quam, consequat ultricies mauris mi a metus. Phasellus congue, leo sed ultricies tristique, nunc libero tempor ligula, at varius mi nibh in nisi. Aliquam erat volutpat. Maecenas rhoncus, neque facilisis rhoncus tempus, elit ligula varius dui, quis amet. 
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h2 class="panel-title">Additional information</h2>
          </div>
          <div class="panel-body lead">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit adipiscing blandit. Aliquam placerat, velit a fermentum fermentum, mi felis vehicula justo, a dapibus quam augue non massa. Duis euismod, augue et tempus consequat, lorem mauris porttitor quam, consequat ultricies mauris mi a metus. Phasellus congue, leo sed ultricies tristique, nunc libero tempor ligula, at varius mi nibh in nisi. Aliquam erat volutpat. Maecenas rhoncus, neque facilisis rhoncus tempus, elit ligula varius dui, quis amet. 
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- /fourth section -->

<!-- fifth section -->
<div id="Div1" class="pad-section">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 text-center">
        <h3>Parallax scrolling effect is in action</h3>
        <h4>The next is the address on Google maps</h4>
      </div>
    </div>
  </div>
</div>
<!-- /fifth section -->

<!-- google map -->
<div id="google_map"></div>
<!-- /google map -->

<!-- footer -->
<footer>
  <hr />
  <div class="container">
    <p class="text-right">Copyright &copy; Your Company 2014</p>
  </div>
</footer>
<!-- /footer -->


   
                    
    </form>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>--%>
    <script src="Script/bootstrap.min.js"></script>
    <script src="Script/bootswatch.js"></script>
    <script src="//maps.google.com/maps/api/js?sensor=true"></script>


    <script type="text/javascript">
        $(document).ready(function () {

            // create a LatLng object containing the coordinate for the center of the map
            var latlng = new google.maps.LatLng(19.425856, -99.1775372);

            // prepare the map properties
            var options = {
                zoom: 15,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                navigationControl: true,
                mapTypeControl: false,
                scrollwheel: false,
                disableDoubleClickZoom: true
            };

            // initialize the map object
            var map = new google.maps.Map(document.getElementById('google_map'), options);

            // add Marker
            var marker1 = new google.maps.Marker({
                position: latlng, map: map
            });

            // add listener for a click on the pin
            google.maps.event.addListener(marker1, 'click', function () {
                infowindow.open(map, marker1);
            });

            // add information window
            var infowindow = new google.maps.InfoWindow({
                content: '<div class="info"><strong>This is my company</strong><br><br>My company address is here<br> 32846 Sydney</div>'
            });
        });

    </script>

</body>

</html>

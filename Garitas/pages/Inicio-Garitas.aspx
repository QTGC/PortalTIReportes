<%@ Page Title="" Language="C#" MasterPageFile="~/Garitas/pages/Reporte-Garitas.master" AutoEventWireup="true" CodeFile="Inicio-Garitas.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <div style="margin: 3%; border-style: solid; border-color: #e2b50e; border-width: 5px; border-radius: 10px; padding-bottom: 1%; padding-top: 1%">


        <div style="padding-left: 1%; width: 99%">
            <div class="row">
                <div class="col-9" style="">


                    <ul class="list-group" style="width: 100%; margin: 0% ; font-size:larger">


                      <%--  style="background-color:#f2f2f2"--%>

                        <li id="divRep" class="list-group-item" style="">

                            <div class="card mb-3" <%--style="width:80%"--%>>
                                <div class="row no-gutters" style="width: 100%; align-items: center; background-color:#f2f2f2">
                                    <div class="col-md-2">
                                        <asp:ImageButton ID="btnReporte" runat="server" ImageUrl="~/Garitas/recursos/reporte.png" Width="150px" Height="150px" OnClick="btnReporte_Click" />
                                    </div>
                                    <div class="col-md-8" >
                                        <div class="card-body" >
                                            <h5 class="card-title"><span style="text-decoration: underline"><a style="background-color: #f2f2f2; color: #000000" href="Reporte.aspx">Generar Reporte</a> </span></h5>
                                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. rhoncus massa. Mauris lorem ante, fringilla non malesuada a, tincidunt ac augue..</p>
                                            <p class="card-text"><small class="text-muted"></small></p>
                                        </div>
                                    </div>
                                </div>
                            </div>




                        </li>
                        <li id="divInv" class="list-group-item">

                            <div class="card mb-3" <%--style="width: 80%;"--%>>
                                <div class="row no-gutters" style="width: 100%; align-items: center; background-color:#f2f2f2"">
                                    <div class="col-md-2">
                                        <asp:ImageButton ID="btnInvitados" runat="server" ImageUrl="~/Garitas/recursos/invitados.png" Width="150px" Height="150px" OnClick="btnInvitados_Click" />
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title"><span style="text-decoration: underline"><a style="background-color: #f2f2f2; color: #000000" href="RegistrarInvitados.aspx">Registrar Invitados</a> </span></h5>
                                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.Duis in dolor tempor, ullamcorper risus eu, non malesuada a, tincidunt ac augue.</p>
                                            <p class="card-text"><small class="text-muted">(Sitio en construcción)</small></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </li>

                        <li id="div´Registrar" class="list-group-item">

                            <div class="card mb-3" <%--style="width: 80%;"--%>>
                                <div class="row no-gutters" style="width: 100%; align-items: center; background-color:#f2f2f2"">
                                    <div class="col-md-2">
                                        <asp:ImageButton ID="ImageButton2" runat="server"  ImageUrl="~/Garitas/recursos/registrar.png" Width="150px" Height="150px" OnClick="btnRegistrar_Click"/>
                                        <%--<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/demo/registrar.png" Width="150px" Height="150px" OnClick="btnInvitados_Click" />--%>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title"><span style="text-decoration: underline"><a style="background-color: #f2f2f2; color: #000000" href="Registrar.aspx">Registrar Invitados</a> </span></h5>
                                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.Duis in dolor tempor, ullamcorper risus eu, non malesuada a, tincidunt ac augue.</p>
                                            <p class="card-text"><small class="text-muted">(Sitio en construcción)</small></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </li>

                    </ul>

                </div>
                <div class="col-3" style="">

                    <ul class="list-group" style="width: 95%; margin: 0%"> 
                        <li id="divSoporte" class="list-group-item" style="">
                        
                        </li>
                    </ul>

                </div>

            </div>
        </div>



    </div>




</asp:Content>


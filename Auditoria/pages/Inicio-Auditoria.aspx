<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Auditoria/pages/Auditoria.master" AutoEventWireup="true" CodeFile="Inicio-Auditoria.aspx.cs" Inherits="Auditoria_pages_Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div style="margin: 3%; border-style: solid; border-color: #e2b50e; border-width: 5px; border-radius: 10px; padding-bottom: 1%; padding-top: 1%">


        <div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Sign In</h3>
			
			</div>
			<div class="card-body">
				<form action="Inicio.aspx">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<%--<input id="" runat="server" type="text" class="form-control" placeholder="username" />--%>


                        <asp:TextBox ID="txtUser" runat="server" type="text" Class="form-control" placeholder="User" Style="border-width:2px; border-color:white" ></asp:TextBox>
						

					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<%--<input id="" runat="server" type="password" class="form-control" placeholder="password" />--%>
                        <asp:TextBox ID="txtPass" runat="server" type="password" Class="form-control" placeholder="Password" Style="border-width:2px; border-color:white"></asp:TextBox>

					</div>

					<div runat="server" id="divFailedLogin" class="alert" style="color:#fe1c1c">
											Usuario ó Clave incorrectos.

					</div>
					<div class="form-group" style="margin-right:35%">
						  <asp:Button ID="btnLogin" runat="server" Text="Entrar" OnClick="btnLogin_Click"  Class="btn-success" Style="border-radius:10px; height:50px; width:100px; float:right"/>
                    </div>
                    
				</form>
               
            </div>
			</div>
            
			<div class="card-footer">
				<%--<div class="d-flex justify-content-center links">
					Don't have an account?<a href="#">Sign Up</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#">Forgot your password?</a>
				</div>--%>

                
			</div>
		</div>
	</div>
        
</div>

       
      
 

</asp:Content>


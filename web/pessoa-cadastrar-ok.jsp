
<%@page import="dao.PessoaDao"%>
<%@page import="test.Pessoa"%>
<%@include file="cabecalho.jsp"%>

<%
    String msg="";
    
    if(request.getParameter("txtMatricula") == null || request.getParameter("txtNome")== null)
    {
        response.sendRedirect("professores.jsp");
    }
    else
    {
    
        String Matricula = request.getParameter("txtMatricula");
        String Nome = request.getParameter("txtNome");
        //Chamar a inclusão da DAO
        
        PessoaDao dao = new PessoaDao();

        Pessoa obj = new Pessoa();
        obj.setMatricula(Matricula);
        obj.setNome(Nome);
        
        
        
        try
        {
            dao.incluir(obj);
            msg = "Registro cadastrado com sucesso 1";
        }
        catch(Exception ex)
        {
            msg = "Erro ao cadastrar registro 2";
        }
        
    }
    
    
    
    
%>

         <h1 class="centro">Cadastro de Professores</h1>
            
         <div>
             <%=msg%>.<br />
             <a href="professores.jsp">Voltar para Listagem</a>
             
         </div>
    </body>
</html>

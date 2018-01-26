<%@page import="java.util.List"%>
<%@page import="test.Pessoa"%>
<%@page import="dao.PessoaDao"%>
<%@include file="cabecalho.jsp"%>
 

<%
    String msg = "";
   
if(request.getParameter("matricula")== null)
{
     response.sendRedirect("professores.jsp");
   
}
else
{
     String matricula = request.getParameter("matricula");
     PessoaDao dao = new PessoaDao();
 Pessoa obj = dao.buscarPorMatricula(matricula);
 if(obj!= null){
 
 dao.excluir(obj);
 msg = "excluirdo com sucesso!!!";
 }
 else{
 msg = "ouvir um erro!!!";
 }
}
%>


         <h1 class="centro">Exclusão de Alunos</h1>
            
         <div>
              <%=msg%><br />
             <a href="professores.jsp">Voltar para Listagem</a>
         </div>
    </body>
</html>

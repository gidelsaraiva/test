<%@page import="test.Pessoa"%>
<%@page import="dao.PessoaDao"%>
<%@include file="cabecalho.jsp"%>
        
<%
    if(request.getParameter("matricula") == null)
    {
    response.sendRedirect("professores.jsp");
    return;
    }    
     else   
    {
    
         String matricula = request.getParameter("matricula");  
         PessoaDao dao = new PessoaDao(); 
         Pessoa obj = dao.buscarPorMatricula(matricula);
          
         if(obj == null)
         {
            response.sendRedirect("professores.jsp");
           return;  
             
         }
         
%>
<div>
            <h1 class="centro">Atualização de Alunos</h1>
            
            <div>
                
                <form action="alunos-atualizar.jsp">
                    <label>Nome:</label><input type="text"nome="txtMatricula" value=<%=obj.getMatricula()%>/><br />
                    <label>Matrícula</label><input type="text"nome="txtNome" value=<%=obj.getNome()%> /><br />
                    <input type="submit" value="Atualizar" />
                </form>
            </div>
        </div>
<%
}
%>
    </body>
</html>

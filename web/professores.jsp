
<%@page import="dao.PessoaDao"%>
<%@page import="test.Pessoa"%>
<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp"%>
<%
PessoaDao dao = new PessoaDao();

List<Pessoa> lista = dao.listar();
//Verificar se veio algo do filtro, 
//se vier eu filtro pro nome
//caso contrário eu trago todos os professores
if(request.getParameter("txtFiltro")!=null && request.getParameter("txtFiltro")!="")
{
    String txtFiltro = request.getParameter("txtFiltro");
    lista = dao.listar(txtFiltro);
}
else
{
    lista = dao.listar();
}

%>
        <div>
            <h1 class="centro">Professores</h1>
            
            <div>
                +<a href="pessoa-cadastrar.jsp">Novo Professor</a><br />
                
                 
                <form action="professores.jsp" method="post">
                    <input type="text" name="txtFiltro" />
                    <input type="submit" value="Pesquisar"/><br />
                </form>
               
                 
                
                
                    <table>
                        <tr>
                            <th>Matricula</th>
                            <th>Nome</th>
                            
                            
                            <th>Ações</th>
                        </tr>
                        <%
                        for(Pessoa item:lista)
                        {
                        %>
                        <tr>
                           
                            <td><%=item.getMatricula()%></td>
                            <td><%=item.getNome()%></td>
                            
                            <td><a href="alunos-atualizar.jsp?matricula=<%=item.getMatricula()%>">Editar</a>
                               <a href="alunos-excluir-ok.jsp?matricula=<%=item.getMatricula()%>">Excluir</a>
                            </td>
                            
                        </tr>
                       <%
                        }
                       %>
                    </table>
                    
                
            </div>
        </div>
    </body>
</html>

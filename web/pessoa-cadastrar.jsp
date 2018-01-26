<%@include file="cabecalho.jsp"%>
        <div>
            <h1 class="centro">Cadastro de Professores</h1>
            
            <div>
                
                <form action="pessoa-cadastrar-ok.jsp" method="post">
                    <label>Matricula:</label><input type="text" name="txtMatricula"/><br />
                    <label>Nome:</label><input type="text" name="txtNome" /><br />
                    <input type="reset" value="Limpar" />
                    <input type="submit" value="Cadastrar" />
                </form>
            </div>
        </div>



    </body>
</html>

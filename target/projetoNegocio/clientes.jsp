<%--
  Created by IntelliJ IDEA.
  User: aliss
  Date: 08/07/2021
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>

<html>
<head>
    <title>Clientes</title>
    <style>
        table{
            display: flex;
            align-items: center;
        }
        th{
            padding-right: 20px;
            alignment: center;
        }
        td{
            padding-right: 20px;
            padding-bottom: 15px;
            alignment: center;
        }
        form input{
            margin-bottom: 18px;
        }
        h5#execao_h5{
            color: red;
            font-size: 16px;
        }
    </style>
</head>
<body>

    <form action="cliente-controller" method="POST">
        <c:choose>
            <c:when test="${cliente.id != null}">
                <h1>Editar Cliente</h1>
                <input type="hidden" name="idcliente" value="${cliente.id}"/>
                <input type="hidden" name="idendereco" value="${cliente.endereco.id}"/>
            </c:when>
            <c:otherwise>
                <h1>Adicionar Cliente</h1>
                <input type="hidden" name="idcliente" value="0"/>
            </c:otherwise>
        </c:choose>


        Nome: <input type="text" name="nome" value="${cliente.nome}" placeholder="Nome Completo" required/> <br />
        E-Mail: <input type="email" name="email" placeholder="email@email.com" value="${cliente.email}"/> <br />
        CEP: <input type="text" id="cep" maxlength="9" placeholder="99999-999" onkeyup="mascara_cep()" name="cep" value="${cliente.endereco.cep}" required/> <br />
        Cidade: <input type="text" name="cidade" placeholder="Ex: São Paulo" value="${cliente.endereco.cidade}" required/> <br />
        Estado(Sigla): <input type="text" name="sigla" id="sigla" placeholder="Ex: SP" maxlength="2" value="${cliente.endereco.sigla}" required/> <br />
        Endereço: <input type="text" name="rua" placeholder="Ex: Rua 25 de julho, 293" value="${cliente.endereco.rua}" required/> <br />

        <input type="hidden" name="opcao" value="gravar"/>
        <input type="submit" value="GRAVAR">
    </form>

    <c:if test="${opcao == 'gravar'}">
        <c:if test="${retorno == 'OK'}">
            <h2>Cliente Cadastrado com sucesso!</h2>
        </c:if>
    </c:if>

    <h1>Clientes</h1>

    <table>
        <tr>
            <th>Nome</th>
            <th>Email</th>
            <br/>
            <th>Endereco</th>
            <br/>
            <th>Ações</th>
        </tr>

        <c:forEach var="c" items="${clientes}">
            <tr>
                <td>${c.nome}</td>
                <td>${c.email}</td>
                <td>${c.endereco.cep}, ${c.endereco.cidade}, ${c.endereco.sigla}, ${c.endereco.rua}</td>
                <td>
                    <a href="http://localhost:8080/projetoNegocio/cliente-controller?opcao=excluir&&id=${c.id}">
                        Excluir</a>
                    <a href="http://localhost:8080/projetoNegocio/cliente-controller?opcao=editar&&id=${c.id}">Editar</a>
                </td>
            </tr>
        </c:forEach>
        <!--Tratamento de exceção -->
        <c:if test="${retorno == 'Problems'}">
            <h5 id="execao_h5">Impossivel Remover clientes com registro de compras!</h5>
        </c:if>
    </table>

    <br/>
    <a href="./">Voltar</a>

    <script>
        //impede que o redirecionamento cadastre outro form
        if ( window.history.replaceState ) {
            window.history.replaceState( null, null, window.location.href );
        }
        //mascara cep
        function mascara_cep(){
            var cep = document.getElementById("cep");
            if(cep.value.length == 5){
                cep.value += "-";
            }
        }
        //uppercase no input do estado
        function forceInputUppercase(e)
        {
            var start = e.target.selectionStart;
            var end = e.target.selectionEnd;
            e.target.value = e.target.value.toUpperCase();
            e.target.setSelectionRange(start, end);
        }
        document.getElementById("sigla").addEventListener("keyup", forceInputUppercase, false);
    </script>
</body>
</html>

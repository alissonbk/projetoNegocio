<%--
  Created by IntelliJ IDEA.
  User: aliss
  Date: 12/07/2021
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false"%>

<html lang="pt-br">
<head>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
    <title>Produtos</title>
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
        form select{
            margin-bottom: 18px;
        }
        h5#execao_h5{
            font-size: 16px;
            color:red;
        }
    </style>
</head>
<body>
<form action="produto-controller" method="POST">
    <c:choose>
        <c:when test="${produto.id != null}">
            <h1>Editar Produto</h1>
            <input type="hidden" name="idproduto" value="${produto.id}"/>
        </c:when>
        <c:otherwise>
            <h1>Adicionar Produto</h1>
            <input type="hidden" name="idproduto" value="0"/>
        </c:otherwise>
    </c:choose>


    Nome: <input type="text" name="nome" placeholder="Ex:Tênis N38" value="${produto.nome}" required/> <br />
    Valor R$<input type="text" onkeyup="mascaraMoeda(this, event)" placeholder="Preço" step="0.01" min="0" name="valor" value="${produto.valor}" required/> <br />
    Fabricante: <input type="text" name="fabricante" placeholder="Nome da fabricante" value="${produto.fabricante}" required/> <br />
    Tipo: <select name ="id_tipo">
            <option value="1" <c:if test="${produto.tipo.id == 1}"> selected </c:if>>Diversos</option>
            <option value="2" <c:if test="${produto.tipo.id == 2}"> selected </c:if>>Calçados</option>
            <option value="3" <c:if test="${produto.tipo.id == 3}"> selected </c:if>>Moveis</option>
            <option value="5" <c:if test="${produto.tipo.id == 5}"> selected </c:if>>Eletrônicos</option>
            <option value="6" <c:if test="${produto.tipo.id == 6}"> selected </c:if>>Utensílios Domésticos</option>
            <option value="7" <c:if test="${produto.tipo.id == 7}"> selected </c:if>>Ferramentas</option>
          </select> <br />

    <input type="hidden" name="opcao" value="gravar"/>
    <input type="submit" value="GRAVAR">
</form>

<c:if test="${opcao == 'gravar'}">
    <c:if test="${retorno == 'OK'}">
        <h2>Produto Cadastrado com sucesso!</h2>
    </c:if>
</c:if>

<h1>Produtos</h1>

<table>
    <tr>
        <th>Nome</th>
        <th>Valor</th>
        <th>Fabricante</th>
        <th>Tipo</th>
        <th>Ações</th>
    </tr>
    <c:forEach var="p" items="${produtos}">
        <tr>
            <td>${p.nome}</td>
            <fmt:setLocale value = "pt_BR"/>
            <td><fmt:formatNumber type="currency"  minFractionDigits="2" maxFractionDigits="2" value="${p.valor}"/></td>
            <td>${p.fabricante}</td>
            <td>${p.tipo.nome}</td>
            <td>
                <a href="http://localhost:8080/projetoNegocio/produto-controller?opcao=excluir&&id=${p.id}">
                    Excluir</a>
                <a href="http://localhost:8080/projetoNegocio/produto-controller?opcao=editar&&id=${p.id}">Editar</a>
            </td>
        </tr>
    </c:forEach>
    <c:if test="${retorno == 'Problems'}">
        <h5 id="execao_h5">Impossivel Remover produto com registro de compras!</h5>
    </c:if>
</table>


    <br/>
    <a href="./">Voltar</a>


<!--JAVA SCRIPT-->

<script>
    //impede que o redirecionamento cadastre outro form
    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }

    // Mascara input valor
    String.prototype.reverse = function(){
        return this.split('').reverse().join('');
    };
    function mascaraMoeda(campo,evento){
        var tecla = (!evento) ? window.event.keyCode : evento.which;
        var valor  =  campo.value.replace(/[^\d]+/gi,'').reverse();
        var resultado  = "";
        var mascara = "########,##".reverse();
        for (var x=0, y=0; x<mascara.length && y<valor.length;) {
            if (mascara.charAt(x) != '#') {
                resultado += mascara.charAt(x);
                x++;
            } else {
                resultado += valor.charAt(y);
                y++;
                x++;
            }
        }
        campo.value = resultado.reverse();
    }
</script>
</body>
</html>


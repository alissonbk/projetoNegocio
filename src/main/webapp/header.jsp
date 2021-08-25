<%--
  Created by IntelliJ IDEA.
  User: aliss
  Date: 19/08/2021
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <style>
        .nav-link{
            color: white;
        }
        .nav-link:hover{
            color: #FFC947;
        }
        .nav-link:focus{
            color: #FFC947;
        }
        .bg-gradiente {
            background: linear-gradient(55deg, #185ADB, #0A1931);
        }
    </style>
</head>
<header>
    <nav class="navbar navbar-light bg-gradiente px-5">
        <div>
            <a href="landingPage"><img class="rounded-circle mr-3" src="resources/logo.png" height="70" width="70" alt="HOME"/></a>
        </div>
        <ul class="nav gap-4">
            <li class="nav-item">
                <a class="nav-link" aria-current="page" href="landingPage">Home</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Cadastrar</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="cliente-controller">Clientes</a></li>
                    <li><a class="dropdown-item" href="produto-controller">Produtos</a></li>
                    <li><a class="dropdown-item" href="vendedor-controller">Vendedores</a></li>
                    <li><a class="dropdown-item" href="compra-controller">Compras</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="search">Pesquisar</a>
            </li>
        </ul>
    </nav>
</header>

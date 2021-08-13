<%--
  Created by IntelliJ IDEA.
  User: aliss
  Date: 10/07/2021
  Time: 01:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
    <title>Landing Page</title>
    <style>
        html, body, div, span, applet, object, iframe,
        h1, h2, h3, h4, h5, h6, p, blockquote, pre,
        a, abbr, acronym, address, big, cite, code,
        del, dfn, em, img, ins, kbd, q, s, samp,
        small, strike, strong, sub, sup, tt, var,
        b, u, i, center,
        dl, dt, dd, ol, ul, li,
        fieldset, form, label, legend,
        table, caption, tbody, tfoot, thead, tr, th, td,
        article, aside, canvas, details, embed,
        figure, figcaption, footer, header, hgroup,
        menu, nav, output, ruby, section, summary,
        time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
        }
        /*COLORS
        azul claro  #0B8E8D
        bege	    #C1CBA7
        azul escuro #06324F
        amarelo	    #FDD80F
        */
        body{
            background-color: #C1CBA7;
        }
        .links{
            display: flex;
            /*flex-direction: row;*/
            justify-content: space-between;
            padding: 15px;
            maring-top: 10px;
        }
        a{
            text-decoration: none;
            color: #FDD80F;
            background-color: #06324F;
            width: 200px;
            height: 200px;
            line-height: 200px;
            text-align: center;
            margin: 50px 20px 0px 20px;

        }
        a.clientes{


        }

    </style>
</head>
<body>
    <div class="links">
        <a class="clientes" href="cliente-controller">Cadastro de Clientes</a>
        <a class="compras" href="compra-controller">Registrar Compras</a>
        <a class="produtos" href="produto-controller">Cadastro de Produtos</a>
        <a class="vendedores" href="vendedor-controller">Cadastro de Vendedor</a>
    </div>

</body>
</html>

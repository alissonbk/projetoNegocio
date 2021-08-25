package br.ufsm.csi.controller;


import br.ufsm.csi.dao.ClienteDAO;
import br.ufsm.csi.service.Contador;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("landingPage")
public class IndexController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        req.setAttribute("numClientes", new Contador().numeroClientes());
        req.setAttribute("numVendedores", new Contador().numeroVendedores());
        req.setAttribute("numProdutos", new Contador().numeroProdutos());
        req.setAttribute("numCompras", new Contador().numeroCompras());


        RequestDispatcher rd = req.getRequestDispatcher("/novoIndex.jsp");
        rd.forward(req, resp);

    }
}

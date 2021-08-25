package br.ufsm.csi.controller;

import br.ufsm.csi.dao.ClienteDAO;
import br.ufsm.csi.dao.CompraDAO;
import br.ufsm.csi.dao.ProdutoDAO;
import br.ufsm.csi.dao.VendedorDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("search")
public class SearchController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("compras", new CompraDAO().getCompras());
        req.setAttribute("clientes", new ClienteDAO().getClientes());
        req.setAttribute("vendedores", new VendedorDAO().getVendedores());
        req.setAttribute("produtos", new ProdutoDAO().getProdutos());
        RequestDispatcher rd = req.getRequestDispatcher("/search.jsp");
        rd.forward(req, resp);
    }
}

package br.ufsm.csi.controller;

import br.ufsm.csi.dao.ClienteDAO;
import br.ufsm.csi.dao.CompraDAO;
import br.ufsm.csi.dao.ProdutoDAO;
import br.ufsm.csi.dao.VendedorDAO;
import br.ufsm.csi.model.*;
import br.ufsm.csi.service.Contador;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("compra-controller")
public class CompraController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CompraDAO dao = new CompraDAO();
        String opcao = req.getParameter("opcao");
        String retorno = "";
        String execao = "";

        if(opcao != null){
            if(opcao.equals("excluir")){
                int id = Integer.parseInt(req.getParameter("id"));
                retorno = dao.excluir(id);

            }else if(opcao.equals("info")){
                int id = Integer.parseInt(req.getParameter("id"));
                System.out.println("id compra info: "+ id);
                Compra compra = new CompraDAO().getCompra(id);
                compra.setInfo(true);
                req.setAttribute("compra", compra);

            }else if(opcao.equals("editar")){
                int id = Integer.parseInt(req.getParameter("id"));
                System.out.println("id compra editar: "+ id);
                Compra compra = new CompraDAO().getCompra(id);
                compra.setInfo(false);
                req.setAttribute("compra", compra);

            }else{
                System.out.println(req.getParameter("id_cliente"));
                int id_cliente = Integer.parseInt(req.getParameter("id_cliente"));
                Cliente c = new Cliente(id_cliente);

                System.out.println(req.getParameter("id_vendedor"));
                int id_vendedor = Integer.parseInt(req.getParameter("id_vendedor"));
                Vendedor v = new Vendedor(id_vendedor);

                System.out.println(req.getParameter("id_produto"));
                int id_produto = Integer.parseInt(req.getParameter("id_produto"));
                Produto p = new Produto(id_produto);

                int id = Integer.parseInt(req.getParameter("idcompra"));
                Compra compra = new Compra(id, c, v, p);

                if(id > 0){
                    System.out.println("atulizar compra");
                    c.setId(Integer.parseInt(req.getParameter("id_cliente")));
                    v.setId(Integer.parseInt(req.getParameter("id_vendedor")));
                    p.setId(Integer.parseInt(req.getParameter("id_produto")));
                    retorno = dao.editar(compra);
                }else{
                    retorno = dao.cadastrar(compra);
                    req.setAttribute("opcao", "gravar");
                }

            }
        }

        req.setAttribute("retorno", retorno);
        System.out.println("Retorno--->"+retorno);

        req.setAttribute("compras", new CompraDAO().getCompras());
        req.setAttribute("clientes", new ClienteDAO().getClientes());
        req.setAttribute("vendedores", new VendedorDAO().getVendedores());
        req.setAttribute("produtos", new ProdutoDAO().getProdutos());
        RequestDispatcher rd = req.getRequestDispatcher("/compras.jsp");
        rd.forward(req, resp);
    }
}

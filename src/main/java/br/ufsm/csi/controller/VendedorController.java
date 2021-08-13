package br.ufsm.csi.controller;

import br.ufsm.csi.dao.VendedorDAO;
import br.ufsm.csi.model.Vendedor;
import br.ufsm.csi.model.Endereco;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("vendedor-controller")
public class VendedorController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        VendedorDAO dao = new VendedorDAO();
        String opcao = req.getParameter("opcao");
        String retorno = "";

        if(opcao != null){
            if(opcao.equals("excluir")){
                int id = Integer.parseInt(req.getParameter("id"));
                retorno = dao.excluir(id);

            }else if(opcao.equals("editar")){  //Pega o id do item selecionado para editar e envia um request com esse item
                int id = Integer.parseInt(req.getParameter("id"));
                Vendedor vendedor = new VendedorDAO().getVendedor(id);
                req.setAttribute("vendedor", vendedor);
            }else {
                String nome = req.getParameter("nome");
                String email = req.getParameter("email");
                String cep = req.getParameter("cep");
                String cidade = req.getParameter("cidade");
                String sigla = req.getParameter("sigla");
                String rua = req.getParameter("rua");
                Endereco e = new Endereco(cep, cidade, sigla, rua);

                int id = Integer.parseInt(req.getParameter("idvendedor"));
                Vendedor vendedor = new Vendedor(id, nome, email, e);


                if(id > 0){
                    //Se existe um id é porque será feito um editar
                    e.setId(Integer.parseInt(req.getParameter("idendereco")));
                    retorno = dao.editar(vendedor);
                }else{
                    retorno = dao.cadastrar(vendedor);
                    req.setAttribute("opcao", "gravar");
                }
            }

        }
        req.setAttribute("retorno", retorno);
        //System.out.println("Retorno--->"+retorno);

        req.setAttribute("vendedores", new VendedorDAO().getVendedores());
        RequestDispatcher rd = req.getRequestDispatcher("/vendedores.jsp");
        rd.forward(req, resp);

    }

}
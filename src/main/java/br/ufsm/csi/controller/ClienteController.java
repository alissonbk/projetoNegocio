package br.ufsm.csi.controller;

import br.ufsm.csi.dao.ClienteDAO;
import br.ufsm.csi.model.Cliente;
import br.ufsm.csi.model.Endereco;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("cliente-controller")
public class ClienteController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ClienteDAO dao = new ClienteDAO();
        String opcao = req.getParameter("opcao");
        String retorno = "";


        if(opcao != null){
            if(opcao.equals("excluir")){
                int id = Integer.parseInt(req.getParameter("id"));
                retorno = dao.excluir(id);

            }else if(opcao.equals("editar")){
                int id = Integer.parseInt(req.getParameter("id"));
                System.out.println("id cliente editar: "+ id);
                Cliente cliente = new ClienteDAO().getCliente(id);
                req.setAttribute("cliente", cliente);

            }else {
                String nome = req.getParameter("nome");
                String email = req.getParameter("email");
                String cep = req.getParameter("cep");
                String cidade = req.getParameter("cidade");
                String sigla = req.getParameter("sigla");
                String rua = req.getParameter("rua");
                Endereco e = new Endereco(cep, cidade, sigla, rua);

                int id = Integer.parseInt(req.getParameter("idcliente"));
                Cliente cliente = new Cliente(id, nome, email, e);

                if(id > 0){
                    System.out.println("atulizar cliente");
                    e.setId(Integer.parseInt(req.getParameter("idendereco")));
                    retorno = dao.editar(cliente);
                }else{
                    retorno = dao.cadastrar(cliente);
                    req.setAttribute("opcao", "gravar");
                }
            }

        }

        req.setAttribute("retorno", retorno);
        System.out.println("Retorno--->"+retorno);

        req.setAttribute("clientes", new ClienteDAO().getClientes());
        RequestDispatcher rd = req.getRequestDispatcher("/clientes.jsp");
        rd.forward(req, resp);

    }

}
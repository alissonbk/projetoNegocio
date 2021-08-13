package br.ufsm.csi.controller;

import br.ufsm.csi.dao.ProdutoDAO;
import br.ufsm.csi.model.Produto;
import br.ufsm.csi.model.Tipo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;

@WebServlet("produto-controller")
public class ProdutoController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProdutoDAO dao = new ProdutoDAO();
        String opcao = req.getParameter("opcao");
        String retorno = "";

        if(opcao != null){
            if(opcao.equals("excluir")){
                int id = Integer.parseInt(req.getParameter("id"));
                retorno = dao.excluir(id);

            }else if(opcao.equals("editar")){
                int id = Integer.parseInt(req.getParameter("id"));
                System.out.println("id produto editar: "+ id);
                Produto produto = new ProdutoDAO().getProduto(id);
                req.setAttribute("produto", produto);

            }else {

                String nome = req.getParameter("nome");
                //Tratando o valor
                String valorString = req.getParameter("valor");
                valorString = valorString.replaceAll(",", ".");
                float valor = Float.parseFloat(valorString);

                String fabricante = req.getParameter("fabricante");
                int id_tipo = Integer.parseInt(req.getParameter("id_tipo"));
                Tipo t = new Tipo(id_tipo);

                int id = Integer.parseInt(req.getParameter("idproduto"));
                Produto produto = new Produto(id, nome, valor, fabricante, t);

                if(id > 0){
                    System.out.println("atulizar produto");
                    t.setId(Integer.parseInt(req.getParameter("id_tipo")));
                    retorno = dao.editar(produto);
                }else{
                    retorno = dao.cadastrar(produto);
                    req.setAttribute("opcao", "gravar");
                }
            }
        }

        req.setAttribute("retorno", retorno);
        //System.out.println("Retorno--->"+retorno);
        req.setAttribute("produtos", new ProdutoDAO().getProdutos());
        RequestDispatcher rd = req.getRequestDispatcher("/produtos.jsp");
        rd.forward(req, resp);
    }
}

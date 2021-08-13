
package br.ufsm.csi.util;

import br.ufsm.csi.dao.ClienteDAO;
import br.ufsm.csi.dao.CompraDAO;
import br.ufsm.csi.dao.ProdutoDAO;
import br.ufsm.csi.model.*;

public class Teste {
    public static void main(String args[]){
        /*deletaProduto();
        mostraProdutos();*/
    }

/*
    //CLIENTES
    public static void mostraClientes(){
        for(Cliente c : new ClienteDAO().getClientes()){
            System.out.println("ID: "+ c.getId());
            System.out.println("Nome: "+ c.getNome());
            System.out.println("Email: "+ c.getEmail());
            System.out.println("Cidade: "+ c.getCidade().getNome());
            System.out.println("Estado: "+ c.getCidade().getSigla());
            System.out.println("\n");
        }
    }

    public static void cadastraCliente(){
        Cidade cidade = new Cidade(3, "Rio Preto");
        Cliente cliente = new Cliente("Ana", "ana@ufsm.br", cidade);
        new ClienteDAO().cadastrar(cliente);
    }


    public static void atualizaCliente(){
        Cidade cidade = new Cidade(2);
        Cliente cliente = new Cliente("Joana", "joana@ufsm.br", cidade);

        new ClienteDAO().editar(cliente);
    }


    public static void deletaCliente(){
        new ClienteDAO().delete(8);
    }


    //PRODUTOS
    public static void mostraProdutos(){
        for(Produto p : new ProdutoDAO().getProdutos()){
            System.out.println("ID: "+ p.getId());
            System.out.println("Nome: "+ p.getNome());
            System.out.println("Valor: "+ p.getValor());
            System.out.println("Fabricante: "+ p.getFabricante());
            System.out.println("Tipo: "+ p.getTipo().getNome());
            System.out.println("\n");
        }
    }

    public static void cadastraProduto(){
        Tipo tipo = new Tipo(3);
        Produto produto = new Produto("Cama", 1200.00, "Castor", tipo);

        new ProdutoDAO().cadastrarProduto(produto);
    }

    public static void atualizaProduto(){
        Tipo tipo = new Tipo(4);
        Produto produto = new Produto("Panela", 95.00, "Tramontina", tipo);

        new ProdutoDAO().updateProduto(produto, 3);
    }

    public static void deletaProduto(){
        new ProdutoDAO().deleteProduto(3);
    }


    //COMPRAS
    public static void mostraCompras(){
        for(Compra c : new CompraDAO().getCompras()){
            System.out.println("ID: "+c.getId());
            System.out.println("Data: "+c.getData());
            System.out.println("Cliente: "+c.getCliente().getNome());
            System.out.println("Vendedor: "+c.getVendedor().getNome());
            System.out.println("Produto: "+c.getProduto().getNome());
            System.out.println("\n");
        }
    }

    public static void cadastraCompra(){
            Cliente cliente = new Cliente(5);
            Vendedor vendedor = new Vendedor(1);
            Produto produto = new Produto(2);
            Compra compra = new Compra(cliente, vendedor, produto);

            new CompraDAO().cadastrarCompra(compra);
    }

    public static void deletaCompra(){
        new CompraDAO().deleteCompra(3);
    }


*/
}

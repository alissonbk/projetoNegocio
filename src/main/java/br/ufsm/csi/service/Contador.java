package br.ufsm.csi.service;

import br.ufsm.csi.dao.ClienteDAO;
import br.ufsm.csi.dao.CompraDAO;
import br.ufsm.csi.dao.ProdutoDAO;
import br.ufsm.csi.dao.VendedorDAO;

public class Contador {
    public int numeroClientes(){
        int numClientes = new ClienteDAO().getClientes().toArray().length;
        return numClientes;
    }

    public int numeroVendedores(){
        int numVendedores = new VendedorDAO().getVendedores().toArray().length;
        return numVendedores;
    }

    public int numeroProdutos(){
        int numProdutos = new ProdutoDAO().getProdutos().toArray().length;
        return numProdutos;
    }

    public int numeroCompras(){
        int numCompras = new CompraDAO().getCompras().toArray().length;
        return numCompras;
    }




}

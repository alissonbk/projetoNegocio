package br.ufsm.csi.model;

import java.sql.Date;

public class Compra {
    private int id;
    private Date data;
    private Cliente cliente;
    private Vendedor vendedor;
    private Produto produto;
    private boolean info;


    public Compra(int id, Date data, Cliente cliente, Vendedor vendedor, Produto produto){
        this.id = id;
        this.data = data;
        this.cliente = cliente;
        this.vendedor = vendedor;
        this.produto = produto;
    }
    public Compra(int id, Cliente cliente, Vendedor vendedor, Produto produto){
        this.id = id;
        this.cliente = cliente;
        this.vendedor = vendedor;
        this.produto = produto;
    }

    public Compra(){
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Vendedor getVendedor() {
        return vendedor;
    }

    public void setVendedor(Vendedor vendedor) {
        this.vendedor = vendedor;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public boolean isInfo() {
        return info;
    }

    public void setInfo(boolean info) {
        this.info = info;
    }
}

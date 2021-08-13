package br.ufsm.csi.model;

public class Produto {
    private int id;
    private String nome;
    private float valor;
    private String fabricante;
    private Tipo tipo;


    public Produto(int id, String nome, float valor, String fabricante, Tipo tipo){
        this.id = id;
        this.nome = nome;
        this.valor = valor;
        this.fabricante = fabricante;
        this.tipo = tipo;
    }
    public Produto (int id){
        this.id = id;
    }
    public Produto(int id, String nome, float valor, String fabricante){
        this.id = id;
        this.nome = nome;
        this.valor = valor;
        this.fabricante = fabricante;
    }
    public Produto(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public String getFabricante() {
        return fabricante;
    }

    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }

    public Tipo getTipo() {
        return tipo;
    }

    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
    }
}

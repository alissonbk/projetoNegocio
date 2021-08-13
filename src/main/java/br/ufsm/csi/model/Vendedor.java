package br.ufsm.csi.model;

public class Vendedor {
    private int id;
    private String nome;
    private String email;
    private Endereco endereco;

    public Vendedor(int id, String nome, String email, Endereco endereco){
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.endereco = endereco;
    }
    public Vendedor(int id){
        this.id = id;
    }
    public Vendedor(int id, String nome){
        this.id = id;
        this.nome = nome;
    }
    public Vendedor(){

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

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}

package br.ufsm.csi.model;

public class Endereco {
    private int id;
    private String cep;
    private String cidade;
    private String sigla;
    private String rua;

    public Endereco(String cep, String cidade, String sigla, String rua){
        this.cep = cep;
        this.cidade = cidade;
        this.sigla = sigla;
        this.rua = rua;
    }


    public Endereco(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }
}

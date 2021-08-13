package br.ufsm.csi.dao;

import br.ufsm.csi.model.Cliente;
import br.ufsm.csi.model.Endereco;
import br.ufsm.csi.model.Produto;
import br.ufsm.csi.model.Tipo;

import java.sql.*;
import java.util.ArrayList;

public class ProdutoDAO {
    private String sql;
    private Statement statement;
    private ResultSet resultSet;
    private PreparedStatement preparedStatement;
    private String status;

    public ArrayList<Produto> getProdutos(){
        ArrayList<Produto> produtos = new ArrayList<Produto>();

        try(Connection connection = new ConnectDB().getConexao()){
            this.sql ="SELECT * FROM produto, tipo " +
                    "WHERE produto.id_tipo = tipo.id_tipo ORDER BY id_produto";
            this.statement = connection.createStatement();
            this.resultSet = this.statement.executeQuery(this.sql);

            while(this.resultSet.next()){
                Produto produto = new Produto();
                produto.setId(this.resultSet.getInt("id_produto"));
                produto.setNome(this.resultSet.getString("nome_produto"));
                produto.setValor(this.resultSet.getFloat("valor"));
                produto.setFabricante(this.resultSet.getString("fabricante"));


                Tipo tipo = new Tipo();
                tipo.setId(this.resultSet.getInt("id_tipo"));
                tipo.setNome(this.resultSet.getString("nome_tipo"));

                produto.setTipo(tipo);

                produtos.add(produto);
            }

        }catch(SQLException e){
            e.printStackTrace();
        }

        return produtos;
    }


    public String cadastrar(Produto produto){
        try(Connection connection = new ConnectDB().getConexao()){
            connection.setAutoCommit(false);
            this.sql = "INSERT INTO produto(nome_produto, valor, fabricante, id_tipo)" +
                    "VALUES(?, ?, ?, ?)";
            this.preparedStatement = connection.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setString(1, produto.getNome());
            this.preparedStatement.setFloat(2, produto.getValor());
            this.preparedStatement.setString(3, produto.getFabricante());
            this.preparedStatement.setInt(4, produto.getTipo().getId());
            this.preparedStatement.execute();

            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();
            if(this.resultSet.getInt(1) > 0){
                produto.setId(this.resultSet.getInt(1));
                this.status = "OK";
                connection.commit();
            }

        }catch(SQLException e){
            e.printStackTrace();
            this.status = "Problems";
        }


        return this.status;
    }



    public String editar(Produto produto){

        try(Connection connection = new ConnectDB().getConexao()){
            connection.setAutoCommit(false);

            this.sql = "UPDATE produto SET nome_produto = ?, valor = ?, fabricante = ?, id_tipo = ?" +
                    "WHERE id_produto =?";
            this.preparedStatement = connection.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setString(1, produto.getNome());
            this.preparedStatement.setFloat(2, produto.getValor());
            this.preparedStatement.setString(3, produto.getFabricante());
            this.preparedStatement.setInt(4, produto.getTipo().getId());
            this.preparedStatement.setInt(5, produto.getId());
            this.preparedStatement.execute();


            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();
            if(this.resultSet.getInt(1) > 0){
                produto.setId(this.resultSet.getInt(1));
                this.status = "OK";
            }
            if(this.status.equals("OK")){
                connection.commit();
            }

        }catch(SQLException e){
            e.printStackTrace();
            this.status = "Problems";
        }

        return this.status;
    }

    //TESTAR----------------------------------
    public String excluir(int id){

        try(Connection connection = new ConnectDB().getConexao()){
            //connection.setAutoCommit(false);
            this.statement = connection.createStatement();
            this.statement.execute("DELETE FROM produto WHERE id_produto ="+id+";");
            //connection.commit();
            this.status = "OK";

        }catch(SQLException e){
            e.printStackTrace();
            this.status = "Problems";
        }
        return this.status;
    }

    public Produto getProduto(int id){
        Produto produto = new Produto();
        try(Connection connection = new ConnectDB().getConexao()){
            this.sql = "SELECT * FROM produto, tipo WHERE produto.id_tipo = tipo.id_tipo\n" +
                    "\tAND produto.id_produto = ?;";
            this.preparedStatement = connection.prepareStatement(this.sql);
            this.preparedStatement.setInt(1, id);

            this.resultSet = this.preparedStatement.executeQuery();
            while(this.resultSet.next()){
                produto.setId(this.resultSet.getInt("id_produto"));
                produto.setNome(this.resultSet.getString("nome_produto"));
                produto.setValor(this.resultSet.getFloat("valor"));
                produto.setFabricante(this.resultSet.getString("fabricante"));

                Tipo tipo = new Tipo();
                tipo.setId(this.resultSet.getInt("id_tipo"));
                tipo.setNome(this.resultSet.getString("nome_tipo"));

                produto.setTipo(tipo);
            }

        }catch(SQLException e){
            e.printStackTrace();
        }


        return produto;
    }



}

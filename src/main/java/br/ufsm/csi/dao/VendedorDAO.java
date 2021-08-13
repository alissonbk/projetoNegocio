package br.ufsm.csi.dao;

import br.ufsm.csi.model.Cliente;
import br.ufsm.csi.model.Endereco;
import br.ufsm.csi.model.Vendedor;

import java.sql.*;
import java.util.ArrayList;

public class VendedorDAO {
    private String sql;
    private Statement statement;
    private ResultSet resultSet;
    private PreparedStatement preparedStatement;
    private String status;


    public ArrayList<Vendedor> getVendedores(){
        ArrayList<Vendedor> vendedores = new ArrayList<Vendedor>();

        try(Connection connection = new ConnectDB().getConexao()){
            this.sql ="SELECT * FROM vendedor, endereco WHERE vendedor.id_endereco = endereco.id_endereco " +
                    "ORDER BY id_vendedor";
            this.statement = connection.createStatement();
            this.resultSet = this.statement.executeQuery(this.sql);

            while(this.resultSet.next()){
                Vendedor vendedor = new Vendedor();
                vendedor.setId(this.resultSet.getInt("id_vendedor"));
                vendedor.setNome(this.resultSet.getString("nome_vendedor"));
                vendedor.setEmail(this.resultSet.getString("email"));

                Endereco endereco = new Endereco();
                endereco.setId(this.resultSet.getInt("id_endereco"));
                endereco.setCep(this.resultSet.getString("cep"));
                endereco.setCidade(this.resultSet.getString("cidade"));
                endereco.setSigla(this.resultSet.getString("sigla"));
                endereco.setRua(this.resultSet.getString("rua"));
                vendedor.setEndereco(endereco);

                vendedores.add(vendedor);
            }

        }catch(SQLException e){
            e.printStackTrace();
        }

        return vendedores;
    }

    public String cadastrar(Vendedor vendedor){
        try(Connection connection = new ConnectDB().getConexao()){
            connection.setAutoCommit(false);
            String retorno = new EnderecoDAO().cadastrar(vendedor.getEndereco(), connection);
            if(retorno.equals("OK")){
                this.sql = "INSERT INTO vendedor(nome_vendedor, email, id_endereco)" +
                        "VALUES(?, ?, ?)";
                this.preparedStatement = connection.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
                this.preparedStatement.setString(1, vendedor.getNome());
                this.preparedStatement.setString(2, vendedor.getEmail());
                this.preparedStatement.setInt(3, vendedor.getEndereco().getId());
                this.preparedStatement.execute();

                this.resultSet = this.preparedStatement.getGeneratedKeys();
                this.resultSet.next();
                if(this.resultSet.getInt(1) > 0){
                    vendedor.setId(this.resultSet.getInt(1));
                    this.status = "OK";
                    connection.commit();
                }
            }

        }catch(SQLException e){
            e.printStackTrace();
            this.status = "Problems";
        }

        return this.status;
    }

    public String editar(Vendedor vendedor){

        try(Connection connection = new ConnectDB().getConexao()){
            connection.setAutoCommit(false);
            String retorno = new EnderecoDAO().editar(vendedor.getEndereco(), connection);
            if(retorno.equals("OK")){
                this.sql = "UPDATE vendedor SET nome_vendedor = ?, email = ?, id_endereco = ?" +
                        "WHERE id_vendedor = ?;";
                this.preparedStatement = connection.prepareStatement(this.sql);
                this.preparedStatement.setString(1, vendedor.getNome());
                this.preparedStatement.setString(2, vendedor.getEmail());
                this.preparedStatement.setInt(3, vendedor.getEndereco().getId());
                this.preparedStatement.setInt(4, vendedor.getId());
                this.preparedStatement.executeUpdate();

                if(this.preparedStatement.getUpdateCount() > 0){
                    this.status = "OK";
                    connection.commit();
                }
            }

        }catch(SQLException e){
            e.printStackTrace();
            this.status = "Problems";
        }
        return this.status;
    }

    public String excluir(int id){

        try(Connection connection = new ConnectDB().getConexao()){
            //connection.setAutoCommit(false);
            this.statement = connection.createStatement();
            this.statement.execute("DELETE FROM vendedor WHERE id_vendedor ="+id+";");
            //connection.commit();
            this.status = "OK";

        }catch(SQLException e){
            e.printStackTrace();
            this.status = "Problems";
        }
        return this.status;
    }

    public Vendedor getVendedor(int id){
        Vendedor vendedor = new Vendedor();

        //try-with-resources java 7
        try(Connection connection = new ConnectDB().getConexao()){
            this.sql = "SELECT * FROM vendedor, endereco \n" +
                    "\tWHERE vendedor.id_endereco = endereco.id_endereco\n" +
                    "\tAND vendedor.id_vendedor = ?;";
            this.preparedStatement = connection.prepareStatement(this.sql);
            this.preparedStatement.setInt(1, id);

            this.resultSet = this.preparedStatement.executeQuery();
            while(this.resultSet.next()){
                vendedor.setId(this.resultSet.getInt("id_vendedor"));
                vendedor.setNome(this.resultSet.getString("nome_vendedor"));
                vendedor.setEmail(this.resultSet.getString("email"));

                Endereco endereco = new Endereco();
                endereco.setId(this.resultSet.getInt("id_endereco"));
                endereco.setCep(this.resultSet.getString("cep"));
                endereco.setCidade(this.resultSet.getString("cidade"));
                endereco.setSigla(this.resultSet.getString("sigla"));
                endereco.setRua(this.resultSet.getString("rua"));
                vendedor.setEndereco(endereco);
            }

        }catch(SQLException e){
            e.printStackTrace();
        }


        return vendedor;
    }


}

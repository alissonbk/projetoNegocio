package br.ufsm.csi.dao;

import br.ufsm.csi.model.Cliente;
import br.ufsm.csi.model.Endereco;

import java.sql.*;
import java.util.ArrayList;

public class ClienteDAO {
    private String sql;
    private Statement statement;
    private ResultSet resultSet;
    private PreparedStatement preparedStatement;
    private String status;

    public ArrayList<Cliente> getClientes(){
        ArrayList<Cliente> clientes = new ArrayList<Cliente>();

        try(Connection connection = new ConnectDB().getConexao()){
            this.sql ="SELECT * FROM cliente, endereco WHERE cliente.id_endereco = endereco.id_endereco " +
                    "ORDER BY id_cliente";
            this.statement = connection.createStatement();
            this.resultSet = this.statement.executeQuery(this.sql);

            while(this.resultSet.next()){
                Cliente cliente = new Cliente();
                cliente.setId(this.resultSet.getInt("id_cliente"));
                cliente.setNome(this.resultSet.getString("nome_cliente"));
                cliente.setEmail(this.resultSet.getString("email"));

                Endereco endereco = new Endereco();
                endereco.setId(this.resultSet.getInt("id_endereco"));
                endereco.setCep(this.resultSet.getString("cep"));
                endereco.setCidade(this.resultSet.getString("cidade"));
                endereco.setSigla(this.resultSet.getString("sigla"));
                endereco.setRua(this.resultSet.getString("rua"));
                cliente.setEndereco(endereco);

                clientes.add(cliente);
            }

        }catch(SQLException e){
            e.printStackTrace();
        }

        return clientes;
    }

    public String cadastrar(Cliente cliente){
        try(Connection connection = new ConnectDB().getConexao()){
            connection.setAutoCommit(false);
            String retorno = new EnderecoDAO().cadastrar(cliente.getEndereco(), connection);
            if(retorno.equals("OK")){
                this.sql = "INSERT INTO cliente(nome_cliente, email, id_endereco)" +
                        "VALUES(?, ?, ?)";
                this.preparedStatement = connection.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
                this.preparedStatement.setString(1, cliente.getNome());
                this.preparedStatement.setString(2, cliente.getEmail());
                this.preparedStatement.setInt(3, cliente.getEndereco().getId());
                this.preparedStatement.execute();

                this.resultSet = this.preparedStatement.getGeneratedKeys();
                this.resultSet.next();
                if(this.resultSet.getInt(1) > 0){
                    cliente.setId(this.resultSet.getInt(1));
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

    public String editar(Cliente cliente){

        try(Connection connection = new ConnectDB().getConexao()){
            connection.setAutoCommit(false);
            String retorno = new EnderecoDAO().editar(cliente.getEndereco(), connection);
            if(retorno.equals("OK")){
                this.sql = "UPDATE cliente SET nome_cliente = ?, email = ?, id_endereco = ?" +
                        "WHERE id_cliente = ?;";
                this.preparedStatement = connection.prepareStatement(this.sql);
                this.preparedStatement.setString(1, cliente.getNome());
                this.preparedStatement.setString(2, cliente.getEmail());
                this.preparedStatement.setInt(3, cliente.getEndereco().getId());
                this.preparedStatement.setInt(4, cliente.getId());
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
            this.statement.execute("DELETE FROM cliente WHERE id_cliente ="+id+";");
            //connection.commit();
            this.status = "OK";

        }catch(SQLException e){
            e.printStackTrace();
            this.status = "Problems";
        }
        return this.status;
    }

    public Cliente getCliente(int id){
        Cliente cliente = new Cliente();

        //try-with-resources java 7
        try(Connection connection = new ConnectDB().getConexao()){
            this.sql = "SELECT * FROM cliente, endereco \n" +
                    "\tWHERE cliente.id_endereco = endereco.id_endereco\n" +
                    "\tAND cliente.id_cliente = ?;";
            this.preparedStatement = connection.prepareStatement(this.sql);
            this.preparedStatement.setInt(1, id);

            this.resultSet = this.preparedStatement.executeQuery();
            while(this.resultSet.next()){
                cliente.setId(this.resultSet.getInt("id_cliente"));
                cliente.setNome(this.resultSet.getString("nome_cliente"));
                cliente.setEmail(this.resultSet.getString("email"));


                Endereco endereco = new Endereco();
                endereco.setId(this.resultSet.getInt("id_endereco"));
                endereco.setCep(this.resultSet.getString("cep"));
                endereco.setCidade(this.resultSet.getString("cidade"));
                endereco.setSigla(this.resultSet.getString("sigla"));
                endereco.setRua(this.resultSet.getString("rua"));

                cliente.setEndereco(endereco);
            }

        }catch(SQLException e){
            e.printStackTrace();
        }


        return cliente;
    }




}

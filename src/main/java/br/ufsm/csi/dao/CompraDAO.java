package br.ufsm.csi.dao;

import br.ufsm.csi.model.*;

import java.sql.*;
import java.util.ArrayList;

public class CompraDAO {
    private String sql;
    private Statement statement;
    private ResultSet resultSet;
    private PreparedStatement preparedStatement;
    private String status;

    public ArrayList<Compra> getCompras(){
        ArrayList<Compra> compras = new ArrayList<Compra>();

        try(Connection connection = new ConnectDB().getConexao()){
            this.sql ="SELECT * FROM compra, cliente, vendedor, produto WHERE compra.id_cliente = cliente.id_cliente\n" +
                    "AND compra.id_vendedor = vendedor.id_vendedor AND compra.id_produto = produto.id_produto;";
            this.statement = connection.createStatement();
            this.resultSet = this.statement.executeQuery(this.sql);

            while(this.resultSet.next()){
                Compra compra = new Compra();
                compra.setId(this.resultSet.getInt("id_compra"));
                compra.setData(this.resultSet.getDate("data_compra"));

                Cliente cliente = new Cliente();
                cliente.setId(this.resultSet.getInt("id_cliente"));
                cliente.setNome(this.resultSet.getString("nome_cliente"));
                compra.setCliente(cliente);

                Vendedor vendedor = new Vendedor();
                vendedor.setId(this.resultSet.getInt("id_vendedor"));
                vendedor.setNome(this.resultSet.getString("nome_vendedor"));
                compra.setVendedor(vendedor);


                Produto produto = new Produto();
                produto.setId(this.resultSet.getInt("id_produto"));
                produto.setNome(this.resultSet.getString("nome_produto"));
                produto.setValor(this.resultSet.getFloat("valor"));
                produto.setFabricante(this.resultSet.getString("fabricante"));
                compra.setProduto(produto);

                compras.add(compra);
            }

        }catch(SQLException e){
            e.printStackTrace();
        }

        return compras;
    }


    public String cadastrar(Compra compra){
        try(Connection connection = new ConnectDB().getConexao()){
            connection.setAutoCommit(false);

            this.sql = "INSERT INTO compra(data_compra, id_cliente, id_vendedor, id_produto)" +
                    "VALUES(CURRENT_DATE, ?, ?, ?)";
            this.preparedStatement = connection.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setInt(1, compra.getCliente().getId());
            this.preparedStatement.setInt(2, compra.getVendedor().getId());
            this.preparedStatement.setInt(3, compra.getProduto().getId());
            this.preparedStatement.execute();

            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();
            if(this.resultSet.getInt(1) > 0){
                compra.setId(this.resultSet.getInt(1));
                this.status = "OK";
                connection.commit();
            }

        }catch(SQLException e){
            e.printStackTrace();
            this.status = "Problems";
        }

        return this.status;
    }

    public String editar(Compra compra){
        try(Connection connection = new ConnectDB().getConexao()){

            connection.setAutoCommit(false);
            this.sql = "UPDATE compra set data_compra = CURRENT_DATE, id_cliente = ?, id_vendedor = ?, id_produto = ?\n" +
                    "\tWHERE id_compra = ?;";
            this.preparedStatement = connection.prepareStatement(this.sql);
            this.preparedStatement.setInt(1, compra.getCliente().getId());
            this.preparedStatement.setInt(2, compra.getVendedor().getId());
            this.preparedStatement.setInt(3, compra.getProduto().getId());
            this.preparedStatement.setInt(4, compra.getId());
            this.preparedStatement.executeUpdate();

            if(this.preparedStatement.getUpdateCount() > 0){
                this.status = "OK";
                connection.commit();
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
            this.statement.execute("DELETE FROM compra WHERE id_compra ="+id+";");
            //connection.commit();
            this.status = "OK";

        }catch(SQLException e){
            e.printStackTrace();
            this.status = "Problems";
        }
        return this.status;
    }

    public Compra getCompra(int id){
        Compra compra = new Compra();


        try(Connection connection = new ConnectDB().getConexao()){
            this.sql = "SELECT * FROM compra, cliente, vendedor, produto \n" +
                    "\tWHERE compra.id_cliente = cliente.id_cliente AND\n" +
                    "\tcompra.id_vendedor = vendedor.id_vendedor AND\n" +
                    "\tcompra.id_produto = produto.id_produto AND compra.id_compra = ?;";
            this.preparedStatement = connection.prepareStatement(this.sql);
            this.preparedStatement.setInt(1, id);

            this.resultSet = this.preparedStatement.executeQuery();
            while(this.resultSet.next()){
                compra.setId(this.resultSet.getInt("id_compra"));
                compra.setData(this.resultSet.getDate("data_compra"));

                Cliente cliente = new Cliente();
                cliente.setId(this.resultSet.getInt("id_cliente"));
                cliente.setNome(this.resultSet.getString("nome_cliente"));
                compra.setCliente(cliente);

                Vendedor vendedor = new Vendedor();
                vendedor.setId(this.resultSet.getInt("id_vendedor"));
                vendedor.setNome(this.resultSet.getString("nome_vendedor"));
                compra.setVendedor(vendedor);

                Produto produto = new Produto();
                produto.setId(this.resultSet.getInt("id_produto"));
                produto.setNome(this.resultSet.getString("nome_produto"));
                produto.setValor(this.resultSet.getFloat("valor"));
                produto.setFabricante(this.resultSet.getString("fabricante"));
                compra.setProduto(produto);
            }

        }catch(SQLException e){
            e.printStackTrace();
        }

        return compra;
    }




}

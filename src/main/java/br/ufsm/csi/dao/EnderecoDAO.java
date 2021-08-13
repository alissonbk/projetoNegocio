package br.ufsm.csi.dao;

import br.ufsm.csi.model.Cliente;
import br.ufsm.csi.model.Endereco;

import java.sql.*;

public class EnderecoDAO {
    private String sql;
    private Statement statement;
    private ResultSet resultSet;
    private PreparedStatement preparedStatement;
    private String status;


    //utiliza a connection de cliente e vendedor, pois só é feito cadastro de endereço com estas classes
    public String cadastrar(Endereco endereco, Connection connection) throws SQLException{

            this.sql = "INSERT INTO endereco(cep, cidade, sigla, rua)" +
                    "VALUES(?, ?, ?, ?)";
            this.preparedStatement = connection.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setString(1, endereco.getCep());
            this.preparedStatement.setString(2, endereco.getCidade());
            this.preparedStatement.setString(3, endereco.getSigla());
            this.preparedStatement.setString(4, endereco.getRua());
            this.preparedStatement.execute();

            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();
            if(this.resultSet.getInt(1) > 0){
                endereco.setId(this.resultSet.getInt(1));
                this.status = "OK";
            }
        return this.status;
    }


    public String editar(Endereco endereco, Connection connection) throws SQLException{
        this.sql = "UPDATE endereco SET cep=?, cidade=?, sigla=?, rua = ? WHERE id_endereco = ?";
        this.preparedStatement = connection.prepareStatement(this.sql);
        this.preparedStatement.setString(1, endereco.getCep());
        this.preparedStatement.setString(2, endereco.getCidade());
        this.preparedStatement.setString(3, endereco.getSigla());
        this.preparedStatement.setString(4, endereco.getRua());
        this.preparedStatement.setInt(5, endereco.getId());
        this.preparedStatement.executeUpdate();

        if(this.preparedStatement.getUpdateCount() > 0){
            this.status = "OK";
        }

        return this.status;
    }
}

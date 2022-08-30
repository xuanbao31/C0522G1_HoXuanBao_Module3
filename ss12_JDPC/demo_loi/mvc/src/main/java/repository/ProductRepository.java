package repository;

import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String SELECT = "select * from product;";
    private static final String SAVE = "insert into product(`name`)\n" +
            "values (?)";
    private static final String DELETE = "delete from product where id = ?";
    private static final String FIND = "select * from product where id = ?";

    @Override
    public List<Product> list() {
        List<Product> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        //Statement / prepare statement ? / callable statement
        try {
            Product product;
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT);
                ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                product = new Product();
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                product.setId(id);
                product.setName(name);
                list.add(product);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }

    @Override
    public void save(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SAVE);
            preparedStatement.setString(1, product.getName());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public Product findById(int id) {
        Product product = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id1 = resultSet.getInt("id");
                String name = resultSet.getString("name");
                product = new Product(id1,name);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return product;
    }
}

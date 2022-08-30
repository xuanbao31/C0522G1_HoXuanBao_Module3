package reponsitory;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private final String SELECT_ALL = "select * from users;";
    private final String SELECT_BY_ID="select id,name,email,country from users where id =?;";
    private final String INSERT_INTO = "insert into users(`name`,email,country) values (?,?,?);";
    private final String DELETE_USER="delete from users where id = ?;";
    private final String UPDATE_USER= "update users set name = ?,email= ?, country =? where id = ?;";
    private final String SEACH_COUNTRY="select * from users where country like ?;";
    private final String SHOW_ALL_USER= " call show_all(); ";
    private final String DELETE_USERS=" call delete_user();";
    public List<model.User> findByAll() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectionDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(SHOW_ALL_USER);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public boolean add(model.User user) {
        Connection connection = BaseRepository.getConnectionDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            int num=preparedStatement.executeUpdate();
            return (num == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        boolean rowDelete = false;
        Connection connection=BaseRepository.getConnectionDB();
        try {
            CallableStatement callableStatement=connection.prepareCall(DELETE_USERS);
            callableStatement.setInt(1,id);
            return callableStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public boolean update(User user) {
        boolean rowUpdate=false;
        Connection connection=BaseRepository.getConnectionDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_USER);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            preparedStatement.setInt(4,user.getId());

            rowUpdate=preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
    }

    @Override
    public User selectById(int id) {
        User user=null;
        Connection connection=BaseRepository.getConnectionDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String country=resultSet.getString("country");
                user=new User(name,email,country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> seachCountry(String seach) {
        List<User>userList=new ArrayList<>();
        Connection connection=BaseRepository.getConnectionDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SEACH_COUNTRY);
            preparedStatement.setString(1,"%"+seach+"%");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
//                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String country=resultSet.getString("country");

                User user=new User(name,email,country);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
}

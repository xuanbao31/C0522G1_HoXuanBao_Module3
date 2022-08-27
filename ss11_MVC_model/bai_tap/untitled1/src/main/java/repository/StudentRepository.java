package repository;

import model.Student;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private final String SELECT_ALL = "select * from student;";
    private final String INSERT_INTO = "insert into student(`name`,birthday, gender,`point`, class_id,`account`,email) values (?,?,?,?,?,?,?)";

    @Override
    public List<Student> findByAll() {
        List<Student> studentList = new ArrayList<>();
// kết nối databse
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");// columnLable : tên trường trong database
                String name = resultSet.getString("name");
                Boolean gender = resultSet.getBoolean("gender");
                String birthday = resultSet.getString("birthday");
                int point = resultSet.getInt("point");
                String account = resultSet.getString("account");
                int classId = resultSet.getInt("class_id");
                String email = resultSet.getString("email");
                Student student = new Student(id, name, gender, birthday, point, account, classId, email);
                studentList.add(student);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return studentList;
    }

    @Override
    public boolean add(Student student) {
// kết nối database rồi thêm mới
Connection connection =BaseRepository.getConnectDB();
try {
//    name`,birthday, gender,`point`, class_id,`account`,email
    PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
    preparedStatement.setString(1,student.getName());
    preparedStatement.setDate(2, Date.valueOf(student.getBirthday()));
    preparedStatement.setBoolean(3, (student.isGender()));
    preparedStatement.setInt(4, student.getPoint());
    preparedStatement.setInt(5, student.getClassId());
    preparedStatement.setString(6, student.getAccount());
    preparedStatement.setString(7, student.getEmail());
int num=preparedStatement.executeUpdate(); // trả về số hàng bị ảnh hưởng
return (num==1);

} catch (SQLException throwables) {
    throwables.printStackTrace();
}
        return false;

    }
}

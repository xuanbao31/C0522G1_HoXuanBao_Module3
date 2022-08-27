package repository;

import model.Student;

import java.util.List;

public class StudentRepository implements IStudentRepository {
    @Override
    public List<Student> findByAll() {
        return null;
    }

    @Override
    public boolean add(Student student) {
        return false;
    }
}

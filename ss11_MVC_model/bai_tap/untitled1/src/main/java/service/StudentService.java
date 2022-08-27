package service;

import model.Student;
import repository.IStudentRepository;
import repository.StudentRepository;

import java.util.List;

public class StudentService implements IStudentService{
private IStudentRepository studentRepository=new StudentRepository();
    @Override
    public List<Student> findByAll() {
        return studentRepository.findByAll();
    }

    @Override
    public boolean add(Student student) {
        return studentRepository.add(student);
    }
}

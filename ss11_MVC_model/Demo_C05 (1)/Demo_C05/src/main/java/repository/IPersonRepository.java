package repository;

import model.Person;

import java.util.List;

public interface IPersonRepository {
    List<Person> list();
    List<Person> searchByName(String name);
    Person findById(int id);
    void save(Person person);
    void remove(int id);

}

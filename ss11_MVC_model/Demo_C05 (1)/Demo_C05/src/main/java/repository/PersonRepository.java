package repository;

import model.Person;

import java.util.*;

public class PersonRepository implements IPersonRepository {
        private static Map<Integer, Person> map = new HashMap<>();
//    private static List<Person> listPerson = new ArrayList<>();

    static {
//        listPerson.add(new Person(1, "An"));
//        listPerson.add(new Person(2, "Hoang"));
//        listPerson.add(new Person(3, "Hung"));
//        listPerson.add(new Person(4, "Huy"));
//        listPerson.add(new Person(5, "Chi Bao"));
        map.put(1,new Person(1,"An"));
        map.put(2,new Person(2,"Hoang"));
        map.put(3,new Person(3,"Hung"));
        map.put(4,new Person(4,"Huy"));
        map.put(5,new Person(5,"Chi Bao"));
    }

    //GC
    @Override
    public List<Person> list() {
        return new ArrayList<>(map.values());
    }

    @Override
    public List<Person> searchByName(String name) {
        List<Person> list = new ArrayList<>();
//        for (Person p : listPerson) {
//            if (p.getName().contains(name)) {
//                list.add(p);
//            }
//        }
        Set<Integer> set = map.keySet();
        for (Integer integer: set){
            if(map.get(integer).getName().contains(name)){
                list.add(map.get(integer));
            }
        }
        return list;
    }

    @Override
    public Person findById(int id) {
        return map.get(id);
    }

    @Override
    public void save(Person person) {
        int id = person.getId();
        if (id == 0) {
            List<Person> list = new ArrayList<>(map.values());
            id = list.get(list.size() - 1).getId() + 1;
            person.setId(id);
            map.put(id, person);
        } else {
            map.replace(person.getId(), person);
        }

    }

    @Override
    public void remove(int id) {
        map.remove(id);
    }
}

package reponsitory;

import model.Product;

import java.util.List;

public interface IProductReponsitory {
    List<Product> findAll();

    void save(Product product);

    List<Product> searchByName(String name);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);
}

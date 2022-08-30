package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> list ();
    void save(Product product);
    void delete(int id);
    Product findById(int id);
}

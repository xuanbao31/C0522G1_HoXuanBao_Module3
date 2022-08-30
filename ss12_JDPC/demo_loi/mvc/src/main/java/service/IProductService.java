package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> list ();
    void save(Product product);
    void delete(int id);
    Product findById(int id);
}

package reponsitory;

import model.Product;

import java.util.List;

public interface IProductReponsitory {
    List<Product>findByAll();
    void add (Product product);

}

package service;

import model.Product;
import reponsitory.IProductReponsitory;
import reponsitory.ProductReponsitory;

import java.util.List;

public class ProductServiceImpl implements IProductService{
    IProductReponsitory productReponsitory=new ProductReponsitory();
    @Override
    public List<Product> findAll() {
        return productReponsitory.findAll();
    }

    @Override
    public List<Product> searchByName(String name) {
        return productReponsitory.searchByName(name);
    }

    @Override
    public void save(Product product) {
        productReponsitory.save(product);

    }

    @Override
    public Product findById(int id) {
        return productReponsitory.findById(id);
    }

    @Override
    public void update(int id, Product product) {
        productReponsitory.update(id,product);

    }

    @Override
    public void remove(int id) {
        productReponsitory.remove(id);
    }

}

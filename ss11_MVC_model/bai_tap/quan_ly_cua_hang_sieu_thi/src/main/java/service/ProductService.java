package service;

import model.Product;
import reponsitory.IProductReponsitory;
import reponsitory.ProductReponsitory;

import java.util.List;

public class ProductService implements IProductService{
private IProductReponsitory productReponsitory=new ProductReponsitory();
    @Override
    public List<Product> findByAll() {
        return productReponsitory.findByAll();
    }

    @Override
    public void add(Product product) {
productReponsitory.add(product);

    }
}

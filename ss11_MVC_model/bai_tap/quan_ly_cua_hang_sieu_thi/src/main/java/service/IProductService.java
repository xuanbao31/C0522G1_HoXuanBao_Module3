package service;

import model.Product;

import java.util.List;

public interface IProductService {
List<Product>findByAll();
void add (Product product);
}

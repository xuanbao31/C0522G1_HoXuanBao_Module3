package reponsitory;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductReponsitory implements IProductReponsitory {
    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Nike", 3000, "Trending", "Xuan Bao"));
        products.put(2, new Product(2, "Addidas", 3000, "Trending", "Xuan Bao"));
        products.put(3, new Product(3, "Puma", 2000, "Trending", "Xuan Bao"));
        products.put(4, new Product(4, "Reebooks", 2500, "Trending", "Xuan Bao"));
        products.put(5, new Product(5, "Deple", 2000, "Trending", "Xuan Bao"));

    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> productSearch = new ArrayList<>();
        for (Product p: products.values()) {
            if (p.getName().contains(name)){
                productSearch.add(p);
            }

        }
        return productSearch;
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);

    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}

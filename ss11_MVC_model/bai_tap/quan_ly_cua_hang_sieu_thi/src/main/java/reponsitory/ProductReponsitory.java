package reponsitory;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductReponsitory implements IProductReponsitory {

    private static List<Product> productList = new ArrayList<>();

    static {

        productList.add(1, new Product(1, "Sativa", 40000, "Thịnh Hành"));
        productList.add(2, new Product(2, "Indica", 20000, "Thịnh Hành"));
        productList.add(3, new Product(3, "Kem Milo", 40000, "Đang Phát Triển"));
        productList.add(4, new Product(4, "Mirinda Soda Kem", 15000, "Hơi Hết Thời"));
    }


    @Override
    public List<Product> findByAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }
}

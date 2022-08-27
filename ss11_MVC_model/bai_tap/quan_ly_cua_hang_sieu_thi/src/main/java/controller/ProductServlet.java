package controller;

import model.Product;
import reponsitory.IProductReponsitory;
import service.IProductService;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "controller.ProductServlet", value = {"/Product"})
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = " ";
        }
        switch (action) {
            case "add":

                save(request, response);
                break;
            default:
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String tenSanPham = request.getParameter("tenSanPham");
        Double giaSanPham = Double.parseDouble(request.getParameter("giaSanPham"));
        String moTaSanPham = request.getParameter("moTaSanPham");
        Product product = new Product(id, tenSanPham, giaSanPham, moTaSanPham);
        productService.add(product);

        showFormAdd(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = " ";
        }
        switch (action) {
            case "add":
                showFormAdd(request, response);
                // them mới
            default:

        }

    }


    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/add.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showListStudent(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        request.setAttribute("productList", productService.findByAll());
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}

package controller;

import model.Product;
import service.IProductService;
import service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"", "/ProductServlet"})
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                viewProduct(request, response);
                break;
            case "search":
                showSearchForm(request, response);


            default:
                listProduct(request, response);
                break;

        }
    }

    private void showSearchForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/search.jsp");
        String name = request.getParameter("name");
        List<Product> list = productService.searchByName(name);

        request.setAttribute("list", list);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher;
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        if (product == null) {
            requestDispatcher = request.getRequestDispatcher("error.jsp");
        } else {
            request.setAttribute("product", product);
            requestDispatcher = request.getRequestDispatcher("product/edit.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher;
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        if (product == null) {
            requestDispatcher = request.getRequestDispatcher("product/error.jsp");
        } else {
            request.setAttribute("products", product);
            requestDispatcher = request.getRequestDispatcher("product/delete.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("pro", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/info.jsp");
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = this.productService.findAll();
        request.setAttribute("products", products);

        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.remove(id);
        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "view":
                view(request,response);
            default:
                break;
        }
    }

    private void view(HttpServletRequest request, HttpServletResponse response) {
        String name =request.getParameter("name");
        List<Product>  productSearch = productService.searchByName(name);
        request.setAttribute("productSearch" ,productSearch);
        try {
            request.getRequestDispatcher("product/view.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        Double price = Double.valueOf(request.getParameter("price"));
        String feedBack = request.getParameter("feedback");
        String producer = request.getParameter("producer");
        int id = (int) (Math.random() * 10000);
        Product product = new Product(id, name, price, feedBack, producer);
        this.productService.save(product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        request.setAttribute("message", "New customer was created");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Double price = Double.valueOf(request.getParameter("price"));
        String feedBack = request.getParameter("feedBack");
        String producer = request.getParameter("producer");
        Product product = new Product(id, name, price, feedBack, producer);
        this.productService.save(product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        List<Product> products = this.productService.findAll();
        request.setAttribute("products", products);
        request.setAttribute("message", "New customer was updated");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


}
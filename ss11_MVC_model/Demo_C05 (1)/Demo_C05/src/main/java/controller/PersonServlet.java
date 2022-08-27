package controller;

import model.Person;
import service.IPersonService;
import service.PersonService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PersonServlet",urlPatterns = {"","/person"})
public class PersonServlet extends HttpServlet {
    private IPersonService personService = new PersonService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                create(request,response);
                break;
            case "edit":
                edit(request,response);
                break;
            case "showdeleteform":
                showFormDelete(request,response);
                break;
            default:
                showList(request,response);
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Person person = personService.findById(id);
        String name = request.getParameter("name");
        person.setName(name);
        personService.save(person);
        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        Person person = new Person();
        person.setName(name);
        personService.save(person);

        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "search":
                search(request,response);
                break;
            case "showcreateform":
                showFormCreate(request,response);
                break;
            case "showeditform":
                showFormEdit(request,response);
                break;
            case "showdeleteform":
                showFormDelete(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "view":
                view(request,response);
                break;
            default:
                showList(request,response);
        }
    }

    private void view(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Person person = personService.findById(id);
        request.setAttribute("per",person);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("info.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        personService.remove(id);
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
//        try {
//            requestDispatcher.forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher;
        int id = Integer.parseInt(request.getParameter("id"));
        // nếu có -> trả về person / nếu không trả về null
        Person person = personService.findById(id);

        if(person == null){
            requestDispatcher = request.getRequestDispatcher("error.jsp");
        }else {
            request.setAttribute("per",person);
            requestDispatcher = request.getRequestDispatcher("delete.jsp");
        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher;
        int id = Integer.parseInt(request.getParameter("id"));
        // nếu có -> trả về person / nếu không trả về null
        Person person = personService.findById(id);

        if(person == null){
            requestDispatcher = request.getRequestDispatcher("error.jsp");
        }else {
            request.setAttribute("per",person);
            requestDispatcher = request.getRequestDispatcher("edit.jsp");
        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        String name = request.getParameter("name");
        List<Person> list = personService.searchByName(name);
        request.setAttribute("list",list);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        request.setAttribute("list",personService.list());
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

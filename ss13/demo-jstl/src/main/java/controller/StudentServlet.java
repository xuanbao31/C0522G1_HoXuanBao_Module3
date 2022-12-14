package controller;

import model.Student;
import service.IStudentService;
import service.impl.StudentService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = {"/student"})
public class StudentServlet extends HttpServlet {
    private IStudentService studentService = new StudentService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                // luu du lieu
                save(request, response);
                break;
            default:

        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int idDelete = Integer.parseInt(request.getParameter("idDelete"));
        boolean check = studentService.delete(idDelete);
        String mess="xoa khong thanh cong";
        if (check){
            mess="xoa thanh cong";
        }
        request.setAttribute("mess", mess);
        showListStudent(request,response);

    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
//        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email");
        int point = Integer.parseInt(request.getParameter("point"));
        int classId = Integer.parseInt(request.getParameter("classId"));
//        String account = request.getParameter("account");
        Student student = new Student(name,gender,birthday,point,email,classId,email);
        boolean check = studentService.add(student);
        String mess ="th??m m???i th??nh c??ng";
        if (!check){
            mess="th??m m???i kh??ng th??nh c??nn";
        }
        request.setAttribute("mess", mess);
        // tra lai trang them moi
        showFormAdd(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showFormAdd(request, response);
                // them noi
                break;
            case "delete":
                delete(request,response);
                break;
            default:
                // hien thi danh sach
                showListStudent(request, response);
        }


    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/student/add.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListStudent(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/student/list.jsp");
        request.setAttribute("studentList", studentService.findByAll());
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

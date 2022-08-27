import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList=new ArrayList<>();
    static {
        customerList.add(new Customer("Sơn Tùng M-TP","04-07-1995","Atlanta - USA","https://image.thanhnien.vn/w1024/Uploaded/2022/jhvabun/2020_12_30/photo-1-16092554908561278237856_gfat.jpg"));
        customerList.add(new Customer("Phương Ly","28-10-1990","Atlanta - USA","http://data.voh.com.vn/voh/Image/2018/12/20/434225737455109191357645636277370563330048n_20181220150837.jpg"));
        customerList.add(new Customer("Phương Ly","28-10-1990","Atlanta - USA","https://s1.img.yan.vn/YanNews/2167221/201610/20161023-070432-1y4a0094-copy_600x900.jpg"));
        customerList.add(new Customer("Hồ Xuân BẢo","31-08-2003","Atlanta - USA","https://kenh14cdn.com/203336854389633024/2021/7/1/son-tung-mtp-so-huu-3-cong-ty-giai-tri-o-tuoi-25-cdm-qua-gioi-f53bb404-1625075578725198434878.jpg"));
        customerList.add(new Customer("Sơn Tùng M-TP","04-07-1995","Atlanta - USA","https://image.thanhnien.vn/w1024/Uploaded/2022/jhvabun/2020_12_30/photo-1-16092554908561278237856_gfat.jpg"));

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher= request.getRequestDispatcher("/customer/list.jsp");

        request.setAttribute("customerList",customerList);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(request.getParameter("first-operand"));
        float secondOperand = Float.parseFloat(request.getParameter("second-operand"));
        String operator = request.getParameter("operator");
        double result = 0;
        String a ="";
        switch (operator){
            case "Addition" :
                a = "+";
                result = firstOperand + secondOperand ;
                break;
            case "Subtraction" :
                a = "-";
                result = firstOperand - secondOperand ;
                break;
            case "Division" :
                a = "%";
                result = firstOperand / secondOperand ;
                break;
            case "Multiplication" :
                a = "*";
                result = firstOperand * secondOperand ;
                break;
            default:
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("text.jsp");
        request.setAttribute("firstOperand" , firstOperand);
        request.setAttribute("secondOperand" , secondOperand);
        request.setAttribute("result" , result);
        request.setAttribute("x" , a);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

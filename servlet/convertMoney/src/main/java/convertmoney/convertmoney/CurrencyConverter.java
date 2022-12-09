package convertmoney.convertmoney;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "CurrencyConverter", value = "/convert")
public class CurrencyConverter extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        double rate = Double.parseDouble(request.getParameter("rate"));
        double usd = Double.parseDouble(request.getParameter("usd"));
        double vnd = usd * rate;
        String method = request.getMethod();

        request.setAttribute("vnd", vnd);
        request.setAttribute("method", method);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
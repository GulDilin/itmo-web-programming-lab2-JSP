package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageTitle = "Test Servlet";
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>" + pageTitle + "</title>");
        out.println("</head>");
        out.println("<body bgcolor=\"white\">");
        out.println("<h3>" + pageTitle + "</h3>");
        out.println("<p>");
        out.println("Hello, world!");
        out.println("</p>");
        out.println("</body>");
        out.println("</html>");
//        super.doGet(req, resp);
    }
}

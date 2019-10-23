package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import static java.lang.Math.abs;

public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestParser parser = new RequestParser(req);
        boolean isForm = req.getParameter("submit_btn") != null;
        HttpSession session = req.getSession();
        ResultHolder holder;
        if(session.getAttribute("result") != null){
            holder = (ResultHolder)session.getAttribute("result");
        } else {
            holder = new ResultHolder();
        }
        float x, r;
        try {
            x = parser.getX();
            r = parser.getR();
            for (Float y : parser.getY()) {
                holder.add(new Result(x, y, r, isInArea(x, y, r)));
                if (!isForm) {
                    holder.setDot(x, y ,r);
                }
            }
            session.setAttribute("result", holder);


        } catch (NumberFormatException e) {
            holder.add(new Result());
            session.setAttribute("result", holder);
        }

        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.write("<html><head>" +
                "<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">\n"+
                "<link rel=\"stylesheet\" type=\"text/css\" href=\"table-style.css\"\n>" +
                "</head><body>");
        out.write(holder.toString());
        out.write("<a href=\"index.jsp\">back to input</a>");
        out.write("</body></html>");


    }


    private boolean isInArea(float x, float y, float r) {
        return (((x > -r / 2) && (x < 0) && (((y < r) && (y > 0)) || ((y > (-x - r / 2)) && (y < 0)))) ||
                ((x < r) && (x > 0) && (y < 0) && (y > -r) && ((y * y + x * x) < r*r)));
    }
}


class RequestParser {
    private static final float[] ALLOWED_Y = {-3, -2, -1, 0, 1, 2, 3, 4, 5};

    private HttpServletRequest request;
    private final boolean isForm;

    public RequestParser(HttpServletRequest request) {
        this.request = request;
        isForm = request.getParameter("submit_btn") != null;
    }

    public ArrayList<Float> getY() throws NumberFormatException {
        ArrayList<Float> floatY = new ArrayList<Float>();
        for (String val : request.getParameterValues("y")) {
            if (isForm) {
                for (float y : ALLOWED_Y) {
                    if (y == abs(Float.parseFloat(val))) {
                        floatY.add(new Float(val));
                        break;
                    }
                }
            } else {
                floatY.add(Float.parseFloat(request.getParameter("y")));
            }
        }
        return floatY;
    }


    public float getR() throws NumberFormatException {
        float floatR = (float) Float.parseFloat(request.getParameter("r"));
        if (((4f - floatR) > 0) && ((floatR - 1f) > 0)) {
            return floatR;
        }
        throw new NumberFormatException();
    }

    public float getX() throws NumberFormatException {
        float floatX = (float) Float.parseFloat(request.getParameter("x"));

        if (isForm) {
            if (((3f - floatX) > 0) && ((floatX + 5f) > 0)) {
                return floatX;
            }
        } else return floatX;

        throw new NumberFormatException();
    }

    public boolean isForm() {
        return isForm;
    }
}
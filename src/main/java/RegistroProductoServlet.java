import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/crear")
public class RegistroProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        //Se toman los inputs del jsp
        String name = req.getParameter("nombre");
        String price = req.getParameter("precio");
        String fabricante = req.getParameter("fabricante");
        String categories = req.getParameter("categoria");

        //Se generan los errores en un tipo Map para asociar
        //campo con error
        Map<String, String> errors = new HashMap<>();

        if (name.isEmpty()) {
            errors.put("nombre", "nombre requerido");
        }
        if (price.isEmpty() || price.contains(",") || price.contains(".")) {
            errors.put("precio", "precio requerido (debe ser entero)");
        }

        if (fabricante.isEmpty() || fabricante.length() < 4 || fabricante.length() > 10) {
            errors.put("fabricante", "fabricante requerido (entre 4 y 10 caracteres)");
        }

        if (categories.isEmpty()) {
            errors.put("categoria", "categoria requerida");
        }

        if (errors.isEmpty()) {

            try (PrintWriter out = resp.getWriter()) {
                resp.setContentType("text/html");

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("   <head>");
                out.println("   <meta charset=\"UTF-8\">");
                out.println("   <title>Registro</title>");
                out.println("   </head>");
                out.println("   <body>");
                out.println("   <h2>Producto Registrado</h2>");

                out.println("   <ul>");

                out.println("   <li>Nombre: " + name + "</li>");
                out.println("   <li>Precio: " + price + "</li>");
                out.println("   <li>Fabricante: " + fabricante + "</li>");
                out.println("   <li>Categoria:" + categories + " </li>");

                out.println("   </ul>");

                out.println("   </body>");
                out.println("</html>");

            }
        } else {
            req.setAttribute("errores", errors);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}

package Controllers;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String LOGIN = "Login";
    private static final String PRODUCTLIST = "ProductList";
    private static final String HOME = "Home";
    private static final String SEARCH = "Search";
    private static final String DELETE = "Delete";
    private static final String UPDATE = "Update";
    private static final String Create_Page = "CreatePage";
    private static final String Create = "Create";
    private static final String Create_View = "create.jsp";
    private static final String Shopping_Page = "ShoppingPage";
    private static final String Shopping_View = "shopping.jsp";
    private static final String ADD = "Add";
    private static final String View = "View";
    private static final String View_Page = "cart.jsp";
    private static final String REMOVE = "Remove";
    private static final String Edit = "Edit";
    private static final String Edit_CONTROLLER = "EditController";
    private static final String Register = "register";
    private static final String Register_CONTROLLER = "RegisterController";
    private static final String Home_Page = "home.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = "HomeController";
            } else if (LOGIN.equals(action)) {
                url = "LoginController";
            } else if (SEARCH.equals(action)) {
                url = "ProductList";
            } else if (DELETE.equals(action)) {
                url = "DeleteController";
            } else if (UPDATE.equals(action)) {
                url = "UpdateController";
            } else if (Create_Page.equals(action)) {
                url = "create.jsp";
            } else if (Create.equals(action)) {
                url = "CreateController";
            } else if (Shopping_Page.equals(action)) {
                url = "shopping.jsp";
            } else if (ADD.equals(action)) {
                url = "AddToCart";
            } else if (View.equals(action)) {
                url = "cart.jsp";
            } else if (REMOVE.equals(action)) {
                url = "RemoveController";
            } else if (Edit.equals(action)) {
                url = "EditController";
            } else if (PRODUCTLIST.equals(action)) {
                url =  "ProductList";
            } else if (Register.equals(action)) {
                url = "RegisterController";
            } else if (Home_Page.equals(action)) {
                url =  "home.jsp";
            } else if (HOME.equals(action)) {
                url = "HomeController";
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

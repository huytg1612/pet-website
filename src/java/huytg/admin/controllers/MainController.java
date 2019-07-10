/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.admin.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SE130226
 */
public class MainController extends HttpServlet {

    private static final String ADD = "AdminAddController";
    private static final String LOGOUT = "AdminLogoutController";
    private static final String PROFILE = "AdminProfileController";
    private static final String CHANGE_PASSWORD = "AdminChangePasswordController";
    private static final String UPDATE = "AdminUpdateController";
    private static final String ERROR = "error.jsp";
    private static final String REGIS = "AdminRegisterController";

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

        String url = ERROR;
        try {
            String action = request.getParameter("action");

            if (action.equals("Add")) {
                url = ADD;
            } else if (action.equals("Logout")) {
                url = LOGOUT;
            } else if (action.equals("Edit")) {
                url = PROFILE;
            } else if (action.equals("ChangePassword")) {
                url = CHANGE_PASSWORD;
            } else if (action.equals("Update")) {
                url = UPDATE;
            } else if(action.equals("Register")){
                url = REGIS;
            }
            else {
                request.setAttribute("ERRRO", "This action is not supported");
            }
        } catch (Exception e) {
            log("Error at AdminMainController: " + e.getMessage());
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.controllers;

import huytg.dtos.RegistrationDTO;
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

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final String REGISTER = "RegisterController";
    private static final String EDIT = "SearchController";
    private static final String UPDATE = "UpdateController";
    private static final String LOGOUT = "LogoutController";
    private static final String INVOICE = "InvoiceController";
    private static final String INVOICE_DETAIL = "InvoiceDetailController";
    private static final String INSERT_PAGE = "user_petmanage/petInsert.jsp";
    private static final String CHANGE_PASSWORD = "ChangePasswordController";

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

            if (action.equals("Login")) {
                url = LOGIN;
            } else if (action.equals("Register")) {
                url = REGISTER;
            } else if (action.equals("Edit")) {
                url = EDIT;
            } else if (action.equals("Logout")) {
                url = LOGOUT;
            } else if (action.equals("Update")) {
                url = UPDATE;
            } else if (action.equals("InvoiceDetail")) {
                url = INVOICE_DETAIL;
            } else if (action.equals("ViewInvoice")) {
                url = INVOICE;
            } else if (action.equals("Forward")) {
                url = INSERT_PAGE;
            } else if(action.equals("changePassword")){
                url = CHANGE_PASSWORD;
            }
            else {
                request.setAttribute("ERROR", "This action is not supported");
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.getMessage());
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.controllers;

import huytg.dtos.RegistrationDTO;
import huytg.dtos.RegistrationDetailDTO;
import huytg.dtos.RegistrationErrorObject;
import huytg.models.RegistrationDAO;
import huytg.models.RegistrationDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SE130226
 */
public class LoginController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String USER = "index.jsp";
    private static final String ADMIN = "admin.jsp";

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
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");

            RegistrationDAO dao = new RegistrationDAO();
            String role = dao.checkLogin(username, password);

            HttpSession session = request.getSession();
            
            if (!role.equals("failed")) {
                if (role.equals("admin")) {
                    url = ADMIN;
                }else if(role.equals("customer")){
                    url = USER;
                }
                
                RegistrationDetailDAO daoReDe = new RegistrationDetailDAO();
                RegistrationDetailDTO dtoReDe = daoReDe.searchByPK(username);
                
                session.setAttribute("USER", new RegistrationDetailDTO(dtoReDe.getUsername(), dtoReDe.getFirstName(), dtoReDe.getLastName()));
                session.setAttribute("ROLE", role);
            } else {
                RegistrationErrorObject errorObj = new RegistrationErrorObject();
                errorObj.setLogin("Invalid username or password");
                
                request.setAttribute("INVALID_Regis", errorObj);
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.getMessage());
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

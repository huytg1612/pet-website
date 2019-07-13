/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.admin.controllers;

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

/**
 *
 * @author SE130226
 */
public class RegisterController extends HttpServlet {
    private static final String ERROR = "admin/adminRegister.jsp";
    private static final String SUCCESS = "AdminRecordController";
    
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
            boolean check = true;

            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirmPassword");
            String fName = request.getParameter("txtFirstName");
            String lName = request.getParameter("txtLastName");

            RegistrationDAO reDao = new RegistrationDAO();
            RegistrationDetailDAO deDao = new RegistrationDetailDAO();
            RegistrationErrorObject errorObj = new RegistrationErrorObject();

            if (username.isEmpty()) {
                errorObj.setUsername("Username can't be blank");
                check = false;
            }else if(username.length() < 6 || username.length() >12){
                errorObj.setUsername("Username must be from 6 to 12 chars");
                check = false;
            }
            if (password.isEmpty()) {
                errorObj.setPassword("Password can't be blank");
                check = false;
            }else if(password.length() < 6 || password.length() > 12){
                check = false;
                errorObj.setPassword("Password must be from 6 to 12 chars");
            }
            if (fName.isEmpty()) {
                errorObj.setfName("First name can't be blank");
                check = false;
            }
            if (lName.isEmpty()) {
                errorObj.setlName("Last name can't be blank");
                check = false;
            }
            if (!confirm.equals(password)) {
                errorObj.setConfirm("Confrim not match");
                check = false;
            }

            if (check) {
                RegistrationDTO dto = new RegistrationDTO(username, password, "admin", "", 0);

                if (reDao.insert(dto)) {
                    RegistrationDetailDTO deDto = new RegistrationDetailDTO(username, fName, lName);
                    deDao.insert(deDto);
                    
                    request.setAttribute("NOTICE", "Add admin successful");
                    
                    url = SUCCESS;
                } else {
                    errorObj.setRegistration("Insert failed");
                    request.setAttribute("INVALID_Regis", errorObj);
                }
            } else {
                request.setAttribute("INVALID_Regis", errorObj);
            }

        } catch (Exception e) {
            log("Error at RegisterController: " + e.getMessage());
            
            if (e.getMessage().contains("duplicate")) {
                RegistrationErrorObject errorObj = new RegistrationErrorObject();
                
                errorObj.setUsername("Username is already existed");
                request.setAttribute("INVALID_Regis", errorObj);
            }
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

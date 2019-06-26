/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.controllers;

import huytg.dtos.RegistrationDetailDTO;
import huytg.dtos.RegistrationErrorObject;
import huytg.models.RegistrationDAO;
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
public class ChangePasswordController extends HttpServlet {

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
        boolean isValid = true;

        try {
            String oldPass = request.getParameter("txtOldPassword");
            String newPass = request.getParameter("txtNewPassword");
            String confirm = request.getParameter("txtConfirm");

            HttpSession session = request.getSession();

            RegistrationDAO dao = new RegistrationDAO();
            RegistrationDetailDTO dtoReDe = (RegistrationDetailDTO) session.getAttribute("USER");

            RegistrationErrorObject errorObj = new RegistrationErrorObject();
            String username = dtoReDe.getUsername();

            if (newPass.isEmpty()) {
                errorObj.setPassword("Password can't be blank");
                isValid = false;
            }
            if (!confirm.equals(newPass)) {
                errorObj.setConfirm("Confirm is not match");
                isValid = false;
            }

            if (isValid) {
                if (oldPass.equals(dao.getPassword(username))) {
                    if (dao.changePassword(username, newPass)) {
                        request.setAttribute("NOTICE", "Change password successful");
                    } else {
                        request.setAttribute("NOTICE", "Change password failed");
                    }
                } else {
                    errorObj.setOldPassword("Old password is not correct");
                    request.setAttribute("INVALID", errorObj);
                    
                }
            } else {
                request.setAttribute("INVALID", errorObj);
            }

        } catch (Exception e) {
            log("Error at ChangePasswordController: "+e.getMessage());
        } finally {
            request.getRequestDispatcher("user/changePassword.jsp").forward(request, response);
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

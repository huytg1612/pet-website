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
public class UpdateController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "SearchController";

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

        boolean check = true;
        try {
            String fName = request.getParameter("txtFirstName");
            String lName = request.getParameter("txtLastName");
            String address = request.getParameter("txtAddress");
            String sex = request.getParameter("cboSex");
            String dob = request.getParameter("txtDOB");
            String about = request.getParameter("txtAbout");
            String phone = request.getParameter("txtPhone");
            
            HttpSession session = request.getSession();
            RegistrationDetailDTO dtoSession = (RegistrationDetailDTO) session.getAttribute("USER");
            
            String username = dtoSession.getUsername();
            
            RegistrationDetailDTO dto = new RegistrationDetailDTO(username, fName, lName, address, sex, dob, about, phone);
            RegistrationDetailDAO dao = new RegistrationDetailDAO();

            if (fName.isEmpty()) {
                check = false;
            }
            if (lName.isEmpty()) {
                check = false;
            }

            if (check) {
                if (dao.update(dto)) {
                    request.setAttribute("DTO_ReDe", dto);
                    request.setAttribute("NOTICE", "Update successful");
                    request.setAttribute("USERNAME", username);
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Update failed");
                }
            }else{
                request.setAttribute("NOTICE", "First name and last name can not be blank");
                url = SUCCESS;
            }

        } catch (Exception e) {
            log("Error at UpdateController: " + e.getMessage());
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.service.controllers;

import huytg.dtos.RegistrationDetailDTO;
import huytg.dtos.ServiceScheduleDTO;
import huytg.models.ServiceScheduleDAO;
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
public class CheckOutController extends HttpServlet {

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
        try {
            int serviceID = Integer.parseInt(request.getParameter("txtServiceID"));
            int petID = Integer.parseInt(request.getParameter("cboPetID"));
            String date = request.getParameter("cboDate");
            String time = request.getParameter("cboTime");
            float total = Float.parseFloat(request.getParameter("txtTotal"));

            HttpSession session = request.getSession();
            RegistrationDetailDTO dtoReDe = (RegistrationDetailDTO) session.getAttribute("USER");

            if (!time.equals("Time Out")) {
                String username = dtoReDe.getUsername();
                ServiceScheduleDAO dao = new ServiceScheduleDAO();

                ServiceScheduleDTO dto = new ServiceScheduleDTO(0, date, time, serviceID, username, petID, total, 0);

                if (!dao.checkContain(dto)) {
                    if (dao.insert(dto)) {
                        request.setAttribute("NOTICE", "Make an appointment successfully");
                    } else {
                        request.setAttribute("NOTICE", "Make an appointment failed");
                    }
                } else {
                    request.setAttribute("NOTICE", "Your pet have been made appointment at the same time");
                }
            }else{
                request.setAttribute("NOTICE", "Your appoinment is not valid");
            }

        } catch (Exception e) {
            log("Error at ServiceCheckOutController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher("ServiceLoadController").forward(request, response);
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

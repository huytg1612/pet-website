/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.controllers;

import huytg.dtos.AccessoryDTO;
import huytg.dtos.Accessory_InvoiceDTO;
import huytg.dtos.InvoiceDTO;
import huytg.dtos.RegistrationDetailDTO;
import huytg.models.AccessoryDAO;
import huytg.models.Accessory_InvoiceDAO;
import huytg.models.InvoiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SE130226
 */
public class InvoiceDetailController extends HttpServlet {

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
        String url = "InvoiceController";
        
        try {
            int id = Integer.parseInt(request.getParameter("txtInvoiceID"));
            HttpSession session = request.getSession();
            
            RegistrationDetailDTO dtoReDe = (RegistrationDetailDTO) session.getAttribute("USER");
            String username = dtoReDe.getUsername();
            
            Accessory_InvoiceDAO dao = new Accessory_InvoiceDAO();
            InvoiceDAO daoInvoice = new InvoiceDAO();
            
            InvoiceDTO dto = daoInvoice.getByID(id,username);
            
            List<Accessory_InvoiceDTO> list = dao.getByInvoiceID(id);
            
            request.setAttribute("LIST_InvoiceDetails", list);
            request.setAttribute("DTO_Invoice", dto);
        } catch (Exception e) {
            log("Error at InvoiceDetailController: "+e.getMessage());
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

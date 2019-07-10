/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.admin.controllers;

import huytg.dtos.Records;
import huytg.models.Accessory_InvoiceDAO;
import huytg.models.InvoiceDAO;
import huytg.models.PetDAO;
import huytg.models.RegistrationDAO;
import huytg.models.ServiceScheduleDAO;
import huytg.utils.GetDate;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SE130226
 */
public class RecordController extends HttpServlet {

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
            RegistrationDAO daoRegis = new RegistrationDAO();
            InvoiceDAO daoInvoice = new InvoiceDAO();
            ServiceScheduleDAO daoSche = new ServiceScheduleDAO();
            PetDAO daoPet = new PetDAO();
            Accessory_InvoiceDAO daoA_I = new Accessory_InvoiceDAO();
            
            int year = GetDate.getYear();
            int month = GetDate.getMonth();
            int date = GetDate.getDate();
            
            int admin = daoRegis.getNumberOfMembersByRole("admin");
            int customer = daoRegis.getNumberOfMembersByRole("customer");
            int schedule = daoSche.findByDate(year+"-"+(month+1)+"-"+date).size();
            int pet = daoPet.getCount();
            int accessory = daoA_I.getNumberOfSold();
            int service = daoSche.getCount();
            float revenueAccessory = daoInvoice.getRevenueByMonthAndYear(month, year);
            float revenueService = daoSche.getRevenueByMonthAndYear(month, year);
            float revenueLastMonth = revenueAccessory + revenueService;
            
            Records record = new Records(customer, admin, schedule, pet, accessory, service, revenueLastMonth, revenueAccessory, revenueService);
            request.setAttribute("RECORD", record);
            
        } catch (Exception e) {
            log("Error at AdminRecordController: "+e.getMessage());
        } finally{
            request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
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


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.admin.accessory.controllers;

import huytg.dtos.AccessoryDTO;
import huytg.error.AccessoryError;
import huytg.models.AccessoryDAO;
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
public class InsertController extends HttpServlet {
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "AdminRecordController";
    private static final String INVALID = "admin/adminInsertAccessory.jsp";
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
        AccessoryError error = new AccessoryError();
        String url = ERROR;
        
        try {
            boolean check = true;

            String id = request.getParameter("txtAccessoryId");
            String name = request.getParameter("txtAccessoryName");
            String txtPrice = request.getParameter("txtAccessoryPrice");
            String txtQuantity = request.getParameter("txtAccessoryQuantity");
            String types = request.getParameter("cboType");
            String madeIn = request.getParameter("cboMadeIn");
            String[] useFors = request.getParameterValues("cboMultiUseFor");
            String descrip = request.getParameter("txtAccessoryDescrip");
            String image = "/images/Accessory/" + request.getParameter("fileImage");
            
            if(useFors == null){
                useFors = new String[0];
            }
            
            String useFor = "";
            for (String s : useFors) {
                useFor += s + ",";
            }
            
            int type = 0;
            switch (types) {
                case "Collar":
                    type = 1;
                    break;
                case "Clothes":
                    type = 2;
                    break;
                case "Toys":
                    type = 3;
                    break;
                case "Feeding":
                    type = 4;
                    break;
                case "Bedding":
                    type = 5;
                    break;
                default:
                    check = false;
                    error.setType("Type is not valid");
            }
            
            float price;
            int quantity;
            
            if(useFors.length == 0){
                check = false;
                error.setUserFor("Use for must be choosen");
            }
            
            if(txtPrice.isEmpty()){
                price = 0;
            }else{
                price = Float.parseFloat(txtPrice);
            }
            
            if(txtQuantity.isEmpty()){
                quantity = -1;
            }else{
                quantity = Integer.parseInt(txtQuantity);
            }
            
            if (id.isEmpty()) {
                check = false;
                error.setId("Id can't be blank");
            }
            if (id.length() < 3 || id.length() > 10) {
                check = false;
                error.setId("Id must be from 3 to 10 chars");
            }
            if (name.isEmpty()) {
                check = false;
                error.setName("Name can't be blank");
            }
            if (name.length() < 3 || name.length() > 20) {
                check = false;
                error.setName("Name must be from 3 to 20 chars");
            }
            if (quantity < 0) {
                check = false;
                error.setQuantity("Quantity must at least 0");
            }
            if (price < 0.1) {
                check = false;
                error.setPrice("Price must at least 0.1");
            }

            if (check) {
                AccessoryDAO dao = new AccessoryDAO();
                AccessoryDTO dto = new AccessoryDTO(id, name, useFor, madeIn, descrip, price, quantity, type, 0);
                dto.setImage(image);

                if (dao.insert(dto)) {
                    request.setAttribute("NOTICE", "Insert successful");
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Insert failed");
                }
            }else{
                url = INVALID;
                request.setAttribute("INVALID", error);
            }

        } catch (Exception e) {
            log("Error at AdminAccessoryInsertController: " + e.getMessage());
            
            if(e.getMessage().contains("duplicate")){
                url = INVALID;
                error.setId("Id is already existed");
                
                request.setAttribute("INVALID", error);
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

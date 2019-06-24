/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.cart.controller;

import huytg.dtos.AccessoryDTO;
import huytg.dtos.ShoppingCart;
import huytg.models.AccessoryDAO;
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
        String responseMSG = "Update failed";

        try {
            String id = request.getParameter("txtAccessoryID");
            int quantity = Integer.parseInt(request.getParameter("txtQuantity"));

            AccessoryDAO dao = new AccessoryDAO();
            HttpSession session = request.getSession();
            ShoppingCart cart = (ShoppingCart) session.getAttribute("CART");

            if (cart != null) {
                AccessoryDTO dto = dao.searchByPK(id);
                
                System.out.println(dto.getQuantity() +" "+quantity);
                
                if (quantity <= dto.getQuantity() && quantity > 0) {

                    cart.update(id, quantity);

                    session.setAttribute("CART", cart);
                    responseMSG = "Save successful";
                } else if(quantity > dto.getQuantity()){
                    responseMSG = "Not enough quantity,"+dto.getName()+" only have "+dto.getQuantity();
                }
            }

        } catch (Exception e) {
            log("Error at CartUpdateController: " + e.getMessage());
        } finally {
            response.getWriter().write(responseMSG);
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

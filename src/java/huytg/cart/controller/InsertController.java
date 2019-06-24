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
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SE130226
 */
public class InsertController extends HttpServlet {
    
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
        
        String id = request.getParameter("txtAccessoryID");
        AccessoryDAO dao = new AccessoryDAO();
        
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart)session.getAttribute("CART");
        if(cart == null){
            cart = new ShoppingCart();
        }
        try {
            AccessoryDTO dto = dao.searchByPK(id);
            
            if(dto.getQuantity() >= 1){
                AccessoryDTO dtoCart = new AccessoryDTO(dto.getId(), dto.getName(), dto.getPrice(), 1, dto.getImage());
                cart.insert(dtoCart);
                
                session.setAttribute("CART", cart);
            }else{
                request.setAttribute("INVALID", "Sorry, quantity is not enough");
            }
        } catch (Exception e) {
            log("Error at CartInsertController: "+e.getMessage());
        }finally{
            response.getWriter().write(""+cart.getSize());
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.cart.controller;

import huytg.dtos.RegistrationDTO;
import huytg.dtos.RegistrationDetailDTO;
import huytg.dtos.ShoppingCart;
import huytg.models.CheckOutProcess;
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
    private static final String SUCCESS = "SystemLoadController";
    private static final String FAIL = "accessory/viewCart.jsp";
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
        String url = FAIL;
        
        try {
            HttpSession session = request.getSession();

            RegistrationDetailDTO user = (RegistrationDetailDTO) session.getAttribute("USER");
            ShoppingCart cart = (ShoppingCart) session.getAttribute("CART");

            if (user != null) {
                if (cart != null) {
                    CheckOutProcess checkProcess = new CheckOutProcess(cart);
                    if (checkProcess.checkCart()) {
                        cart.setCustomerName(user.getUsername());
                        if (checkProcess.checkOut()) {
                            session.setAttribute("CART", null);
                            request.setAttribute("NOTICE", "Check out successfully");
                            
                            url = SUCCESS;
                        }

                    }
                }
            } else {
                request.setAttribute("NOTICE", "Login");
            }

        } catch (Exception e) {
            System.out.println("Error at CartCheckOutController: " + e.getMessage());
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

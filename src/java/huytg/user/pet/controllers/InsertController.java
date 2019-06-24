/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.user.pet.controllers;

import huytg.dtos.PetDTO;
import huytg.dtos.RegistrationDetailDTO;
import huytg.error.PetError;
import huytg.models.PetDAO;
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
        String url = "petInsert.jsp";
        
        boolean isValid = true;
        try {
            String name = request.getParameter("txtPetName");
            String dob = request.getParameter("txtPetDOB");
            String sex = request.getParameter("cboPetSex");
            String type = request.getParameter("cboPetType");
            String image = "/images/Pets/"+request.getParameter("filePetImage");
            String descrip = request.getParameter("txtPetDescription");
                    
            PetError petError = new PetError();
            
            if(name.isEmpty()){
                petError.setNameError("Name can't be blank");
                isValid = false;
            }
            if(!sex.equals("Male") && ! sex.equals("Female")){
                petError.setSexError("Sex is not valid. Just Male or Female");
                isValid = false;
            }
            if(!type.equals("Dog") && type.equals("Cat") && !type.equals("Fish") && !type.equals("Hamster") && !type.equals("Bird")){
                petError.setTypeError("Type is not valid");
                isValid = false;
            }
            
            if(isValid){
                PetDAO dao = new PetDAO();
                
                int typeID = 0;
                
                switch(type){
                    case "Dog": typeID = 1;
                    break;
                    case "Cat": typeID = 2;
                    break;
                    case "Fish": typeID = 3;
                    break;
                    case "Hamster": typeID = 4;
                    break;
                    case "Bird": typeID = 5;
                    break;
                }
                
                HttpSession session = request.getSession();
                RegistrationDetailDTO dtoReDe = (RegistrationDetailDTO) session.getAttribute("USER");
                
                PetDTO dto = new PetDTO(typeID, name, dob, sex, descrip, 0, typeID, dtoReDe.getUsername(), image);
                if(!dao.insert(dto)){
                    request.setAttribute("NOTICE", "Insert failed");
                }else{
                    request.setAttribute("NOTICE", "Insert successful");
                }
            }else {
                request.setAttribute("INVALID", petError);
            }
        } catch (Exception e) {
            log("Error at PetInsertController: "+e.getMessage());
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

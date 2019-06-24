/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.models;

import huytg.dtos.AccessoryDTO;
import huytg.dtos.Accessory_InvoiceDTO;
import huytg.dtos.InvoiceDTO;
import huytg.dtos.ShoppingCart;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author SE130226
 */
public class CheckOutProcess {
    private ShoppingCart cart;

    public CheckOutProcess() {
    }

    public CheckOutProcess(ShoppingCart cart) {
        this.cart = cart;
    }
   
    public boolean checkCart() throws Exception{
        boolean check = true;
        if(cart != null){
            HashMap<String,AccessoryDTO> mapCart = cart.getCart();
            AccessoryDAO dao = new AccessoryDAO();
            
            for (Map.Entry<String, AccessoryDTO> entry : mapCart.entrySet()) {
                String key = entry.getKey();
                AccessoryDTO value = entry.getValue();
                
                int quantityCart = value.getQuantity();
                AccessoryDTO dto = dao.searchByPK(key);
                
                if(quantityCart > dto.getQuantity()){
                    check = false;
                    break;
                }
                
            }
        }
            
        return check;
    }
    
    public boolean checkOut(){
        boolean check = true;
        
        try {
            InvoiceDAO daoInvoice = new InvoiceDAO();
            InvoiceDTO dtoInvoice = new InvoiceDTO(0, cart.getCustomerName(), "", cart.getTotal());
            
            int invoiceID = daoInvoice.insert(dtoInvoice);
            
            AccessoryDAO daoAccess = new AccessoryDAO();
            Accessory_InvoiceDAO daoA_I = new Accessory_InvoiceDAO();
            
            HashMap<String,AccessoryDTO> mapCart = cart.getCart();
            Accessory_InvoiceDTO dtoA_I = null;
            
            for (Map.Entry<String, AccessoryDTO> entry : mapCart.entrySet()) {
                String accessoryID = entry.getKey();
                AccessoryDTO value = entry.getValue();
                
                int quantity = value.getQuantity();
                daoAccess.updateQuantity(accessoryID, quantity);
                
                dtoA_I = new Accessory_InvoiceDTO(invoiceID, accessoryID, quantity);
                daoA_I.insert(dtoA_I);
                
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            check = false;
        }
        
        return check;
    }
}

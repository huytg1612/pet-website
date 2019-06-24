/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.dtos;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author SE130226
 */
public class ShoppingCart implements Serializable {

    private String customerName;
    private HashMap<String, AccessoryDTO> cart;

    public ShoppingCart() {
        customerName = "Guest";
        cart = new HashMap<>();
    }

    public ShoppingCart(String customerName) {
        this.customerName = customerName;
        cart = new HashMap<>();
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public HashMap<String, AccessoryDTO> getCart() {
        return cart;
    }

    public void setCart(HashMap<String, AccessoryDTO> cart) {
        this.cart = cart;
    }

    public void insert(AccessoryDTO dto){
        if(cart.containsKey(dto.getId())){
            int quantity = cart.get(dto.getId()).getQuantity() + 1;
            dto.setQuantity(quantity);
        }
        
        cart.put(dto.getId(), dto);
    }
    
    public void update(String id,int quantity){
        AccessoryDTO dto = cart.get(id);
        dto.setQuantity(quantity);
        
        cart.put(id, dto);
    }
    
    public void delete(String id){
        cart.remove(id);
    }
    
    public float getTotal(){
        float total = 0;
        for (Map.Entry<String, AccessoryDTO> entry : cart.entrySet()) {
            String key = entry.getKey();
            AccessoryDTO value = entry.getValue();
            
            total += (value.getQuantity()*value.getPrice());
            
        }
        return total;
    }
    
    public int getSize(){
        return cart.size();
    }

    public Iterable<Map.Entry<Object, Object>> entrySet() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}

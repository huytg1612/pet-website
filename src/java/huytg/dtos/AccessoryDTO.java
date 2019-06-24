/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.dtos;

import java.io.Serializable;

/**
 *
 * @author SE130226
 */
public class AccessoryDTO implements Serializable{
    private String id,name,useFor,madeIn,description;
    private float price;
    private int quantity,type,status;
    private String image;
    
    public AccessoryDTO(String id,String name,int quantity,float price){
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
    }
    
    public AccessoryDTO(String id, String name, float price, int quantity,String image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }
    
    public AccessoryDTO(String id, String name, String useFor, String madeIn, String description, float price, int quantity, int type, int status) {
        this.id = id;
        this.name = name;
        this.useFor = useFor;
        this.madeIn = madeIn;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.type = type;
        this.status = status;
    }
    
    public AccessoryDTO(String id, String name, String useFor, float price, int type) {
        this.id = id;
        this.name = name;
        this.useFor = useFor;
        this.price = price;
        this.type = type;
    }

    public AccessoryDTO(String id, String name, String useFor, float price, int type, int status) {
        this.id = id;
        this.name = name;
        this.useFor = useFor;
        this.price = price;
        this.type = type;
        this.status = status;
    }

    
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUseFor() {
        return useFor;
    }

    public void setUseFor(String useFor) {
        this.useFor = useFor;
    }

    public String getMadeIn() {
        return madeIn;
    }

    public void setMadeIn(String madeIn) {
        this.madeIn = madeIn;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    @Override
    public String toString() {
        return "AccessoryDTO{" + "id=" + id + ", name=" + name + ", useFor=" + useFor + ", madeIn=" + madeIn + ", description=" + description + ", price=" + price + ", quantity=" + quantity + ", type=" + type + ", status=" + status + '}';
    }
    
    
}

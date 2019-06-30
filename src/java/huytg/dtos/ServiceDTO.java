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
public class ServiceDTO implements Serializable{
    private int id;
    private String name;
    private float price;
    private String descrip,image;

    public ServiceDTO(int id, String name, float price, String descrip,String image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.descrip = descrip;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
}

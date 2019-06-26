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
public class PetDTO implements Serializable{
    private int id;
    private String name,dob,sex,descrip;
    private int status,type;
    private String image,username;

    public PetDTO(int id, String name, String dob, String sex, String descrip, int status, int type, String username,String image) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.sex = sex;
        this.descrip = descrip;
        this.status = status;
        this.type = type;
        this.image = image;
        this.username = username;
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

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "PetDTO{" + "id=" + id + ", name=" + name + ", dob=" + dob + ", sex=" + sex + ", descrip=" + descrip + ", status=" + status + ", type=" + type + ", image=" + image + ", username=" + username + '}';
    }
    
}

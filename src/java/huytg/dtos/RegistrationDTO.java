/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.dtos;

/**
 *
 * @author SE130226
 */
public class RegistrationDTO {
    private String username,password,role,dateStart;
    private int status;

    public RegistrationDTO(){
        
    }
    
    public RegistrationDTO(String username, String role, String dateStart, int status) {
        this.username = username;
        this.role = role;
        this.dateStart = dateStart;
        this.status = status;
    }

    public RegistrationDTO(String username, String password, String role, String dateStart, int status) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.dateStart = dateStart;
        this.status = status;
    }

    public RegistrationDTO(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public RegistrationDTO(String username, String role, int status) {
        this.username = username;
        this.role = role;
        this.status = status;
    }
    
    
    
    public RegistrationDTO(String username, String role) {
        this.username = username;
        this.role = role;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }


    @Override
    public String toString() {
        return "RegistrationDTO{" + "username=" + username + ", password=" + password + ", role=" + role + ", dateStart=" + dateStart + ", status=" + status + ", cusID=" +  '}';
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.models;

import huytg.conn.MyConnection;
import huytg.dtos.RegistrationDetailDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author SE130226
 */
public class RegistrationDetailDAO implements Serializable{
    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;
    
    private void closeConnection(){
        try {
            if(rs != null)
                rs.close();
            if(preStm != null)
                preStm.close();
            if(conn != null)
                conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public boolean insert(RegistrationDetailDTO dto) throws Exception{
        boolean check = false;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert into tbl_RegistrationDetail(Username,FirstName,LastName) values(?,?,?)";
            preStm = conn.prepareStatement(sql);
            
            preStm.setString(1, dto.getUsername());
            preStm.setString(2, dto.getFirstName());
            preStm.setString(3, dto.getLastName());
            
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        
        return check;
    }
    
    public boolean update(RegistrationDetailDTO dto) throws Exception{
        boolean check = false;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update tbl_RegistrationDetail "
                    + "Set FirstName = ?,LastName = ?,Address = ?,Sex = ? ,DOB = ?,About = ?,Phone = ? "
                    + "Where Username = ?";
            
            preStm = conn.prepareStatement(sql);
            
            preStm.setString(1, dto.getFirstName());
            preStm.setString(2, dto.getLastName());
            preStm.setString(3, dto.getAddress());
            preStm.setInt(4, dto.getSex().equals("Male") ? 0 : 1);
            preStm.setString(5, dto.getDob());
            preStm.setString(6, dto.getAbout());
            preStm.setString(7, dto.getPhone());
            preStm.setString(8, dto.getUsername());
            
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        
        return check;
    }
    
    public RegistrationDetailDTO searchByPK(String username) throws Exception{
        RegistrationDetailDTO dto = null;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select FirstName,LastName,Address,Sex,DOB,About,Phone From tbl_RegistrationDetail Where Username = ?";
            preStm = conn.prepareStatement(sql);
            
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            
            if(rs.next()){
                String fName = rs.getString("FirstName");
                String lName = rs.getString("LastName");
                String address = rs.getString("Address");
                String sex = rs.getInt("Sex") == 0 ? "Male" : "Female";
                String dob = rs.getString("DOB");
                String about = rs.getString("About");
                String phone = rs.getString("Phone");
                
                dto = new RegistrationDetailDTO(username, fName, lName, address, sex, dob, about, phone);
            }
        } finally {
            closeConnection();
        }
        
        return dto;
    }
}

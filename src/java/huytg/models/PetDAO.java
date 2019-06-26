/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.models;

import huytg.conn.MyConnection;
import huytg.dtos.PetDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SE130226
 */
public class PetDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public PetDAO() {

    }

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public List<PetDTO> getByUsername(String username) throws Exception {
        List<PetDTO> list = null;

        String name, dob, descrip, sex,image;
        int id, status, type;

        PetDTO dto;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select ID,Name,DOB,Sex,Description,Status,Type,Image From tbl_Pet Where Username = ? And Status = 0";
            preStm = conn.prepareStatement(sql);

            preStm.setString(1, username);
            rs = preStm.executeQuery();
            
            list = new ArrayList<>();
            while (rs.next()) {
                id = rs.getInt("ID");
                name = rs.getString("Name");
                dob = rs.getDate("DOB").toString();
                sex = rs.getInt("Sex") == 1 ? "Male" : "Female";
                descrip = rs.getString("Description");
                status = rs.getInt("Status");
                type = rs.getInt("Type");
                image = rs.getString("Image");
                
                dto = new PetDTO(id, name, dob, sex, descrip, status, type, username,image);
                list.add(dto);
            }

        } finally {
            closeConnection();
        }

        return list;
    }
    
    public boolean insert(PetDTO dto) throws Exception{
        boolean check = false;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert into tbl_Pet(Name,DOB,Sex,Description,Status,Type,Image,Username) values(?,?,?,?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            
            preStm.setString(1, dto.getName());
            preStm.setString(2, dto.getDob());
            preStm.setInt(3, dto.getSex().equals("Male") ? 0 : 1);
            preStm.setString(4, dto.getDescrip());
            preStm.setInt(5, dto.getStatus());
            preStm.setInt(6, dto.getType());
            preStm.setString(7, dto.getImage());
            preStm.setString(8, dto.getUsername());
            
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        
        return check;
    }
    
    public PetDTO findByPK(int id) throws Exception{
        PetDTO dto = null;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select ID,Name,DOB,Sex,Description,Status,Type,Image,Username From tbl_Pet Where ID = ?";
            preStm = conn.prepareStatement(sql);
            
            preStm.setInt(1, id);
            rs = preStm.executeQuery();
            
            if(rs.next()){
                String name = rs.getString("Name");
                String dob = rs.getDate("DOB").toString();
                String sex = rs.getInt("Sex") == 0 ? "Male" : "Female";
                String descript = rs.getString("Description");
                int status = rs.getInt("Status");
                int type = rs.getInt("Type");
                String image = rs.getString("Image");
                String username = rs.getString("Username");
                
                dto = new PetDTO(id, name, dob, sex, descript, status, type, username,image);
            }
        } finally {
            closeConnection();
        }
        
        return dto;
    }
    
    public boolean delete(int id) throws Exception{
        boolean check = false;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update tbl_Pet Set Status = 1 Where ID = ?";
            preStm = conn.prepareStatement(sql);
            
            preStm.setInt(1, id);
            
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        
        return check;
        
    }
    
    public boolean update(PetDTO dto) throws Exception{
        boolean check = false;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update tbl_Pet Set Name = ?,DOB = ?,Sex = ?,Description = ?,"
                    + "Type = ?,Image = ? Where ID = ?";
            preStm = conn.prepareStatement(sql);
            
            preStm.setString(1, dto.getName());
            preStm.setString(2, dto.getDob());  
            preStm.setInt(3, dto.getSex().equals("Male") ? 0 : 1);
            preStm.setString(4, dto.getDescrip());
            preStm.setInt(5, dto.getType());
            preStm.setString(6, dto.getImage());
            preStm.setInt(7, dto.getId());
            
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        
        return check;
    }
}

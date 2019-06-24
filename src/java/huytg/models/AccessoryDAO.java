/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.models;

import huytg.conn.MyConnection;
import huytg.dtos.AccessoryDTO;
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
public class AccessoryDAO implements Serializable {

    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;

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

    public List<AccessoryDTO> searchByLikeName(String name, String displayFor) throws Exception {
        List<AccessoryDTO> list = null;

        AccessoryDTO dto = null;

        String id = null, accesName = null, useFor = null;
        float price = 0;
        int type = 0;

        try {
            conn = MyConnection.getMyConnection();
            String sql = null;

            if (displayFor.equals("admin")) {
                sql = "Select ID,Name,UseFor,Price,Type,Status From tbl_Accessory Where Name like ?";
            } else if (displayFor.equals("customer")) {
                sql = "Select ID,Name,UseFor,Price,Type,Image From tbl_Accessory Where Name like ? and Status = 0";
            }
            preStm = conn.prepareStatement(sql);

            preStm.setString(1, "%" + name + "%");

            rs = preStm.executeQuery();
            list = new ArrayList<>();

            while (rs.next()) {
                id = rs.getString("ID");
                accesName = rs.getString("Name");
                useFor = rs.getString("UseFor");
                price = rs.getFloat("Price");
                type = rs.getInt("Type");

                if (displayFor.equals("customer")) {
                    dto = new AccessoryDTO(id, accesName, useFor, price, type);
                    dto.setImage(rs.getString("Image"));
                } else if (displayFor.equals("admin")) {
                    dto = new AccessoryDTO(id, accesName, useFor, price, type, rs.getInt("Status"));
                }
                list.add(dto);
            }
        } finally {
            closeConnection();
        }

        return list;
    }

    public boolean delete(String id) throws Exception {
        boolean check = false;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update tbl_Accessory Set Status = 1 Where ID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);

            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }

        return true;
    }

    public boolean insert(AccessoryDTO dto) throws Exception {
        boolean check = false;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert into tbl_Accessory(ID,Name,Price,Quantity,UseFor,Type,Status,MadeIn,Description,Image) "
                    + "values(?,?,?,?,?,?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);

            preStm.setString(1, dto.getId());
            preStm.setString(2, dto.getName());
            preStm.setFloat(3, dto.getPrice());
            preStm.setInt(4, dto.getQuantity());
            preStm.setString(5, dto.getUseFor());
            preStm.setInt(6, dto.getType());
            preStm.setInt(7, dto.getStatus());
            preStm.setString(8, dto.getMadeIn());
            preStm.setString(9, dto.getDescription());
            preStm.setString(10, dto.getImage());

            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }

        return check;
    }

    public AccessoryDTO searchByPK(String id) throws Exception {
        AccessoryDTO dto = null;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select ID,Name,Price,Quantity,UseFor,Type,Status,MadeIn,Description,Image From tbl_Accessory "
                    + "Where ID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);

            rs = preStm.executeQuery();

            if (rs.next()) {
                String name = rs.getString("Name");
                float price = rs.getFloat("Price");
                int quantity = rs.getInt("Quantity");
                String useFor = rs.getString("UseFor");
                int type = rs.getInt("Type");
                int status = rs.getInt("Status");
                String madeIn = rs.getString("MadeIn");
                String descrip = rs.getString("Description");
                String image = rs.getString("Image");

                dto = new AccessoryDTO(id, name, useFor, madeIn, descrip, price, quantity, type, status);
                dto.setImage(image);
            }
        } finally {
            closeConnection();
        }

        return dto;
    }

    public boolean update(AccessoryDTO dto) throws Exception {
        boolean check = false;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update tbl_Accessory Set Name = ?,Price = ?,Quantity = ?,UseFor = ?,Type = ?,Status = ?,MadeIn = ?,Description = ? "
                    + "Where ID = ?";

            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getName());
            preStm.setFloat(2, dto.getPrice());
            preStm.setInt(3, dto.getQuantity());
            preStm.setString(4, dto.getUseFor());
            preStm.setInt(5, dto.getType());
            preStm.setInt(6, dto.getStatus());
            preStm.setString(7, dto.getMadeIn());
            preStm.setString(8, dto.getDescription());
            preStm.setString(9, dto.getId());

            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }

        return check;
    }
    
    public List<AccessoryDTO> findByType(String typeSearch) throws Exception{
        List<AccessoryDTO> list = null;
        
        String id,name,image,useFor;
        int price,type;
        
        AccessoryDTO dto = null;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select ID,Name,UseFor,Price,Type,Image From tbl_Accessory Where Type in "
                    + "(Select ID From tbl_AccessoryType Where Type = ?) AND Status = 0";
            preStm = conn.prepareStatement(sql);
            
            preStm.setString(1, typeSearch);
            rs = preStm.executeQuery();
            
            list = new ArrayList<>();
            while(rs.next()){
                id = rs.getString("ID");
                name = rs.getString("Name");
                image = rs.getString("Image");
                price = rs.getInt("Price");
                type = rs.getInt("Type");
                useFor = rs.getString("UseFor");
                
                dto = new AccessoryDTO(id, name, useFor, price, type);
                dto.setImage(image);
                
                list.add(dto);
            }
            
        } finally {
            closeConnection();
        }
        
        return list;
    }
    
    public boolean updateQuantity(String id,int quantity) throws Exception{
        boolean check = false;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update tbl_Accessory Set Quantity = Quantity - ? Where ID = ?";
            preStm = conn.prepareStatement(sql);
            
            preStm.setInt(1, quantity);
            preStm.setString(2, id);
            
            check = preStm.executeUpdate() > 0;
            
        } finally {
            closeConnection();
        }
        
        return check;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.models;

import huytg.conn.MyConnection;
import huytg.dtos.ServiceDTO;
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
public class ServiceDAO implements Serializable{
    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;
    
    private void closeConnection() throws Exception{
        if(rs != null)
            rs.close();
        if(preStm != null)
            preStm.close();
        if(conn != null)
            conn.close();
    }
    
    public List<ServiceDTO> getAll() throws Exception{
        List<ServiceDTO> list = null;
        
        ServiceDTO dto;
        
        int id;
        String name,descrip,image;
        float price;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select ID,Name,Price,Description,Image From tbl_Service";
            preStm = conn.prepareStatement(sql);
            
            rs = preStm.executeQuery();
            list = new ArrayList<>();
            
            while(rs.next()){
                id = rs.getInt("ID");
                name = rs.getString("Name");
                price = rs.getFloat("Price");
                descrip = rs.getString("Description");
                image = rs.getString("Image");
                
                dto = new ServiceDTO(id, name, price, descrip,image);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        
        return list;
    }
    
    public ServiceDTO findByPK(int id) throws Exception{
        ServiceDTO dto = null;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select Name,Price,Description,Image From tbl_Service Where ID = ?";
            preStm = conn.prepareStatement(sql);
            
            preStm.setInt(1, id);
            rs = preStm.executeQuery();
            
            if(rs.next()){
                String name = rs.getString("Name");
                float price =rs.getFloat("Price");
                String descrip = rs.getString("Description");
                String image = rs.getString("Image");
                
                dto = new ServiceDTO(id, name, price, descrip,image);
            }
        } finally {
            closeConnection();
        }
        
        return dto;
    }
}

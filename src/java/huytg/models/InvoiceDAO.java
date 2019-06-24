/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.models;

import huytg.conn.MyConnection;
import huytg.dtos.InvoiceDTO;
import huytg.utils.GetDate;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SE130226
 */
public class InvoiceDAO implements Serializable{
    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;
    
    private void closeConnection() throws Exception{
        if(rs != null)
            rs.close();
        if(preStm != null)
            preStm.close();
        if(conn != null)
            conn.close();
    }
    
    public int insert(InvoiceDTO dto) throws Exception{
        int id = -1;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert into tbl_Invoice(Username,Date,Total) values(?,?,?)";
            preStm = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            
            preStm.setString(1, dto.getUsername());
            preStm.setString(2, GetDate.getCurrentDate().toString());
            preStm.setFloat(3, dto.getTotal());
            
            preStm.executeUpdate();
            rs = preStm.getGeneratedKeys();
            
            if(rs.next()){
                id = rs.getInt(1);
            }
            
        } finally {
            closeConnection();
        }
        
        return id;
    }
    
    public List<InvoiceDTO> getByUsername(String username) throws Exception{
        List<InvoiceDTO> list = null;
        
        int id,total;
        String date;
        
        InvoiceDTO dto = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select ID,Date,Total From tbl_Invoice Where Username = ?";
            preStm = conn.prepareStatement(sql);
            
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            
            list = new ArrayList<>();
            while(rs.next()){
                id = rs.getInt("ID");
                date = rs.getDate("Date").toString();
                total = rs.getInt("Total");
                
                dto = new InvoiceDTO(id, username, date, total);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        
        return list;
    }
}

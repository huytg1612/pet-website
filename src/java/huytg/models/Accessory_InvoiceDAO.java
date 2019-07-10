/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.models;

import huytg.conn.MyConnection;
import huytg.dtos.Accessory_InvoiceDTO;
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
public class Accessory_InvoiceDAO implements Serializable {

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

    public boolean insert(Accessory_InvoiceDTO dto) throws Exception {
        boolean check = false;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert into tbl_Accessory_Invoice(InvoiceID,AccessoryID,Quantity) values(?,?,?)";
            preStm = conn.prepareStatement(sql);

            preStm.setInt(1, dto.getInvoiceId());
            preStm.setString(2, dto.getAccessoryId());
            preStm.setInt(3, dto.getQuantity());

            check = preStm.executeUpdate() > 0;

        } finally {
            closeConnection();
        }

        return check;
    }

    public List<Accessory_InvoiceDTO> getByInvoiceID(int id) throws Exception {
        List<Accessory_InvoiceDTO> list = null;

        String accessoryID,accessoryName;
        int quantity;
        float price;
        
        Accessory_InvoiceDTO dto = null;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select AccessoryID,Quantity,\n"
                    + "(Select Name From tbl_Accessory Where AccessoryID = ID)as AccessoryName,\n"
                    + "(Select Price From tbl_Accessory Where AccessoryID = ID) as AccessoryPrice\n"
                    + "From tbl_Accessory_Invoice\n"
                    + "Where InvoiceID = ?";
            preStm = conn.prepareStatement(sql);

            preStm.setInt(1, id);
            rs = preStm.executeQuery();

            list = new ArrayList<>();
            while (rs.next()) {
                accessoryID = rs.getString("AccessoryID");
                quantity = rs.getInt("Quantity");
                accessoryName = rs.getString("AccessoryName");
                price = rs.getFloat("AccessoryPrice");

                dto = new Accessory_InvoiceDTO(id, accessoryID, quantity, accessoryName, price);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }

        return list;
    }
    
    public int getNumberOfSold() throws Exception{
        int total = 0;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select SUM(Quantity) as Total From tbl_Accessory_Invoice";
            preStm = conn.prepareStatement(sql);
            
            rs = preStm.executeQuery();
            if(rs.next()){
                total = rs.getInt("Total");
            }
                   
        } finally {
            closeConnection();
        }
        
        return total;
    }
}

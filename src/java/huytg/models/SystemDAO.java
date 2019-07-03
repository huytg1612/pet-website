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
public class SystemDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

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

    public List<AccessoryDTO> getTopSales() throws Exception {
        List<AccessoryDTO> list = null;

        AccessoryDTO dto;

        String id, name;
        int quantity;
        float price;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "SELECT TOP 10 AccessoryID,SUM(Quantity) as Sold,\n"
                    + "(Select Name From tbl_Accessory Where ID = AccessoryID) as Name,\n"
                    + "(Select Price From tbl_Accessory Where ID = AccessoryID) as Price,\n"
                    + "(Select Quantity From tbl_Accessory Where ID = AccessoryID) as Quantity,\n"
                    + "(Select Image From tbl_Accessory Where ID = AccessoryID) as Image\n"
                    + "FROM tbl_Accessory_Invoice\n"
                    + "GROUP BY AccessoryID\n"
                    + "ORDER BY Sold DESC";
            
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            
            list = new ArrayList<>();
            while(rs.next()){
                id = rs.getString("AccessoryID");
                name = rs.getString("Name");
                price = rs.getFloat("Price");
                quantity = rs.getInt("Quantity");
                
                dto = new AccessoryDTO(id, name, quantity, price);
                dto.setImage(rs.getString("Image"));
                
                list.add(dto);
            }
        } finally {
            closeConnection();
        }

        return list;
    }
}

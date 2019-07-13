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

        String id, name,image,descrip,madeIn,useFor;
        int quantity,type;
        float price;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "SELECT TOP 10 A.ID,A.Name,A.Price,A.Quantity,A.Description,A.Image,A.MadeIn,A.Type,A.UseFor, SUM(I.Quantity) as Sold\n"
                    + "From tbl_Accessory_Invoice I,tbl_Accessory A\n"
                    + "Where I.AccessoryID = A.ID AND A.Status = 0\n"
                    + "GROUP BY A.ID,A.Name,A.Price,A.Quantity,A.Description,A.Image,A.MadeIn,A.Type,A.UseFor\n"
                    + "ORDER BY Sold DESC";
            
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();

            list = new ArrayList<>();
            while (rs.next()) {
                id = rs.getString("ID");
                name = rs.getString("Name");
                price = rs.getFloat("Price");
                quantity = rs.getInt("Quantity");
                image = rs.getString("Image");
                descrip = rs.getString("Description");
                madeIn = rs.getString("MadeIn");
                useFor = rs.getString("UseFor");
                type = rs.getInt("Type");

                dto = new AccessoryDTO(id, name, useFor, madeIn, descrip, price, quantity, type, 0);
                dto.setImage(image);

                list.add(dto);
            }
        } finally {
            closeConnection();
        }

        return list;
    }
}

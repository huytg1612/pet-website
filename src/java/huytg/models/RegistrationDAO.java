/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.models;

import huytg.conn.MyConnection;
import huytg.dtos.RegistrationDTO;
import huytg.utils.GetDate;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author SE130226
 */
public class RegistrationDAO implements Serializable {

    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;

    private void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String checkLogin(String username, String password) throws Exception {
        String role = "failed";
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select Role From tbl_Registration Where Username = ? AND Password = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, password);
            rs = preStm.executeQuery();

            if (rs.next()) {
                role = rs.getString("Role");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }

        return role;
    }

    public boolean insert(RegistrationDTO dto) throws Exception {
        boolean check = false;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert into tbl_Registration(Username,Password,Role,DateStart,Status) "
                    + "values(?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);

            System.out.println(dto.toString());

            preStm.setString(1, dto.getUsername());
            preStm.setString(2, dto.getPassword());
            preStm.setString(3, dto.getRole());
            preStm.setDate(4, GetDate.getCurrentDate());
            preStm.setInt(5, dto.getStatus());

            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }

        return check;
    }

    public RegistrationDTO searchByPK(String username) throws Exception {
        RegistrationDTO dto = null;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select Password,Role From tbl_Registration Where Username = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            rs = preStm.executeQuery();

            if (rs.next()) {
                String password = rs.getString("Password");
                String role = rs.getString("Role");

                dto = new RegistrationDTO(username, password, role);
            }

        } finally {
            closeConnection();
        }

        return dto;
    }
}
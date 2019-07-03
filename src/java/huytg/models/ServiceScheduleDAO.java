/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.models;

import huytg.conn.MyConnection;
import huytg.dtos.ServiceScheduleDTO;
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
public class ServiceScheduleDAO implements Serializable {

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

    public List<ServiceScheduleDTO> findByUsername(String username) throws Exception {
        List<ServiceScheduleDTO> list = null;

        ServiceScheduleDTO dto = null;

        int id, serviceID, petID, status;
        float total;
        String date, time;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select ID,Date,Time,ServiceID,PetID,Total,Status,"
                    + "(Select Name from tbl_Pet Where ID = PetID) as PetName, "
                    + "(Select Name from tbl_Service Where ID = ServiceID) as ServiceName "
                    + "From tbl_ServiceSchedule "
                    + "Where Username = ?";
            preStm = conn.prepareStatement(sql);

            preStm.setString(1, username);
            rs = preStm.executeQuery();

            list = new ArrayList<>();
            while (rs.next()) {
                id = rs.getInt("ID");
                date = rs.getDate("Date").toString();
                time = rs.getString("Time");
                serviceID = rs.getInt("ServiceID");
                petID = rs.getInt("PetID");
                total = rs.getFloat("Total");
                status = rs.getInt("Status");

                dto = new ServiceScheduleDTO(id, date, time, serviceID, username, petID, total, status);
                dto.setPetName(rs.getString("PetName"));
                dto.setServiceName(rs.getString("ServiceName"));

                list.add(dto);
            }
        } finally {
            closeConnection();
        }

        return list;
    }

    public boolean insert(ServiceScheduleDTO dto) throws Exception {
        boolean check = false;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert into tbl_ServiceSchedule(Date,Time,ServiceID,Username,PetID,Total,Status) values(?,?,?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);

            preStm.setString(1, dto.getDate());
            preStm.setString(2, dto.getTime());
            preStm.setInt(3, dto.getServiceID());
            preStm.setString(4, dto.getUsername());
            preStm.setInt(5, dto.getPetID());
            preStm.setFloat(6, dto.getTotal());
            preStm.setInt(7, dto.getStatus());

            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }

        return check;
    }

    public boolean checkContain(ServiceScheduleDTO dto) throws Exception {
        boolean check = false;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select ServiceID From tbl_ServiceSchedule Where "
                    + "Date = ? AND Time = ? AND Username = ? AND PetID = ?";
            preStm = conn.prepareStatement(sql);

            preStm.setString(1, dto.getDate());
            preStm.setString(2, dto.getTime());
            preStm.setString(3, dto.getUsername());
            preStm.setInt(4, dto.getPetID());

            rs = preStm.executeQuery();

            if (rs.next()) {
                check = true;
            }
        } finally {
            closeConnection();
        }

        return check;

    }

    public List<ServiceScheduleDTO> findByDate(String dateSearch) throws Exception {
        List<ServiceScheduleDTO> list = null;

        ServiceScheduleDTO dto = null;

        int id, serviceID, petID, status;
        float total;
        String date, time,username;

        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select ID,Date,Time,ServiceID,PetID,Total,Status,Username, "
                    + "(Select Name from tbl_Pet Where ID = PetID) as PetName, "
                    + "(Select Name from tbl_Service Where ID = ServiceID) as ServiceName "
                    + "From tbl_ServiceSchedule "
                    + "Where Date = ?";
            preStm = conn.prepareStatement(sql);

            preStm.setString(1, dateSearch);
            rs = preStm.executeQuery();

            list = new ArrayList<>();
            while (rs.next()) {
                id = rs.getInt("ID");
                date = rs.getDate("Date").toString();
                time = rs.getString("Time");
                serviceID = rs.getInt("ServiceID");
                petID = rs.getInt("PetID");
                total = rs.getFloat("Total");
                status = rs.getInt("Status");
                username = rs.getString("Username");

                dto = new ServiceScheduleDTO(id, date, time, serviceID, username, petID, total, status);
                dto.setPetName(rs.getString("PetName"));
                dto.setServiceName(rs.getString("ServiceName"));

                list.add(dto);
            }
        } finally {
            closeConnection();
        }

        return list;
    }
    
    public boolean update(int id) throws Exception{
        boolean check =false;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update tbl_ServiceSchedule Set Status = 1 Where ID = ?";
            preStm = conn.prepareStatement(sql);
            
            preStm.setInt(1, id);
            
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        
        return check;
    }
}

package lk.ijse.edu.complaintmanagementsystem.model.dao;

import lk.ijse.edu.complaintmanagementsystem.model.Complaint;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * --------------------------------------------
 * @Author Dimantha Kaveen
 * @GitHub: https://github.com/KaveenDK
 * --------------------------------------------
 * @Created 6/15/2025
 * @Project Complaint Management System - CMS
 * --------------------------------------------
 **/

public class ComplaintDAO {

    public void addComplaint(Complaint complaint) throws SQLException {
        String sql = "INSERT INTO complaints (user_id, title, description) VALUES (?, ?, ?)";
        try (Connection conn = DBCPDataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, complaint.getUserId());
            stmt.setString(2, complaint.getTitle());
            stmt.setString(3, complaint.getDescription());
            stmt.executeUpdate();
        }
    }

    public List<Complaint> getComplaintsByUser(int userId) throws SQLException {
        List<Complaint> complaints = new ArrayList<>();
        String sql = "SELECT * FROM complaints WHERE user_id=? ORDER BY created_at DESC";
        try (Connection conn = DBCPDataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    complaints.add(extractComplaint(rs));
                }
            }
        }
        return complaints;
    }

    public List<Complaint> getAllComplaints() throws SQLException {
        List<Complaint> complaints = new ArrayList<>();
        String sql = "SELECT * FROM complaints ORDER BY created_at DESC";
        try (Connection conn = DBCPDataSource.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                complaints.add(extractComplaint(rs));
            }
        }
        return complaints;
    }

    public void updateComplaint(int id, String status, String remarks) throws SQLException {
        String sql = "UPDATE complaints SET status=?, remarks=?, updated_at=CURRENT_TIMESTAMP WHERE id=?";
        try (Connection conn = DBCPDataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setString(2, remarks);
            stmt.setInt(3, id);
            stmt.executeUpdate();
        }
    }

    public void deleteComplaint(int id) throws SQLException {
        String sql = "DELETE FROM complaints WHERE id=?";
        try (Connection conn = DBCPDataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    private Complaint extractComplaint(ResultSet rs) throws SQLException {
        Complaint c = new Complaint();
        c.setId(rs.getInt("id"));
        c.setUserId(rs.getInt("user_id"));
        c.setTitle(rs.getString("title"));
        c.setDescription(rs.getString("description"));
        c.setStatus(rs.getString("status"));
        c.setRemarks(rs.getString("remarks"));
        c.setCreatedAt(rs.getTimestamp("created_at"));
        c.setUpdatedAt(rs.getTimestamp("updated_at"));
        return c;
    }
}

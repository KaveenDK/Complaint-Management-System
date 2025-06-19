package lk.ijse.edu.complaintmanagementsystem.model.dao;

import lk.ijse.edu.complaintmanagementsystem.model.User;
import java.sql.*;

/**
 * --------------------------------------------
 * @Author Dimantha Kaveen
 * @GitHub: https://github.com/KaveenDK
 * --------------------------------------------
 * @Created 6/15/2025
 * @Project Complaint Management System - CMS
 * --------------------------------------------
 **/

public class UserDAO {

    public User validate(String username, String password) throws SQLException {
        String sql = "SELECT * FROM users WHERE username=? AND password=?";
        try (Connection conn = DBCPDataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return extractUser(rs);
                }
            }
        }
        return null;
    }

    public boolean existsByUsername(String username) throws SQLException {
        String sql = "SELECT id FROM users WHERE username=?";
        try (Connection conn = DBCPDataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }

    public void addUser(User user) throws SQLException {
        String sql = "INSERT INTO users (username, password, full_name, role) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBCPDataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getFullName());
            stmt.setString(4, user.getRole());
            stmt.executeUpdate();
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    user.setId(rs.getInt(1));
                }
            }
        }
    }

    public User getById(int id) throws SQLException {
        String sql = "SELECT * FROM users WHERE id=?";
        try (Connection conn = DBCPDataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return extractUser(rs);
                }
            }
        }
        return null;
    }

    private User extractUser(ResultSet rs) throws SQLException {
        return new User(
                rs.getInt("id"),
                rs.getString("username"),
                rs.getString("password"),
                rs.getString("full_name"),
                rs.getString("role")
        );
    }
}
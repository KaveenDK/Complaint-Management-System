package lk.ijse.edu.complaintmanagementsystem.util;

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

public class DBUtil {

    public static void close(Connection conn) {
        try {
            if (conn != null && !conn.isClosed()) conn.close();
        } catch (SQLException ignored) {}
    }

    public static void close(Statement stmt) {
        try {
            if (stmt != null && !stmt.isClosed()) stmt.close();
        } catch (SQLException ignored) {}
    }

    public static void close(ResultSet rs) {
        try {
            if (rs != null && !rs.isClosed()) rs.close();
        } catch (SQLException ignored) {}
    }

    public static void close(ResultSet rs, Statement stmt, Connection conn) {
        close(rs);
        close(stmt);
        close(conn);
    }

    public static void beginTransaction(Connection conn) throws SQLException {
        if (conn != null) conn.setAutoCommit(false);
    }

    public static void commit(Connection conn) throws SQLException {
        if (conn != null) conn.commit();
    }

    public static void rollback(Connection conn) {
        try {
            if (conn != null) conn.rollback();
        } catch (SQLException ignored) {}
    }
}
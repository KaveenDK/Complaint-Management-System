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

public class CrudUtil {

    public static ResultSet executeQuery(Connection conn, String sql, Object... params) throws SQLException {
        PreparedStatement stmt = conn.prepareStatement(sql);
        setParams(stmt, params);
        return stmt.executeQuery();
    }

    public static int executeUpdate(Connection conn, String sql, Object... params) throws SQLException {
        PreparedStatement stmt = conn.prepareStatement(sql);
        setParams(stmt, params);
        return stmt.executeUpdate();
    }

    private static void setParams(PreparedStatement stmt, Object... params) throws SQLException {
        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                stmt.setObject(i + 1, params[i]);
            }
        }
    }
}
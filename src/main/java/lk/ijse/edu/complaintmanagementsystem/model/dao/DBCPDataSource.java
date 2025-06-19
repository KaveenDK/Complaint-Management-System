package lk.ijse.edu.complaintmanagementsystem.model.dao;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * --------------------------------------------
 * @Author Dimantha Kaveen
 * @GitHub: https://github.com/KaveenDK
 * --------------------------------------------
 * @Created 6/15/2025
 * @Project Complaint Management System - CMS
 * --------------------------------------------
 **/

public class DBCPDataSource {

    private static final BasicDataSource ds = new BasicDataSource();

    static {
        ds.setUrl("jdbc:mysql://localhost:3306/cms?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC");
        ds.setUsername("root");
        ds.setPassword("Ijse@1234");
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setInitialSize(5);
        ds.setMinIdle(5);
        ds.setMaxIdle(10);
        ds.setMaxTotal(20);
        ds.setMaxWaitMillis(10000);
        ds.setValidationQuery("SELECT 1");
        ds.setTestOnBorrow(true);
        ds.setTestWhileIdle(true);
        ds.setRemoveAbandonedOnBorrow(true);
        ds.setRemoveAbandonedTimeout(60);
        ds.setLogAbandoned(true);
    }

    private DBCPDataSource() {}

    public static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Officer;
import com.exavalu.models.UnderWriter;
import com.exavalu.models.User;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import org.apache.log4j.Logger;

/**
 *
 * @author Biswajit
 */
public class LoginService{

    static Logger logger = Logger.getLogger(LoginService.class.getName());

    public static String doLogin(String email, String password) {
        
        String success = "FAILURE";

        String sql = "Select * from user where email=? and password=?";

        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            System.out.println("LoginService :: " + ps);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                switch (rs.getInt("roleId")) {
                    case 1:
                        Officer.getInstance().setName(rs.getString("name"));
                        success = "OFFICER";
                        System.out.println("OFFICER LOGIN");
                        break;
                    case 2:
                        UnderWriter.getInstance().setName(rs.getString("name"));            
                        success = "UNDERWRITER";
                        break;
                    case 3:
                        User.getInstance().setName(rs.getString("name"));
                        User.getInstance().setUserId(rs.getInt("userId"));
                        User.getInstance().setPolicyId(rs.getInt("policyId"));
                        success = "USER";
                        break;
                }
            }
        } catch (SQLException ex) {
            logger.error(ex.getMessage() + LocalDateTime.now());
        }
        return success;
    }
}

//    public static boolean doOfficerLogin(Officer officer) {
//        boolean success = false;
//
//        String sql = "Select * from officer where email=? and password=?";
//
//        try {
//            Connection con = JDBCConnectionManager.getConnection();
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1, officer.getEmail());
//            ps.setString(2, officer.getPassword());
//
//            System.out.println("LoginService :: " + ps);
//
//            ResultSet rs = ps.executeQuery();
//
//            if (rs.next()) {
//                officer.setName(rs.getString("name"));
//                success = true;
//            }
//        } catch (SQLException ex) {
//            logger.error(ex.getMessage() + LocalDateTime.now());
//        }
//        return success;
//    }
//
//    public static boolean doUnderWriterLogin(UnderWriter underWriter) {
//        boolean success = false;
//
//        String sql = "Select * from underwriter where email=? and password=?";
//
//        try {
//            Connection con = JDBCConnectionManager.getConnection();
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1, underWriter.getEmail());
//            ps.setString(2, underWriter.getPassword());
//
//            System.out.println("LoginService :: " + ps);
//
//            ResultSet rs = ps.executeQuery();
//
//            if (rs.next()) {
//                underWriter.setName(rs.getString("name"));
//                success = true;
//            }
//        } catch (SQLException ex) {
//            logger.error(ex.getMessage() + LocalDateTime.now());
//        }
//        return success;
//    }

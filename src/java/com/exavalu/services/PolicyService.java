/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Policies;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import org.apache.log4j.Logger;

/**
 *
 * @author Biswajit
 */
public class PolicyService {
    static Logger logger = Logger.getLogger(PolicyService.class.getName());

    public static ArrayList getAllPolicies() {
        ArrayList policyList = new ArrayList();

        String sql = "Select * from policies";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Policies policy = new Policies();
                policy.setPolicyId(rs.getInt("policyId"));
                policy.setTitle(rs.getString("title"));
                policy.setDescription(rs.getString("description"));
                
                policyList.add(policy);
            }
        } catch (SQLException ex) {
            logger.error(ex.getMessage() + LocalDateTime.now());
        }
        return policyList;
    }
}

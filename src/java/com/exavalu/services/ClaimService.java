/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Claim;
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
public class ClaimService {
    static Logger logger = Logger.getLogger(ClaimService.class.getName());
    public static ArrayList getAllClaims() {
        ArrayList claimList = new ArrayList();

        String sql = "SELECT * FROM claim where status=1 and isrejected=0 and isapproved=0 and issanctioned=0";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Claim claim = new Claim();
                claim.setClaimId(rs.getInt("claimId"));
                claim.setInsuranceId(rs.getInt("insuranceId"));
                claim.setUserName(rs.getString("ownerName"));
                claim.setDate(rs.getString("date"));
                claim.setDriverId(rs.getInt("driverId"));
                claim.setDriverName(rs.getString("driverName"));
                claim.setDriverLicense(rs.getString("driverLicense"));
                claim.setPolicyId(rs.getString("policyId"));
                
                claimList.add(claim);
            }
        } catch (SQLException ex) {
            logger.error(ex.getMessage() + LocalDateTime.now());
        }
        return claimList;
    }
    public static ArrayList getApprovedClaims() {
        ArrayList claimList = new ArrayList();

        String sql = "SELECT * FROM claim where status=1 and isrejected=0 and isapproved=1";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Claim claim = new Claim();
                claim.setClaimId(rs.getInt("claimId"));
                claim.setInsuranceId(rs.getInt("insuranceId"));
                claim.setUserName(rs.getString("ownerName"));
                claim.setDate(rs.getString("date"));
                claim.setDriverId(rs.getInt("driverId"));
                claim.setDriverLicense(rs.getString("driverLicense"));
                claim.setDriverName(rs.getString("driverName"));
                claim.setPolicyId(rs.getString("policyId"));
                
                claimList.add(claim);
            }
        } catch (SQLException ex) {
            logger.error(ex.getMessage() + LocalDateTime.now());
        }
        return claimList;
    }
    public static boolean addNewClaim(Claim claim) {
        boolean success = false;

        String sql = "INSERT INTO claim(insuranceId,date,driverId,driverName,driverLicense,policyId,ownerName)VALUES(?,?,?,?,?,?,?);";

        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, claim.getInsuranceId());
            ps.setString(2, claim.getDate());
            ps.setInt(3, claim.getDriverId());
            ps.setString(4, claim.getDriverName());
            ps.setString(5, claim.getDriverLicense());
            ps.setString(6, claim.getPolicyId());
            ps.setString(7, claim.getUserName());
            System.out.println("New Claim Add :: " + ps);

            int row = ps.executeUpdate();
            if(row != 0){
                success = true;
            }
        } catch (SQLException ex) {
            logger.error(ex.getMessage() + LocalDateTime.now());
        }
        return success;
    }

    public static Claim getClaimById(int claimId) {
        Claim claim = new Claim();
      String sql = "SELECT * FROM claim where claimId=?";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, claimId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                claim.setClaimId(rs.getInt("claimId"));
                claim.setInsuranceId(rs.getInt("insuranceId"));
                claim.setUserName(rs.getString("ownerName"));
                claim.setDate(rs.getString("date"));
                claim.setDriverId(rs.getInt("driverId"));
                claim.setDriverName(rs.getString("driverName"));
                claim.setDriverLicense(rs.getString("driverLicense"));
                claim.setPolicyId(rs.getString("policyId"));
            }
        } catch (SQLException ex) {
            logger.error(ex.getMessage() + LocalDateTime.now());
        }
        return claim;  
    }
    public static boolean doApprove(int claimId) {
        boolean res = false;
      String sql = "UPDATE claim SET isApproved=1 where claimId=?";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, claimId);
            int row = ps.executeUpdate();
            if (row != 0){
                res = true;
            }
        } catch (SQLException ex) {
            logger.error(ex.getMessage() + LocalDateTime.now());
        }
        return res;  
    }
    public static boolean doReject(int claimId) {
        boolean res = false;
      String sql = "UPDATE claim SET status=0,isrejected=1 where claimId=?";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, claimId);
            int row = ps.executeUpdate();
            if (row != 0){
                res = true;
            }
        } catch (SQLException ex) {
            logger.error(ex.getMessage() + LocalDateTime.now());
        }
        return res;  
    }
    public static boolean doSanction(int claimId) {
        boolean res = false;
        String sql = "UPDATE claim SET issanctioned=1,status=0 where claimId=?";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, claimId);
            int row = ps.executeUpdate();
            if (row != 0){
                res = true;
            }
        } catch (SQLException ex) {
            logger.error(ex.getMessage() + LocalDateTime.now());
        }
        return res;  
    }
    public static boolean doTrack(int insuranceId) {
        boolean res = false;
        String sql = "SELECT issanctioned from claim where issanctioned=1 and status=0 and insuranceId=?";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, insuranceId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                res = true;
            }
        } catch (SQLException ex) {
            logger.error(ex.getMessage() + LocalDateTime.now());
        }
        return res;  
    }
    public static boolean isPending(int insuranceId) {
        boolean res = false;
        String sql = "SELECT * from claim where isrejected=0 and status=1 and insuranceId=?";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, insuranceId);
            ResultSet rs = ps.executeQuery();
            System.out.println(ps);
            if (rs.next()){
                res = true;
            }
        } catch (SQLException ex) {
            logger.error(ex.getMessage() + LocalDateTime.now());
        }
        return res;  
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.ClaimService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Map;
import org.apache.log4j.Logger;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Biswajit
 */
public class Claim extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

    /**
     * @return the isapproved
     */
    public boolean isIsapproved() {
        return isapproved;
    }

    /**
     * @param isapproved the isapproved to set
     */
    public void setIsapproved(boolean isapproved) {
        this.isapproved = isapproved;
    }

    /**
     * @return the isrejected
     */
    public boolean isIsrejected() {
        return isrejected;
    }

    /**
     * @param isrejected the isrejected to set
     */
    public void setIsrejected(boolean isrejected) {
        this.isrejected = isrejected;
    }

    /**
     * @return the issanctioned
     */
    public boolean isIssanctioned() {
        return issanctioned;
    }

    /**
     * @param issanctioned the issanctioned to set
     */
    public void setIssanctioned(boolean issanctioned) {
        this.issanctioned = issanctioned;
    }

    static Logger logger = Logger.getLogger(Claim.class.getName());
    private int claimId, insuranceId, driverId;
    private String userName, date, driverName, driverLicense, policyId;
    private boolean isapproved, isrejected, issanctioned;

    /**
     * @return the claimId
     */
    public int getClaimId() {
        return claimId;
    }

    /**
     * @param claimId the claimId to set
     */
    public void setClaimId(int claimId) {
        this.claimId = claimId;
    }

    /**
     * @return the driverName
     */
    public String getDriverName() {
        return driverName;
    }

    /**
     * @param driverName the driverName to set
     */
    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    /**
     * @return the driverLicense
     */
    public String getDriverLicense() {
        return driverLicense;
    }

    /**
     * @param driverLicense the driverLicense to set
     */
    public void setDriverLicense(String driverLicense) {
        this.driverLicense = driverLicense;
    }

    /**
     * @return the insuranceId
     */
    public int getInsuranceId() {
        return insuranceId;
    }

    /**
     * @param insuranceId the insuranceId to set
     */
    public void setInsuranceId(int insuranceId) {
        this.insuranceId = insuranceId;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the driverId
     */
    public int getDriverId() {
        return driverId;
    }

    /**
     * @param driverId the driverDetails to set
     */
    public void setDriverId(int driverId) {
        this.driverId = driverId;
    }

    /**
     * @return the policyId
     */
    public String getPolicyId() {
        return policyId;
    }

    /**
     * @param policyId the policyId to set
     */
    public void setPolicyId(String policyId) {
        this.policyId = policyId;
    }
    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();

    @Override
    public void setApplication(Map<String, Object> application) {
        map = (ApplicationMap) application;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    public String getAllClaim() throws Exception {
        String result = "FAILURE";

        ArrayList claimList = ClaimService.getAllClaims();

        if (!claimList.isEmpty()) {
            System.out.println("ClaimList Size" + claimList.size());
            sessionMap.put("ClaimList", claimList);
            result = "SUCCESS";
        } else {
            String noClaim = "Something Error in fetching ClaimList";
            sessionMap.put("NoClaim", noClaim);
            System.out.println("Something Error in fetching ClaimList");
            logger.error("Something Error in fetching ClaimList" + LocalDateTime.now());
        }
        return result;
    }

    public String viewClaim() {
        String result = "FAILURE";

        Claim claim = ClaimService.getClaimById(this.claimId);

        if (claim != null) {
            sessionMap.put("Claim", claim);
            result = "SUCCESS";
        } else {
            String loginErrorMsg = "Either Email or Password is Wrong!";
            sessionMap.put("LoginErrorMsg", loginErrorMsg);
            System.out.println("returning Failure from doLogin method");
            logger.error("No Claim Found" + LocalDateTime.now());
        }
        return result;
    }

    public String approve() throws Exception {
        String result = "FAILURE";

        boolean success = ClaimService.doApprove(this.claimId);
        ArrayList claimList = ClaimService.getAllClaims();

        if (success) {
            System.out.println("ClaimList Size" + claimList.size());
            sessionMap.put("ClaimList", claimList);
            result = "SUCCESS";
        } else {
            logger.error("Something Error" + LocalDateTime.now());
        }
        return result;
    }

    public String reject() throws Exception {
        String result = "FAILURE";

        boolean success = ClaimService.doReject(this.claimId);
        ArrayList claimList = ClaimService.getAllClaims();

        if (success) {
            System.out.println("ClaimList Size" + claimList.size());
            sessionMap.put("ClaimList", claimList);
            result = "SUCCESS";
        } else {
            logger.error("Something Error" + LocalDateTime.now());
        }
        return result;
    }

    public String sanction() throws Exception {
        String result = "FAILURE";

        boolean success = ClaimService.doSanction(this.claimId);
        ArrayList claimList = ClaimService.getApprovedClaims();

        if (success) {
            System.out.println("ClaimList Size" + claimList.size());
            sessionMap.put("ApprovedClaimList", claimList);
            result = "SUCCESS";
        } else {
            logger.error("Something Error" + LocalDateTime.now());
        }
        return result;
    }

    public String applyClaim() throws Exception {
        String result = "FAILURE";

        boolean success = ClaimService.addNewClaim(this);

        if (success) {
            System.out.println("Added");
            ArrayList claimList = ClaimService.getAllClaimsByUserId(User.getInstance().getUserId());
            sessionMap.put("UserClaimList", claimList);
            result = "SUCCESS";
        } else {
            System.out.println("Claim is not Filed");
            logger.error("Something Error" + LocalDateTime.now());
        }
        return result;
    }

    public String track() throws Exception {
        String result = "FAILURE";

        boolean pending = ClaimService.isPending(this.getInsuranceId());
        if (pending) {
            sessionMap.put("Pending", "Your Claim is Under Process");
            result = "SUCCESS";
        } else {
            boolean success = ClaimService.doTrack(this.getInsuranceId());
            if (success) {
                System.out.println("Added");
                sessionMap.put("Approved", "Congratulations! Your Claim Is Approved!");
                result = "SUCCESS";
            } else {
                sessionMap.put("Rejected", "Sorry! Your Claim Is Rejected!");
                System.out.println("Claim is not Filed");
                logger.error("Something Error" + LocalDateTime.now());
            }
        }
        return result;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }
}

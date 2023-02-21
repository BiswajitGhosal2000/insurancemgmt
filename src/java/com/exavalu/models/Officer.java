/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import static com.exavalu.models.Claim.logger;
import com.exavalu.services.ClaimService;
import com.exavalu.services.LoginService;
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

public class Officer extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

    static Logger logger = Logger.getLogger(Officer.class.getName());
    
    private static Officer officer = null;

    public static Officer getInstance() {
        if (officer == null) {
            officer = new Officer();
        }

        return officer;
    }

    private int officerId;
    private String name, email, password;

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

    /**
     * @return the officerId
     */
    public int getOfficerId() {
        return officerId;
    }

    /**
     * @param officerId the officerId to set
     */
    public void setOfficerId(int officerId) {
        this.officerId = officerId;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
    public String ViewApprovedClaim() throws Exception {
        String result = "FAILURE";

        ArrayList claimList = ClaimService.getApprovedClaims();

        if (!claimList.isEmpty()) {
            System.out.println("ClaimList Size"+claimList.size());
            sessionMap.put("ApprovedClaimList", claimList);
            result = "SUCCESS";
        } else {
            String noClaim = "Something Error in fetching ClaimList";
            sessionMap.put("NoClaim", noClaim);
            System.out.println("Something Error in fetching ClaimList");
            logger.error("Something Error in fetching ClaimList" + LocalDateTime.now());
        }
        return result;
    }
}

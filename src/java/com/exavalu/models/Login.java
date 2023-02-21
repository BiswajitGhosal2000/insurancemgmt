/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

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

/**
 *
 * @author Biswajit
 */
public class Login extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

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

    static Logger logger = Logger.getLogger(Login.class.getName());

    private String email, password;

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

    public String doLogOut() {
        sessionMap.clear();
        return "SUCCESS";
    }

    public String doLogin() throws Exception {
        
        String result = "FAILURE";

        String success = LoginService.doLogin(this.getEmail(), this.getPassword());
        
        if (success.equalsIgnoreCase("OFFICER")) {
                ArrayList approvedclaimList = ClaimService.getApprovedClaims();
                System.out.println("returning Success from doLogin method");
                sessionMap.put("Officer", Officer.getInstance());
                sessionMap.put("ApprovedClaimList", approvedclaimList);
                System.out.println("ClaimList Size" + approvedclaimList.size());
                result = "OFFICER";
        }else if (success.equalsIgnoreCase("UNDERWRITER"))
        {
                ArrayList claimList = ClaimService.getAllClaims();
                System.out.println("returning Success from doLogin method");
                sessionMap.put("UnderWriter", UnderWriter.getInstance());
                sessionMap.put("ClaimList", claimList);
                System.out.println("ClaimList Size" + claimList.size());
                result = "UNDERWRITER";
        }else if (success.equalsIgnoreCase("USER")){
                System.out.println("returning Success from doLogin method");
                sessionMap.put("User", User.getInstance());
                result = "USER";
        }else{
            logger.error(LocalDateTime.now());
        }
        return result;
    }

}

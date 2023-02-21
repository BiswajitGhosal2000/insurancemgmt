/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.Map;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;

/**
 *
 * @author Biswajit
 */
public class UnderWriter extends ActionSupport implements ApplicationAware, SessionAware, Serializable {
    static Logger logger = Logger.getLogger(UnderWriter.class.getName());
    
    private static UnderWriter underWriter = null;

    public static UnderWriter getInstance() {
        if (underWriter == null) {
            underWriter = new UnderWriter();
        }

        return underWriter;
    }
    
    private int underwriterId;
    private String name,email,password;

    /**
     * @return the underwriterId
     */
    public int getUnderwriterId() {
        return underwriterId;
    }

    /**
     * @param underwriterId the underwriterId to set
     */
    public void setUnderwriterId(int underwriterId) {
        this.underwriterId = underwriterId;
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
}

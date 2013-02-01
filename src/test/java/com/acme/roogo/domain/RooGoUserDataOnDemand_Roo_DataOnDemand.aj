// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.acme.roogo.domain;

import com.acme.roogo.domain.RooGoUser;
import com.acme.roogo.domain.RooGoUserDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect RooGoUserDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RooGoUserDataOnDemand: @Component;
    
    private Random RooGoUserDataOnDemand.rnd = new SecureRandom();
    
    private List<RooGoUser> RooGoUserDataOnDemand.data;
    
    public RooGoUser RooGoUserDataOnDemand.getNewTransientRooGoUser(int index) {
        RooGoUser obj = new RooGoUser();
        setUserName(obj, index);
        return obj;
    }
    
    public void RooGoUserDataOnDemand.setUserName(RooGoUser obj, int index) {
        String userName = "userName_" + index;
        obj.setUserName(userName);
    }
    
    public RooGoUser RooGoUserDataOnDemand.getSpecificRooGoUser(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        RooGoUser obj = data.get(index);
        Long id = obj.getId();
        return RooGoUser.findRooGoUser(id);
    }
    
    public RooGoUser RooGoUserDataOnDemand.getRandomRooGoUser() {
        init();
        RooGoUser obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return RooGoUser.findRooGoUser(id);
    }
    
    public boolean RooGoUserDataOnDemand.modifyRooGoUser(RooGoUser obj) {
        return false;
    }
    
    public void RooGoUserDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = RooGoUser.findRooGoUserEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'RooGoUser' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<RooGoUser>();
        for (int i = 0; i < 10; i++) {
            RooGoUser obj = getNewTransientRooGoUser(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}

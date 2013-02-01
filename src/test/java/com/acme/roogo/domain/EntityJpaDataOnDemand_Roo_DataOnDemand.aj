// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.acme.roogo.domain;

import com.acme.roogo.domain.EntityJpa;
import com.acme.roogo.domain.EntityJpaDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect EntityJpaDataOnDemand_Roo_DataOnDemand {
    
    declare @type: EntityJpaDataOnDemand: @Component;
    
    private Random EntityJpaDataOnDemand.rnd = new SecureRandom();
    
    private List<EntityJpa> EntityJpaDataOnDemand.data;
    
    public EntityJpa EntityJpaDataOnDemand.getNewTransientEntityJpa(int index) {
        EntityJpa obj = new EntityJpa();
        setEntityClass(obj, index);
        return obj;
    }
    
    public void EntityJpaDataOnDemand.setEntityClass(EntityJpa obj, int index) {
        String entityClass = "entityClass_" + index;
        obj.setEntityClass(entityClass);
    }
    
    public EntityJpa EntityJpaDataOnDemand.getSpecificEntityJpa(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        EntityJpa obj = data.get(index);
        Long id = obj.getId();
        return EntityJpa.findEntityJpa(id);
    }
    
    public EntityJpa EntityJpaDataOnDemand.getRandomEntityJpa() {
        init();
        EntityJpa obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return EntityJpa.findEntityJpa(id);
    }
    
    public boolean EntityJpaDataOnDemand.modifyEntityJpa(EntityJpa obj) {
        return false;
    }
    
    public void EntityJpaDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = EntityJpa.findEntityJpaEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'EntityJpa' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<EntityJpa>();
        for (int i = 0; i < 10; i++) {
            EntityJpa obj = getNewTransientEntityJpa(i);
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

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.acme.roogo.domain;

import com.acme.roogo.domain.EntityJpa;
import com.acme.roogo.domain.Field;
import com.acme.roogo.domain.RooFieldTypeEnum;
import com.acme.roogo.domain.Switch;
import java.util.Set;

privileged aspect Field_Roo_JavaBean {
    
    public RooFieldTypeEnum Field.getRooType() {
        return this.rooType;
    }
    
    public void Field.setRooType(RooFieldTypeEnum rooType) {
        this.rooType = rooType;
    }
    
    public Set<Switch> Field.getSwitches() {
        return this.switches;
    }
    
    public void Field.setSwitches(Set<Switch> switches) {
        this.switches = switches;
    }
    
    public EntityJpa Field.getEntity() {
        return this.entity;
    }
    
    public void Field.setEntity(EntityJpa entity) {
        this.entity = entity;
    }
    
    public String Field.getFieldName() {
        return this.fieldName;
    }
    
    public void Field.setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }
    
}

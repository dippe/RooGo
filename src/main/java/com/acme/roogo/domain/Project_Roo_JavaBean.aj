// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.acme.roogo.domain;

import com.acme.roogo.domain.Database;
import com.acme.roogo.domain.EntityJpa;
import com.acme.roogo.domain.Field;
import com.acme.roogo.domain.Packaging;
import com.acme.roogo.domain.Project;
import com.acme.roogo.domain.Provider;
import java.util.Set;

privileged aspect Project_Roo_JavaBean {
    
    public String Project.getProjectName() {
        return this.projectName;
    }
    
    public void Project.setProjectName(String projectName) {
        this.projectName = projectName;
    }
    
    public String Project.getTopLevelPackage() {
        return this.topLevelPackage;
    }
    
    public void Project.setTopLevelPackage(String topLevelPackage) {
        this.topLevelPackage = topLevelPackage;
    }
    
    public String Project.getJava() {
        return this.java;
    }
    
    public void Project.setJava(String java) {
        this.java = java;
    }
    
    public Packaging Project.getPackaging() {
        return this.packaging;
    }
    
    public void Project.setPackaging(Packaging packaging) {
        this.packaging = packaging;
    }
    
    public Provider Project.getProvider() {
        return this.provider;
    }
    
    public void Project.setProvider(Provider provider) {
        this.provider = provider;
    }
    
    public Database Project.getDatabase() {
        return this.database;
    }
    
    public void Project.setDatabase(Database database) {
        this.database = database;
    }
    
    public Set<EntityJpa> Project.getEntities() {
        return this.entities;
    }
    
    public void Project.setEntities(Set<EntityJpa> entities) {
        this.entities = entities;
    }
    
    public Set<Field> Project.getFields() {
        return this.fields;
    }
    
    public void Project.setFields(Set<Field> fields) {
        this.fields = fields;
    }
    
}

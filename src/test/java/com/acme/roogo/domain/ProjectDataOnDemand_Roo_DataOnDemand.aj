// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.acme.roogo.domain;

import com.acme.roogo.domain.JpaDatabaseEnum;
import com.acme.roogo.domain.JpaProviderEnum;
import com.acme.roogo.domain.PackagingEnum;
import com.acme.roogo.domain.Project;
import com.acme.roogo.domain.ProjectDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ProjectDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProjectDataOnDemand: @Component;
    
    private Random ProjectDataOnDemand.rnd = new SecureRandom();
    
    private List<Project> ProjectDataOnDemand.data;
    
    public Project ProjectDataOnDemand.getNewTransientProject(int index) {
        Project obj = new Project();
        setDatabase(obj, index);
        setJava(obj, index);
        setPackaging(obj, index);
        setProjectName(obj, index);
        setProvider(obj, index);
        setTopLevelPackage(obj, index);
        return obj;
    }
    
    public void ProjectDataOnDemand.setDatabase(Project obj, int index) {
        JpaDatabaseEnum database = JpaDatabaseEnum.class.getEnumConstants()[0];
        obj.setDatabase(database);
    }
    
    public void ProjectDataOnDemand.setJava(Project obj, int index) {
        String java = "java_" + index;
        obj.setJava(java);
    }
    
    public void ProjectDataOnDemand.setPackaging(Project obj, int index) {
        PackagingEnum packaging = PackagingEnum.class.getEnumConstants()[0];
        obj.setPackaging(packaging);
    }
    
    public void ProjectDataOnDemand.setProjectName(Project obj, int index) {
        String projectName = "projectName_" + index;
        obj.setProjectName(projectName);
    }
    
    public void ProjectDataOnDemand.setProvider(Project obj, int index) {
        JpaProviderEnum provider = JpaProviderEnum.class.getEnumConstants()[0];
        obj.setProvider(provider);
    }
    
    public void ProjectDataOnDemand.setTopLevelPackage(Project obj, int index) {
        String topLevelPackage = "topLevelPackage_" + index;
        obj.setTopLevelPackage(topLevelPackage);
    }
    
    public Project ProjectDataOnDemand.getSpecificProject(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Project obj = data.get(index);
        Long id = obj.getId();
        return Project.findProject(id);
    }
    
    public Project ProjectDataOnDemand.getRandomProject() {
        init();
        Project obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Project.findProject(id);
    }
    
    public boolean ProjectDataOnDemand.modifyProject(Project obj) {
        return false;
    }
    
    public void ProjectDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Project.findProjectEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Project' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Project>();
        for (int i = 0; i < 10; i++) {
            Project obj = getNewTransientProject(i);
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

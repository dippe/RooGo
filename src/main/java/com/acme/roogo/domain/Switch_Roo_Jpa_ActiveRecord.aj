// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.acme.roogo.domain;

import com.acme.roogo.domain.Switch;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Switch_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Switch.entityManager;
    
    public static final EntityManager Switch.entityManager() {
        EntityManager em = new Switch().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Switch.countSwitches() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Switch o", Long.class).getSingleResult();
    }
    
    public static List<Switch> Switch.findAllSwitches() {
        return entityManager().createQuery("SELECT o FROM Switch o", Switch.class).getResultList();
    }
    
    public static Switch Switch.findSwitch(Long id) {
        if (id == null) return null;
        return entityManager().find(Switch.class, id);
    }
    
    public static List<Switch> Switch.findSwitchEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Switch o", Switch.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Switch.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Switch.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Switch attached = Switch.findSwitch(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Switch.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Switch.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Switch Switch.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Switch merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}

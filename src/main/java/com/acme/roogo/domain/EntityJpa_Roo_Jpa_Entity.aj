// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.acme.roogo.domain;

import com.acme.roogo.domain.EntityJpa;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect EntityJpa_Roo_Jpa_Entity {
    
    declare @type: EntityJpa: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long EntityJpa.id;
    
    @Version
    @Column(name = "version")
    private Integer EntityJpa.version;
    
    public Long EntityJpa.getId() {
        return this.id;
    }
    
    public void EntityJpa.setId(Long id) {
        this.id = id;
    }
    
    public Integer EntityJpa.getVersion() {
        return this.version;
    }
    
    public void EntityJpa.setVersion(Integer version) {
        this.version = version;
    }
    
}

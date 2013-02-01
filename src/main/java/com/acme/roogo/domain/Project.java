package com.acme.roogo.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Project {

    @NotNull
    private String projectName;

    @NotNull
    private String topLevelPackage;

    @NotNull
    private String java;

    @NotNull
    @Enumerated
    private Packaging packaging;

    @NotNull
    @Enumerated
    private Provider provider;

    @NotNull
    @Enumerated
    private Database database;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<EntityJpa> entities = new HashSet<EntityJpa>();

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Field> fields = new HashSet<Field>();
}

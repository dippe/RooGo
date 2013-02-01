package com.acme.roogo.domain;

import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Switch {

    @NotNull
    private String switchName;

    @NotNull
    private String switchValue;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        if(switchName != null){
            sb.append("--");
            sb.append(switchName);
            sb.append(" ");
        }
        if(switchValue != null){
            sb.append(switchValue);
        }
        return sb.toString();
    }
    
}

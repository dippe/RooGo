package com.acme.roogo.domain;

public enum RooType {

    BOOLEAN_TYPE("boolean"), DATE_TYPE("date"), EMAIL_TYPE("email"), EMBEDDED_TYPE("embedded"), ENUM_TYPE("enum"), FILE_TYPE(
            "file"), NUMBER_TYPE("number"), OTHER_TYPE("other"), REFERENCE_TYPE("reference"), SET_TYPE("set"), STRING_TYPE("string");
    
    private String rooType;
    
    private RooType(String rooType){
        this.rooType = rooType;
    }
    
    public String getRooType(){
        return rooType;
    }
    
    @Override
    public String toString(){
        return rooType;
    }
}

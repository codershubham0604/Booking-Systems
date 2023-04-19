package com.admin;

/**
 *
 * @author 91963
 */
public class Emp {
    private int id;
    private String CurrencyName;
    private String CurrencyCode;

    public void setId(int aInt) {
        id = aInt;
    }

    public void setCurrencyName(String string) {
    	CurrencyName = string;
    }

    public void setCurrencyCode(String astring) {
    	CurrencyCode = astring;
    }

    public int getId(){
        return id;
    }

    public String getCurrencyName(){
        return CurrencyName;
    }

    public String getCurrencyCode(){
        return CurrencyCode;
    }
}
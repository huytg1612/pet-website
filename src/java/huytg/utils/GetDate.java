/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.utils;

import java.util.Calendar;

/**
 *
 * @author SE130226
 */
public class GetDate {

    public static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }
    
    public static java.sql.Timestamp getCurrentDateTime(){
        java.util.Date today = new java.util.Date();
        return new java.sql.Timestamp(today.getTime());
    }
    
    public static int getYear(){
        return Calendar.getInstance().get(Calendar.YEAR);
    }
    
    public static int getMonth(){
        return Calendar.getInstance().get(Calendar.MONTH);
    }
    
    public static int getDate(){
        return Calendar.getInstance().get(Calendar.DATE);
    }
}

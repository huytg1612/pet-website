/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.dtos;

import java.io.Serializable;

/**
 *
 * @author SE130226
 */
public class Accessory_InvoiceDTO implements Serializable {

    private int invoiceId;
    private String accessoryId;
    private int quantity;

    //----------For subquery---------//
    private String accessoryName;
    private float accessoryPrice;

    public Accessory_InvoiceDTO(int invoiceId, String accessoryId, int quantity) {
        this.invoiceId = invoiceId;
        this.accessoryId = accessoryId;
        this.quantity = quantity;
    }

    public Accessory_InvoiceDTO(int invoiceId, String accessoryId, int quantity, String accessoryName, float price) {
        this.invoiceId = invoiceId;
        this.accessoryId = accessoryId;
        this.quantity = quantity;
        this.accessoryName = accessoryName;
        this.accessoryPrice = price;
    }

    
    public String getAccessoryName() {
        return accessoryName;
    }

    public void setAccessoryName(String accessoryName) {
        this.accessoryName = accessoryName;
    }

    public float getAccessoryPrice() {
        return accessoryPrice;
    }

    public void setAccessoryPrice(float accessoryPrice) {
        this.accessoryPrice = accessoryPrice;
    }
    
    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public String getAccessoryId() {
        return accessoryId;
    }

    public void setAccessoryId(String accessoryId) {
        this.accessoryId = accessoryId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}

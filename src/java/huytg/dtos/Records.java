/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.dtos;

/**
 *
 * @author SE130226
 */
public class Records {
    private int customer,admin,schedule,pet,accessory,service;
    float revenueLastMonth,revenueAccessory,revenueService;

    public Records(int customer, int admin, int schedule, int pet, int accessory, int serivce, float revenueLastMonth, float revenueAccessory, float revenueService) {
        this.customer = customer;
        this.admin = admin;
        this.schedule = schedule;
        this.pet = pet;
        this.accessory = accessory;
        this.service = serivce;
        this.revenueLastMonth = revenueLastMonth;
        this.revenueAccessory = revenueAccessory;
        this.revenueService = revenueService;
    }

    public int getCustomer() {
        return customer;
    }

    public void setCustomer(int customer) {
        this.customer = customer;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public int getSchedule() {
        return schedule;
    }

    public void setSchedule(int schedule) {
        this.schedule = schedule;
    }

    public float getRevenueLastMonth() {
        return revenueLastMonth;
    }

    public void setRevenueLastMonth(float revenueLastMonth) {
        this.revenueLastMonth = revenueLastMonth;
    }

    public int getPet() {
        return pet;
    }

    public void setPet(int pet) {
        this.pet = pet;
    }

    public int getAccessory() {
        return accessory;
    }

    public void setAccessory(int accessory) {
        this.accessory = accessory;
    }

    public int getService() {
        return service;
    }

    public void setService(int serivce) {
        this.service = serivce;
    }

    public float getRevenueAccessory() {
        return revenueAccessory;
    }

    public void setRevenueAccessory(float revenueAccessory) {
        this.revenueAccessory = revenueAccessory;
    }

    public float getRevenueService() {
        return revenueService;
    }

    public void setRevenueService(float revenueService) {
        this.revenueService = revenueService;
    }

    @Override
    public String toString() {
        return "Records{" + "customer=" + customer + ", admin=" + admin + ", schedule=" + schedule + ", revenueLastMonth=" + revenueLastMonth + '}';
    }
    
    
}

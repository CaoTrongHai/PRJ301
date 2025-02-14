/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author FPTSHOP
 */
public class Order {
    private int orderID;
    private int CustomerId;
    private int shoppingCart;
    private Date orderDate;
    private double totalPrice;
    private String deliveryMethod;

    public Order() {
    }

    public Order(int orderID, int CustomerId, int shoppingCart, Date orderDate, double totalPrice, String deliveryMethod) {
        this.orderID = orderID;
        this.CustomerId = CustomerId;
        this.shoppingCart = shoppingCart;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.deliveryMethod = deliveryMethod;
    }
     public Order(int CustomerId, int shoppingCart, Date orderDate, double totalPrice, String deliveryMethod) {
        this.CustomerId = CustomerId;
        this.shoppingCart = shoppingCart;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.deliveryMethod = deliveryMethod;
    }
       public Order(int CustomerId, int shoppingCart, double totalPrice, String deliveryMethod) {
        this.CustomerId = CustomerId;
        this.shoppingCart = shoppingCart;
        this.totalPrice = totalPrice;
        this.deliveryMethod = deliveryMethod;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(int CustomerId) {
        this.CustomerId = CustomerId;
    }

    public int getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCart(int shoppingCart) {
        this.shoppingCart = shoppingCart;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getDeliveryMethod() {
        return deliveryMethod;
    }

    public void setDeliveryMethod(String deliveryMethod) {
        this.deliveryMethod = deliveryMethod;
    }
    
}

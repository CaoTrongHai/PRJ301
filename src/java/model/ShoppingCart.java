/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author FPTSHOP
 */
public class ShoppingCart {
    private int shoppingCartId;
    private int customerId;
    private String productId;
    private int quantity;

    public ShoppingCart() {
    }

    public ShoppingCart(int shoppingCartId, int customerId, String productId, int quantity) {
        this.shoppingCartId = shoppingCartId;
        this.customerId = customerId;
        this.productId = productId;
        this.quantity = quantity;
    }
     public ShoppingCart(int customerId, String productId, int quantity) {
        
        this.customerId = customerId;
        this.productId = productId;
        this.quantity = quantity;
    }

    public int getShoppingCartId() {
        return shoppingCartId;
    }

    public void setShoppingCartId(int shoppingCartId) {
        this.shoppingCartId = shoppingCartId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
     
     
    
}

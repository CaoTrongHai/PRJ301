/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.ShoppingCart;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author FPTSHOP
 */
public class ShoppingCartDAO extends DBContext {

    public void InsertShoppingCart(ShoppingCart sc) {
        String sql = "INSERT INTO ShoppingCart (CustomerID, ProductID, Quantity) VALUES(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sc.getCustomerId());
            st.setString(2, sc.getProductId());
            st.setInt(3, sc.getQuantity());
            st.executeUpdate();
        } catch (SQLException e) {
        }
        
    }
    // xóa sản phẩm khỏi giỏ hàng
    public void deleteShoppingCart(int ShoppingCartId){
        String sql ="delete ShoppingCart where ShoppingCartId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ShoppingCartId);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
     
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author FPTSHOP
 */
public class UpdateQuantityProductDAO extends DBContext{
    public void updateQuantity(String productName,int quantity){
        String sql = "UPDATE products SET quantity = quantity - ? WHERE name = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setString(2, productName);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
}

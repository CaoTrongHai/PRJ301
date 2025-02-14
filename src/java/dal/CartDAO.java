/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author FPTSHOP
 */
public class CartDAO extends DBContext {

    // in ra thong tin cua gio hàng
    public List<Cart> getCart(int customerId) {
        List<Cart> list = new ArrayList<>();
        String sql = "SELECT P.*, SC.* "
                + "FROM Products P "
                + "INNER JOIN ShoppingCart SC ON P.ID = SC.ProductID "
                + "WHERE SC.CustomerID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customerId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = new Cart(rs.getInt("CustomerID"),
                        rs.getInt("ShoppingCartID"),
                        rs.getString("name"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getInt("Quantity"));
                list.add(c);
            }
        } catch (SQLException e) {
            
        }
        return list;
    }
   // lay thong tin gio hang theo shoppingcartId
    public Cart getCartByShoppingCartId(int shoppingCartId) {
        String sql = "SELECT P.*, SC.* "
                + "FROM Products P "
                + "INNER JOIN ShoppingCart SC ON P.ID = SC.ProductID "
                + "WHERE SC.ShoppingCartId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, shoppingCartId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Cart c = new Cart(rs.getInt("CustomerID"),
                        rs.getInt("ShoppingCartID"),
                        rs.getString("name"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getInt("Quantity"));
                return c;
            }
        } catch (SQLException e) {
            
        }
        return null;
    }

}

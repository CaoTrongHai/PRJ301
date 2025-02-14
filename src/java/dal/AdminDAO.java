/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Customer;
import model.Order;
import model.Product;
import model.ShoppingCart;

/**
 *
 * @author FPTSHOP
 */
public class AdminDAO extends DBContext {

    // in ra bang Categories
    public List<Category> getAllCategories() {
        List<Category> listCategories = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("ID"), rs.getString("name"), rs.getString("describe"));
                listCategories.add(c);
            }

        } catch (SQLException e) {
        }
        return listCategories;

    }

    // in ra bang ket hop Product va Categories
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Category getCategoryById(int id) {
        String sql = "select * from Categories where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("describe"));
                return c;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Customer> getAllCustomer() {
        List<Customer> listCustomer = new ArrayList<>();
        String sql = "select * from Customer";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer c = new Customer(rs.getInt("CustomerID"), rs.getString("Name"), rs.getString("Phone"), rs.getString("Address"));
                listCustomer.add(c);

            }
        } catch (SQLException e) {
        }
        return listCustomer;
    }
    // in ra bang shoppingCart

    public List<ShoppingCart> getAllShoppingCart() {
        List<ShoppingCart> listShopping = new ArrayList<>();
        String sql = "select * from ShoppingCart";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ShoppingCart sc = new ShoppingCart(rs.getInt("ShoppingCartID"), rs.getInt("CustomerID"), rs.getString("ProductID"), rs.getInt("Quantity"));
                listShopping.add(sc);
            }
        } catch (SQLException e) {
        }
        return listShopping;
    }
    // xoa bang Products

    public void deleteProduct(String id) {
        String sql = "delete from products where ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    // add new Product
     public void addProduct(Product product) {
        String query = "INSERT INTO Product (id, name, quantity, price, releaseDate, describe, image, categoryId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(query)) {
            st.setString(1, product.getId());
            st.setString(2, product.getName());
            st.setInt(3, product.getQuantity());
            st.setDouble(4, product.getPrice());
            st.setString(5, product.getReleaseDate());
            st.setString(6, product.getDescribe());
            st.setString(7, product.getImage());
            st.setInt(8, product.getCategory().getId());
            st.executeUpdate();
        } catch (SQLException e) {
           
        }
    }
     // insert thêm 1 category
    public void addCategory(Category c){
        String sql = "insert into Categories (ID,name,describe) VALUES (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setString(2, c.getName());
            st.setString(3, c.getDescribe());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    // xoa 1 category
    public void deleteCategory(int Id){
        String sql = "delete from Categories where Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    //update category
    public void updateCategory(int Id,String name,String describe){
        String sql = "update Categories set name=? , describe=? where ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, describe);
            st.setInt(3, Id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

      public List<Order> getAllOrders() {
    List<Order> list = new ArrayList<>();
    String sql = "SELECT * FROM Orders";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {                
            Order order = new Order();
            order.setOrderID(rs.getInt("OrderID"));
            order.setCustomerId(rs.getInt("CustomerID"));
            order.setShoppingCart(rs.getInt("ShoppingCartID"));
            order.setOrderDate(rs.getDate("OrderDate"));
            order.setTotalPrice(rs.getDouble("TotalPrice"));
            order.setDeliveryMethod(rs.getString("DeliveryMethod"));
            list.add(order);
        }
    } catch (SQLException e) {
    }
    
    return list;
}
}

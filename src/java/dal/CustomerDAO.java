/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author FPTSHOP
 */
public class CustomerDAO extends DBContext {
    // in ra thông tin khách hàng thông qua customerId

    public Customer getCustomerById(int customerId) {
        String sql = "select * from Customer where CustomerID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customerId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer c = new Customer(rs.getInt("customerId"), rs.getString("name"), rs.getString("phone"), rs.getString("address"));
                return c;
            }

        } catch (SQLException e) {
        }
        return null;

    }
    // cap nhat thong tin khach hang (update profile)
    public void updateprofile(int customerId,String name,String phone,String address){
        String sql = "update Customer set name=? , phone=? , address =? where customerId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, phone);
            st.setString(3, address);
            st.setInt(4, customerId);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
}

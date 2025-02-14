/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author FPTSHOP
 */
public class UserDAO extends DBContext{
    // kiem tra user
    public User check(String username,String password){
        String sql="select * from [User] where Username=? and Password =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                User u = new User(rs.getInt("userID"), rs.getString("username"), rs.getString("password"), rs.getString("role"), rs.getInt("customerID"));
              return u;
            }
            
        } catch (SQLException e) {
        }
        return null;
        
    }
    //check xem da ton tai username chua
    public boolean existedUser(String username){
        String sql="select * from [User} where username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }
   // dang ky 
    public void changepassword(User u){
        String sql ="update [user] set password=? where username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getPassword());
            st.setString(2, u.getUsername());
            st.executeUpdate();
            
        } catch (SQLException e) {
        }
    }
   
    
    
}

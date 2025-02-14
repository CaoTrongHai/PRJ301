/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.security.Timestamp;
import model.Order;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

/**
 *
 * @author FPTSHOP
 */
public class OrderDAO extends DBContext {

    // insert vào trong bảng Order
    public void InsertOrders(Order o) {
        String sql = "insert into Orders (CustomerID,ShoppingCartID,OrderDate,TotalPrice,DeliveryMethod) "
                + "values(?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, o.getCustomerId());
            st.setInt(2, o.getShoppingCart());
            // Lấy ngày và thời gian hiện tại
            LocalDateTime currentDateTime = LocalDateTime.now();

            // Chuyển đổi thành chuỗi theo định dạng mong muốn
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDateTime = currentDateTime.format(formatter);
            st.setString(3, formattedDateTime);
            st.setDouble(4, o.getTotalPrice());
            st.setString(5, o.getDeliveryMethod());

            // Thực hiện câu lệnh SQL
            st.executeUpdate();
            deleteShoppingCart(o.getShoppingCart());
        } catch (SQLException e) {
        }

    }

    public void deleteShoppingCart(int shoppingCartId) throws SQLException {
        try {
            // Tạm thời vô hiệu hóa ràng buộc khóa ngoại
            disableForeignKeyChecks();

            // Xóa bản ghi từ bảng ShoppingCart
            String deleteShoppingCartSql = "DELETE FROM ShoppingCart WHERE ShoppingCartID = ?";
            try (PreparedStatement deleteStatement = connection.prepareStatement(deleteShoppingCartSql)) {
                deleteStatement.setInt(1, shoppingCartId);
                deleteStatement.executeUpdate();
            }
        } finally {
            // Bật lại ràng buộc khóa ngoại ngay cả khi có lỗi xảy ra
            enableForeignKeyChecks();
        }
    }

    private void disableForeignKeyChecks() throws SQLException {
        String disableForeignKeySql = "EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'";
        try (Statement statement = connection.createStatement()) {
            statement.execute(disableForeignKeySql);
        }
    }

    private void enableForeignKeyChecks() throws SQLException {
        String enableForeignKeySql = "EXEC sp_msforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL'";
        try (Statement statement = connection.createStatement()) {
            statement.execute(enableForeignKeySql);
        }
    }
  

}

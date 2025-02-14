/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.UpdateQuantityProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.User;


/**
 *
 * @author FPTSHOP
 */
@WebServlet(name = "OrderSuccessServlet", urlPatterns = {"/ordersuccess"})
public class OrderSuccessServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderSuccessServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderSuccessServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
         User user = (User)request.getSession().getAttribute("account");
         String shoppingCartId_raw = request.getParameter("shoppingcartid");
         String price_raw = request.getParameter("price");
         String orderType = request.getParameter("orderType");
         try {
            int shoppingCartId = Integer.parseInt(shoppingCartId_raw);
            double totalPrice = Double.parseDouble(price_raw);
            Order o = new Order(user.getCustomerID(),shoppingCartId, totalPrice, orderType);
            OrderDAO od = new OrderDAO();
            // thêm đơn hàng vào dữ liệu
            od.InsertOrders(o);  
            // xóa đơn hàng vào dữ liệu
            od.deleteShoppingCart(shoppingCartId);
            // giảm quantity trong product
            String productName = request.getParameter("nameproduct");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            UpdateQuantityProductDAO u = new UpdateQuantityProductDAO();
            u.updateQuantity(productName, quantity);
            
            
            request.setAttribute("ms", "Bạn đã đặt hàng thành công!!! Cảm ơn bạn đã ủng hộ chúng tôi");
            request.getRequestDispatcher("order.jsp").forward(request, response);
          
        } catch (NumberFormatException e) {
        } catch (SQLException ex) {
            Logger.getLogger(OrderSuccessServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
         
         
         
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

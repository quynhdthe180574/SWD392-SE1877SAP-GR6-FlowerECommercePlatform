/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class Order {
    private int orderId;
    private int userId;
    private int addressId;
    private int paymentId;
    private Date orderDate;
    private BigDecimal  shipFee;
    private BigDecimal  totalPrice;
    private String status;

    public Order() {
    }

    public Order(int orderId, int userId, int addressId, int paymentId, Date orderDate, BigDecimal  shipFee, BigDecimal  totalPrice, String status) {
        this.orderId = orderId;
        this.userId = userId;
        this.addressId = addressId;
        this.paymentId = paymentId;
        this.orderDate = orderDate;
        this.shipFee = shipFee;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public BigDecimal  getShipFee() {
        return shipFee;
    }

    public void setShipFee(BigDecimal  shipFee) {
        this.shipFee = shipFee;
    }

    public BigDecimal  getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal  totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}

package entity;

import java.util.Date;

public class OrderItem {

    // p.name
    private String productName;
    // oi.quantity
    private int quantity;
    // oi.unit_price
    private double unitPrice;
    // o.status
    private String status;
    // s.shop_name
    private String shopName;
    // p.image_url
    private String imageUrl;

    private double totalPrice;
    
    private Date dateOrder;

    public OrderItem() {
    }

    public OrderItem(String productName, int quantity, double unitPrice, String status, String shopName, String imageUrl, Date date) {
        this.productName = productName;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.status = status;
        this.shopName = shopName;
        this.imageUrl = imageUrl;
        this.dateOrder = date;
        this.totalPrice = unitPrice * quantity;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public double getTotalPrice() {
        this.totalPrice = this.unitPrice * this.quantity;
        return this.totalPrice;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    public Date getDateOrder() {
        return dateOrder;
    }
    
}
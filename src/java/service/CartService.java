package service;

import dao.CartDAO;
import dao.ProductDAO;
import entity.CartItem;
import entity.Product;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CartService {
    private final CartDAO cartDAO;
    private final ProductDAO productDAO;

    public CartService() {
        this.cartDAO = new CartDAO();
        this.productDAO = new ProductDAO();
    }

    public Map<Integer, Integer> addToSessionCart(Map<Integer, Integer> cart, int productId, int quantity) {
        Product product = productDAO.getProductById(productId);
        if (product == null || product.getStockQuantity() < quantity) {
            return null; // Trả về null nếu không đủ hàng hoặc sản phẩm không tồn tại
        }
        if (cart == null) {
            cart = new HashMap<>();
        }
        cart.put(productId, cart.getOrDefault(productId, 0) + quantity);
        return cart;
    }

    public void addToCart(int userId, int productId, int quantity) {
        cartDAO.addToCart(userId, productId, quantity);
    }

    public List<CartItem> getCartByUserId(int userId) {
        return cartDAO.getCartByUserId(userId);
    }

    public int getCartSize(int userId) {
        return cartDAO.getCartSize(userId);
    }

    public int getSessionCartSize(Map<Integer, Integer> cart) {
        if (cart == null) {
            return 0;
        }
        return cart.values().stream().mapToInt(Integer::intValue).sum();
    }

    public boolean updateQuantity(int cartId, int quantity) {
        return cartDAO.updateQuantity(cartId, quantity);
    }

    public boolean removeFromCart(int cartId) {
        return cartDAO.removeFromCart(cartId);
    }

    public void clearCart(int userId) {
        cartDAO.clearCart(userId);
    }

    public Product getProductById(int productId) {
        return productDAO.getProductById(productId);
    }
}
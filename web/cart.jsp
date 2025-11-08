<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, entity.CartItem" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Giỏ hàng của bạn</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #fdf2f8, #fce7f3);
                min-height: 100vh;
                padding: 20px;
                color: #4a4a4a;
            }
            .header {
                text-align: center;
                margin: 40px 0;
                color: #831843;
            }
            .header h1 {
                font-size: 2.8em;
                font-weight: 700;
                letter-spacing: -0.5px;
                margin-bottom: 10px;
            }
            .header p {
                font-size: 1.1em;
                color: #be185d;
                margin-top: 8px;
                font-weight: 500;
            }
            .container {
                max-width: 1000px;
                margin: 0 auto;
                background: white;
                border-radius: 20px;
                box-shadow: 0 15px 40px rgba(190, 24, 93, 0.08);
                overflow: hidden;
                border: 1px solid rgba(255, 255, 255, 0.5);
            }
            .cart-items {
                padding: 30px;
            }
            .cart-item {
                display: flex;
                align-items: center;
                background: #fdf2f8;
                border-radius: 16px;
                padding: 20px;
                margin: 18px 0;
                box-shadow: 0 4px 12px rgba(190, 24, 93, 0.05);
                transition: all 0.3s ease;
                border: 1px solid rgba(251, 207, 232, 0.5);
            }
            .cart-item:hover {
                transform: translateY(-4px);
                box-shadow: 0 10px 25px rgba(190, 24, 93, 0.12);
            }
            .cart-item img {
                width: 90px;
                height: 90px;
                object-fit: cover;
                border-radius: 14px;
                border: 2px solid #f9a8d4;
            }
            .item-info {
                flex: 1;
                margin-left: 20px;
            }
            .item-info h3 {
                font-size: 1.3em;
                color: #831843;
                margin-bottom: 8px;
                font-weight: 600;
            }
            .item-info .price {
                font-weight: bold;
                color: #be185d;
                font-size: 1.1em;
            }
            .item-actions {
                display: flex;
                align-items: center;
                gap: 12px;
                margin-right: 20px;
            }
            .item-actions input {
                width: 65px;
                padding: 10px;
                text-align: center;
                border: 1px solid #f9a8d4;
                border-radius: 10px;
                font-weight: bold;
                background: white;
                font-size: 1em;
            }
            .remove-btn {
                background: #be185d;
                color: white;
                border: none;
                padding: 10px 16px;
                border-radius: 10px;
                cursor: pointer;
                font-weight: 600;
                transition: 0.3s;
                font-size: 0.9em;
            }
            .remove-btn:hover {
                background: #9d174d;
                transform: translateY(-2px);
            }
            .item-total {
                font-weight: bold;
                color: #831843;
                font-size: 1.2em;
                min-width: 100px;
                text-align: right;
            }
            .summary {
                background: linear-gradient(45deg, #be185d, #9d174d);
                color: white;
                padding: 30px;
                text-align: center;
            }
            .summary h2 {
                font-size: 1.8em;
                margin-bottom: 20px;
                font-weight: 600;
            }
            .summary p {
                font-size: 1.2em;
                margin: 12px 0;
                display: flex;
                justify-content: space-between;
                max-width: 400px;
                margin-left: auto;
                margin-right: auto;
            }
            .total {
                font-size: 2.2em !important;
                font-weight: bold;
                color: #fff;
                text-shadow: 0 2px 4px rgba(0,0,0,0.2);
                margin-top: 15px !important;
            }
            .checkout-btn {
                background: white;
                color: #be185d;
                border: none;
                padding: 16px 45px;
                font-size: 1.3em;
                font-weight: bold;
                border-radius: 50px;
                cursor: pointer;
                margin-top: 25px;
                box-shadow: 0 5px 15px rgba(255, 255, 255, 0.3);
                transition: all 0.3s;
                letter-spacing: 0.5px;
            }
            .checkout-btn:hover {
                transform: scale(1.05);
                background: #fdf2f8;
                box-shadow: 0 8px 20px rgba(255, 255, 255, 0.4);
            }
            .empty-cart {
                text-align: center;
                padding: 70px 20px;
                color: #be185d;
                font-size: 1.4em;
            }
            .empty-cart img {
                width: 140px;
                opacity: 0.7;
                margin-bottom: 25px;
                filter: grayscale(20%);
            }
            .empty-cart a {
                display: inline-block;
                margin-top: 20px;
                color: #be185d;
                text-decoration: none;
                font-weight: bold;
                padding: 12px 25px;
                border: 2px solid #be185d;
                border-radius: 10px;
                transition: all 0.3s;
            }
            .empty-cart a:hover {
                background: #be185d;
                color: white;
                transform: translateY(-3px);
            }
            .pink-bar {
                height: 6px;
                background: linear-gradient(to right, #fdf2f8, #fbcfe8, #f9a8d4, #f472b6, #ec4899);
                border-radius: 3px;
                margin: 0 auto 30px;
                max-width: 1000px;
            }
            .loading {
                opacity: 0.6;
                pointer-events: none;
            }
            .cart-header {
                display: flex;
                justify-content: space-between;
                padding: 20px 30px;
                border-bottom: 1px solid #fbcfe8;
                background: #fdf2f8;
            }
            .cart-title {
                font-size: 1.5em;
                color: #831843;
                font-weight: 600;
            }
            .item-count {
                color: #be185d;
                font-weight: 500;
            }
        </style>
    </head>
    <body>

        <div class="pink-bar"></div>

        <div class="header">
            <h1>Your Shopping Cart</h1>
            <p>Choose the most beautiful flowers for the one you love.💐</p>
        </div>

        <div class="container" id="cartContainer">
            <%
                List<CartItem> cart = (List<CartItem>) request.getAttribute("cart");
                Double total = (Double) request.getAttribute("total");
                if (cart == null || cart.isEmpty()) {
            %>
            <div class="empty-cart">
                <img src="img/anh-hoa-dep-11.jpg" alt="Empty">
                <p>Looks like your cart is empty!</p>
                <a href="${pageContext.request.contextPath}/product-list">Continue shopping</a>
            </div>
            <%
                } else {
            %>
            <div class="cart-header">
                <div class="cart-title">Flowers in your cart</div>
                <div class="item-count"><%= cart.size() %> All Products</div>
            </div>
            <div class="cart-items">
                <%
                        for (CartItem item : cart) {
                %>
                <div class="cart-item" data-cart-id="<%= item.getCartId() %>">
                    <img src="${pageContext.request.contextPath}<%= item.getImageUrl() %>" alt="<%= item.getProductName() %>">
                    <div class="item-info">
                        <h3><%= item.getProductName() %></h3>
                        <div class="price">$<%= String.format("%.2f", item.getPrice()) %></div>
                    </div>
                    <div class="item-actions">
                        <input type="number" value="<%= item.getQuantity() %>" min="1" max="99"
                               onchange="updateQuantity(<%= item.getCartId() %>, this.value, this)">
                        <button class="remove-btn" onclick="removeItem(<%= item.getCartId() %>, this)">Remove</button>
                    </div>
                    <div class="item-total">
                        = $<%= String.format("%.2f", item.getTotal()) %>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>

            <% if (cart != null && !cart.isEmpty()) { %>
            <div class="summary">
                <h2>Order Summary</h2>
                <p><span>Subtotal:</span> <strong>$<%= String.format("%.2f", total) %></strong></p>
                <p><span>Shipping Fee:</span> <strong>30,000 VND</strong></p>
                <p class="total">$<%= String.format("%.2f", total + 30000) %></p>
                <button class="checkout-btn" onclick="window.location.href = 'checkout.jsp'">Checkout Now</button>
            </div>
            <% } %>
        </div>

        <script>
            // Hiệu ứng loading
            function setLoading(element, isLoading) {
                const item = element.closest('.cart-item');
                if (isLoading) {
                    item.classList.add('loading');
                } else {
                    item.classList.remove('loading');
                }
            }

            // Cập nhật số lượng
            function updateQuantity(cartId, qty, input) {
                if (qty < 1 || qty > 99) {
                    alert("Quantity must be between 1 and 99!");
                    input.value = input.defaultValue || 1;
                    return;
                }

                setLoading(input, true);

                fetch('UpdateCartServlet', {
                    method: 'POST',
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    body: 'cartId=' + cartId + '&quantity=' + qty
                })
                        .then(response => response.text())
                        .then(result => {
                            if (result.trim() === "OK") {
                                location.reload();
                            } else {
                                alert("Update failed! Please try again.");
                                input.value = input.defaultValue;
                            }
                        })
                        .catch(() => {
                            alert("Connection error! Please check your network.");
                            input.value = input.defaultValue;
                        })
                        .finally(() => setLoading(input, false));
            }

            // Xóa sản phẩm
            function removeItem(cartId, button) {
                if (!confirm("Remove this product from your cart?"))
                    return;

                setLoading(button, true);

                fetch('RemoveFromCartServlet', {
                    method: 'POST',
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    body: 'cartId=' + cartId
                })
                        .then(response => response.text())
                        .then(result => {
                            if (result.trim() === "OK") {
                                location.reload();
                            } else {
                                alert("Remove failed! Please try again."");
                            }
                        })
                        .catch(() => alert("Connection error!"))
                        .finally(() => setLoading(button, false));
            }
        </script>

    </body>
</html>
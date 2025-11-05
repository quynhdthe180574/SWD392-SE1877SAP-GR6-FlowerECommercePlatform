<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${product.name}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background: #f9f9f9; }
        .container { display: flex; gap: 30px; max-width: 1200px; margin: auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .product-img { width: 400px; height: 400px; object-fit: cover; border-radius: 10px; }
        .info { flex: 1; }
        .info h1 { margin: 0 0 10px; font-size: 1.8em; color: #333; }
        .price { font-size: 1.6em; color: #d9534f; font-weight: bold; margin: 10px 0; }
        .quantity { margin: 20px 0; display: flex; align-items: center; gap: 10px; }
        .quantity input { width: 60px; padding: 8px; text-align: center; font-size: 1em; border: 1px solid #ccc; border-radius: 4px; }
        .btn-add {
            background: #ff6b6b; color: white; border: none; padding: 12px 30px;
            font-size: 1.1em; border-radius: 6px; cursor: pointer;
        }
        .btn-add:hover { background: #ff5252; }
        .cart-icon {
            position: fixed; top: 20px; right: 20px; background: #ff6b6b; color: white;
            width: 50px; height: 50px; border-radius: 50%; display: flex; align-items: center;
            justify-content: center; font-weight: bold; font-size: 1.2em; box-shadow: 0 2px 10px rgba(0,0,0,0.2);
            cursor: pointer; z-index: 1000;
        }
        .cart-count { position: absolute; top: -8px; right: -8px; background: red; color: white;
                      width: 20px; height: 20px; border-radius: 50%; font-size: 0.8em; display: flex;
                      align-items: center; justify-content: center; }
        .popup {
            position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);
            background: white; padding: 25px; border-radius: 10px; box-shadow: 0 5px 20px rgba(0,0,0,0.3);
            text-align: center; z-index: 2000; display: none; width: 320px;
        }
        .popup.show { display: block; animation: fadeIn 0.3s; }
        @keyframes fadeIn { from { opacity: 0; transform: translate(-50%, -60%); } to { opacity: 1; transform: translate(-50%, -50%); } }
        .popup button { margin: 10px 5px; padding: 8px 20px; background: #ff6b6b; color: white; border: none; border-radius: 4px; cursor: pointer; }
        .popup button:hover { background: #ff5252; }
        .error { color: #d9534f; font-weight: bold; text-align: center; margin: 10px 0; }
    </style>
</head>
<body>

    <!-- Cart Icon + Count -->
    <div class="cart-icon" onclick="window.location.href='ViewCartServlet'">
        Cart
        <span class="cart-count" id="cartCount">${cartSize}</span>
    </div>

    <div class="container">
        <img src="${pageContext.request.contextPath}${product.imageUrl}" class="product-img" alt="${product.name}">
        <div class="info">
            <h1>${product.name}</h1>
            <div class="price">$${product.price}</div>
            <p>${product.description}</p>

            <%-- Error Message --%>
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
                <p class="error"><%= error %></p>
            <% } %>

            <div class="quantity">
                <label>Số lượng:</label>
                <input type="number" id="qty" value="1" min="1" max="99">
                <button class="btn-add" onclick="addToCart(${product.id})">Add to Cart</button>
            </div>
        </div>
    </div>

    <!-- Popup Confirm -->
    <div class="popup" id="popup">
        <h3>Added to Cart!</h3>
        <p id="popupMsg"></p>
        <button onclick="closePopup()">Continue Shopping</button>
        <button onclick="window.location.href='ViewCartServlet'">View Cart</button>
    </div>

    <script>
        function addToCart(productId) {
            const qty = document.getElementById('qty').value;
            if (qty < 1 || qty > 99) return alert("Số lượng từ 1-99");

            fetch('AddToCartServlet', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'productId=' + productId + '&quantity=' + qty
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    document.getElementById('cartCount').textContent = data.cartSize;
                    document.getElementById('popupMsg').textContent = data.productName + " × " + qty + " đã thêm vào giỏ!";
                    document.getElementById('popup').classList.add('show');
                } else {
                    alert("Lỗi: " + data.message);
                }
            })
            .catch(() => alert("Lỗi mạng"));
        }

        function closePopup() {
            document.getElementById('popup').classList.remove('show');
        }
    </script>

</body>
</html>
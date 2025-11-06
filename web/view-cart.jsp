<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Giỏ hàng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            :root {
                --primary: #be185d;
                --primary-light: #fdf2f8;
                --success: #27ae60;
                --light: #f8f9fa;
                --dark: #212529;
                --text-dark: #4a4a4a;
            }
            body {
                background: linear-gradient(to bottom, #fdf2f8, #fff);
                min-height: 100vh;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: var(--text-dark);
            }
            .page-header {
                background: linear-gradient(45deg, #be185d, #9d174d);
                color: white;
                padding: 2.5rem 0;
                margin-bottom: 2.5rem;
                border-bottom: 4px solid #831843;
                box-shadow: 0 4px 12px rgba(190, 24, 93, 0.15);
            }
            .page-header h1 {
                font-weight: 700;
                letter-spacing: -0.5px;
            }
            .cart-item {
                border: none;
                border-radius: 16px;
                box-shadow: 0 6px 18px rgba(0,0,0,0.08);
                padding: 1.5rem;
                margin-bottom: 1.5rem;
                background: white;
                border: 1px solid rgba(251, 207, 232, 0.3);
                transition: all 0.3s ease;
            }
            .cart-item:hover {
                transform: translateY(-4px);
                box-shadow: 0 12px 25px rgba(190, 24, 93, 0.15);
            }
            .cart-img {
                width: 120px;
                height: 120px;
                object-fit: cover;
                border-radius: 12px;
                border: 2px solid #f9a8d4;
            }
            .img-placeholder {
                width: 120px;
                height: 120px;
                border-radius: 12px;
                border: 2px solid #f9a8d4;
                background: linear-gradient(45deg, #fdf2f8, #fce7f3);
                display: flex;
                align-items: center;
                justify-content: center;
                color: #be185d;
                font-size: 2rem;
            }
            .btn-remove {
                color: #dc3545;
                border: none;
                background: none;
                font-size: 1.2rem;
                transition: all 0.3s ease;
                padding: 8px 12px;
                border-radius: 8px;
            }
            .btn-remove:hover {
                color: white;
                background: #dc3545;
                transform: scale(1.1);
            }
            .quantity-input {
                width: 90px;
                text-align: center;
                border: 1px solid #f9a8d4;
                border-radius: 10px;
                padding: 0.5rem;
                font-weight: 600;
            }
            .quantity-input:focus {
                border-color: #be185d;
                box-shadow: 0 0 0 0.2rem rgba(190, 24, 93, 0.15);
            }
            .empty-state {
                text-align: center;
                padding: 5rem 2rem;
                color: #9d174d;
            }
            .empty-state i {
                font-size: 4.5rem;
                color: #f9a8d4;
                margin-bottom: 1.5rem;
                opacity: 0.7;
            }
            .empty-state h3 {
                font-weight: 600;
                margin-bottom: 1rem;
                color: #831843;
            }
            .btn-continue {
                background: linear-gradient(45deg, #be185d, #9d174d);
                color: white;
                border: none;
                border-radius: 12px;
                padding: 0.75rem 1.5rem;
                font-weight: 600;
                transition: all 0.3s ease;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
            }
            .btn-continue:hover {
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 6px 16px rgba(190, 24, 93, 0.3);
            }
            .btn-checkout {
                background: linear-gradient(45deg, #27ae60, #219653);
                color: white;
                border: none;
                border-radius: 12px;
                padding: 1rem 2.5rem;
                font-weight: 600;
                font-size: 1.1rem;
                transition: all 0.3s ease;
                margin-top: 1rem;
            }
            .btn-checkout:hover {
                background: linear-gradient(45deg, #219653, #1e8747);
                transform: translateY(-2px);
                box-shadow: 0 6px 16px rgba(39, 174, 96, 0.3);
            }
            .summary-box {
                background: linear-gradient(45deg, #fdf2f8, #fce7f3);
                border-radius: 16px;
                padding: 2rem;
                border: 1px solid rgba(251, 207, 232, 0.5);
                box-shadow: 0 6px 18px rgba(0,0,0,0.08);
            }
            .product-name {
                color: #831843;
                font-weight: 600;
                font-size: 1.1rem;
            }
            .shop-info {
                color: #9d174d;
                font-size: 0.9rem;
                font-weight: 500;
            }
            .price-info {
                color: #be185d;
                font-weight: 700;
                font-size: 1.1rem;
            }
            .total-price {
                color: #be185d;
                font-weight: 700;
                font-size: 1.8rem;
            }
            .header-link {
                color: white;
                text-decoration: none;
                transition: all 0.3s ease;
                padding: 0.75rem 1.5rem;
                background: rgba(255, 255, 255, 0.15);
                border-radius: 12px;
                border: 1px solid rgba(255, 255, 255, 0.2);
            }
            .header-link:hover {
                color: white;
                background: rgba(255, 255, 255, 0.25);
                transform: translateY(-2px);
            }
            .toast-container {
                z-index: 1055;
            }
            .toast {
                border-radius: 12px;
                box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            }
            .quantity-controls {
                display: flex;
                align-items: center;
                gap: 0.75rem;
            }
            .btn-quantity {
                width: 38px;
                height: 38px;
                border-radius: 50%;
                border: 1px solid #f9a8d4;
                background: white;
                color: #be185d;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.3s ease;
            }
            .btn-quantity:hover {
                background: #fdf2f8;
                transform: scale(1.1);
            }
            @media (max-width: 768px) {
                .cart-img, .img-placeholder {
                    width: 100px;
                    height: 100px;
                }
                .cart-item {
                    padding: 1rem;
                }
                .total-price {
                    font-size: 1.5rem;
                }
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <div class="page-header">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col">
                        <h1 class="mb-0 d-flex align-items-center">
                            <i class="bi bi-cart3 me-3" style="font-size: 2.2rem;"></i> 
                            <div>
                                <div>Giỏ hàng của bạn</div>
                                <small class="fs-6 opacity-75">Những bông hoa đẹp nhất cho người bạn yêu thương</small>
                            </div>
                        </h1>
                    </div>
                    <div class="col-auto">
                        <a href="${pageContext.request.contextPath}/product-list" class="header-link">
                            <i class="bi bi-arrow-left me-2"></i> Tiếp tục mua sắm
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container pb-5">
            <c:choose>
                <c:when test="${not empty cartItems}">
                    <div class="row">
                        <div class="col-lg-8">
                            <c:forEach var="item" items="${cartItems}">
                                <div class="cart-item d-flex align-items-center">
                                    <!-- Phần hiển thị ảnh đã sửa -->
                                    <c:choose>
                                        <c:when test="${not empty item.imageUrl and item.imageUrl != ''}">
                                            <c:choose>
                                                <c:when test="${item.imageUrl.startsWith('http')}">
                                                    <img src="${item.imageUrl}" class="cart-img me-4" alt="${item.productName}">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${pageContext.request.contextPath}${item.imageUrl}" class="cart-img me-4" alt="${item.productName}">
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="img-placeholder me-4">
                                                <i class="bi bi-flower2"></i>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

                                    <div class="flex-grow-1">
                                        <h5 class="product-name mb-2">${item.productName}</h5>
                                        <p class="shop-info mb-2">
                                            <i class="bi bi-shop me-1"></i> Cửa hàng hoa tươi
                                        </p>
                                        <p class="price-info mb-3">
                                            <fmt:formatNumber value="${item.price}" type="currency" currencySymbol="₫"/>
                                            x ${item.quantity} = 
                                            <strong><fmt:formatNumber value="${item.total}" type="currency" currencySymbol="₫"/></strong>
                                        </p>
                                        <div class="quantity-controls">
                                            <button class="btn-quantity" onclick="updateQuantity(${item.productId}, ${item.quantity - 1})">
                                                <i class="bi bi-dash"></i>
                                            </button>
                                            <input type="number" class="form-control quantity-input"
                                                   value="${item.quantity}" min="1" max="99"
                                                   onchange="updateCart(${item.productId}, this.value)">
                                            <button class="btn-quantity" onclick="updateQuantity(${item.productId}, ${item.quantity + 1})">
                                                <i class="bi bi-plus"></i>
                                            </button>
                                            <button class="btn-remove ms-3" onclick="removeFromCart(${item.cartId})" title="Xóa sản phẩm">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="col-lg-4">
                            <div class="summary-box">
                                <h4 class="mb-4" style="color: #831843;">
                                    <i class="bi bi-receipt me-2"></i>Tổng kết đơn hàng
                                </h4>

                                <div class="d-flex justify-content-between mb-3">
                                    <span>Tổng tiền hàng:</span>
                                    <strong class="price-info">
                                        <fmt:formatNumber value="${total}" type="currency" currencySymbol="₫"/>
                                    </strong>
                                </div>

                                <div class="d-flex justify-content-between mb-3">
                                    <span>Phí vận chuyển:</span>
                                    <strong class="price-info">30,000₫</strong>
                                </div>

                                <hr>

                                <div class="d-flex justify-content-between mb-4">
                                    <span class="fw-bold">Thành tiền:</span>
                                    <strong class="total-price">
                                        <fmt:formatNumber value="${total + 30000}" type="currency" currencySymbol="₫"/>
                                    </strong>
                                </div>

                                <form action="${pageContext.request.contextPath}/VNPay_Payment" method="POST"> 
                                    <input type="hidden" name="amount" value="${total + 30000}"> 
                                    <button class="btn-checkout w-100 d-flex align-items-center justify-content-center"> 
                                        <i class="bi bi-credit-card me-2">

                                        </i> Thanh toán ngay </button> </form>

                                <div class="text-center mt-3">
                                    <small class="text-muted">
                                        <i class="bi bi-truck me-1"></i> Miễn phí vận chuyển cho đơn trên 500,000₫
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <i class="bi bi-cart-x"></i>
                        <h3>Giỏ hàng trống</h3>
                        <p class="text-muted">Hãy thêm sản phẩm vào giỏ hàng để tiếp tục.</p>
                        <a href="${pageContext.request.contextPath}/product-list" class="btn-continue mt-3">
                            <i class="bi bi-flower1 me-2"></i> Xem sản phẩm
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Toast -->
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div id="cartToast" class="toast align-items-center text-white bg-success border-0" role="alert" style="border-radius: 12px;">
                <div class="d-flex">
                    <div class="toast-body d-flex align-items-center">
                        <i class="bi bi-check-circle-fill me-2 fs-5"></i>
                        <span id="toastMessage" class="fw-medium"></span>
                    </div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                                const toastEl = document.getElementById('cartToast');
                                                const toast = new bootstrap.Toast(toastEl);
                                                const toastMessage = document.getElementById('toastMessage');

                                                function updateQuantity(productId, newQuantity) {
                                                    if (newQuantity < 1)
                                                        newQuantity = 1;
                                                    if (newQuantity > 99)
                                                        newQuantity = 99;

                                                    const input = document.querySelector(`input[onchange*="${productId}"]`);
                                                    if (input) {
                                                        input.value = newQuantity;
                                                    }
                                                    updateCart(productId, newQuantity);
                                                }

                                                function updateCart(productId, quantity) {
                                                    if (quantity < 1 || quantity > 99) {
                                                        alert("Số lượng phải từ 1 đến 99!");
                                                        return;
                                                    }

                                                    fetch('${pageContext.request.contextPath}/update-cart', {
                                                        method: 'POST',
                                                        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                                                        body: 'productId=' + productId + '&quantity=' + quantity
                                                    })
                                                            .then(response => response.json())
                                                            .then(data => {
                                                                if (data.success) {
                                                                    toastMessage.innerHTML = 'Đã cập nhật giỏ hàng!';
                                                                    toast.show();
                                                                    setTimeout(() => location.reload(), 800);
                                                                } else {
                                                                    alert(data.message || 'Không thể cập nhật giỏ hàng');
                                                                    location.reload();
                                                                }
                                                            })
                                                            .catch(err => {
                                                                console.error('Lỗi fetch:', err);
                                                                alert('Lỗi kết nối. Vui lòng thử lại!');
                                                                location.reload();
                                                            });
                                                }

                                                function removeFromCart(cartId) {
                                                    if (!confirm('Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?'))
                                                        return;

                                                    fetch('${pageContext.request.contextPath}/remove-from-cart', {
                                                        method: 'POST',
                                                        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                                                        body: 'cartId=' + cartId
                                                    })
                                                            .then(response => response.json())
                                                            .then(data => {
                                                                if (data.success) {
                                                                    toastMessage.innerHTML = 'Đã xóa sản phẩm khỏi giỏ hàng!';
                                                                    toast.show();
                                                                    setTimeout(() => location.reload(), 800);
                                                                } else {
                                                                    alert(data.message || 'Không thể xóa sản phẩm');
                                                                    location.reload();
                                                                }
                                                            })
                                                            .catch(err => {
                                                                console.error('Lỗi fetch:', err);
                                                                alert('Lỗi kết nối. Vui lòng thử lại!');
                                                                location.reload();
                                                            });
                                                }

                                                toastEl.addEventListener('shown.bs.toast', () => {
                                                    setTimeout(() => toast.hide(), 3000);
                                                });

                                                // Fix lỗi ảnh không load
                                                document.addEventListener('DOMContentLoaded', function () {
                                                    const images = document.querySelectorAll('.cart-img');
                                                    images.forEach(img => {
                                                        img.onerror = function () {
                                                            this.style.display = 'none';
                                                            const placeholder = document.createElement('div');
                                                            placeholder.className = 'img-placeholder me-4';
                                                            placeholder.innerHTML = '<i class="bi bi-flower2"></i>';
                                                            this.parentNode.insertBefore(placeholder, this);
                                                        };
                                                    });
                                                });
        </script>
    </body>
</html>
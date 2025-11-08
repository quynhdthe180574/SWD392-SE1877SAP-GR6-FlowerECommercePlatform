<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Danh sách hoa tươi</title>
        <!-- Bootstrap 5 + Icons -->
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
            .product-card {
                transition: all 0.4s ease;
                border: none;
                border-radius: 18px;
                overflow: hidden;
                box-shadow: 0 6px 18px rgba(0,0,0,0.08);
                height: 100%;
                display: flex;
                flex-direction: column;
                background: white;
                border: 1px solid rgba(251, 207, 232, 0.3);
            }
            .product-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 16px 32px rgba(190, 24, 93, 0.18);
            }
            .product-img-container {
                overflow: hidden;
                position: relative;
            }
            .product-img {
                height: 240px;
                object-fit: cover;
                transition: transform 0.5s ease;
                width: 100%;
            }
            .product-card:hover .product-img {
                transform: scale(1.08);
            }
            .product-info {
                padding: 1.5rem;
                flex-grow: 1;
                display: flex;
                flex-direction: column;
                background: var(--primary-light);
            }
            .product-name {
                font-size: 1.15rem;
                font-weight: 600;
                color: #831843;
                margin-bottom: 0.75rem;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                overflow: hidden;
                line-height: 1.4;
            }
            .shop-info {
                font-size: 0.9rem;
                color: #9d174d;
                margin-bottom: 0.75rem;
                font-weight: 500;
            }
            .shop-info i {
                opacity: 0.8;
            }
            .price {
                font-size: 1.45rem;
                font-weight: 700;
                color: var(--primary);
                margin-bottom: 0.75rem;
            }
            .stock {
                font-size: 0.95rem;
                color: #27ae60;
                font-weight: 600;
                margin-bottom: 1.25rem;
                display: flex;
                align-items: center;
            }
            .stock i {
                margin-right: 6px;
            }
            .btn-add {
                background: linear-gradient(45deg, #27ae60, #219653);
                color: white;
                border: none;
                border-radius: 12px;
                padding: 0.75rem 1.25rem;
                font-weight: 600;
                font-size: 0.95rem;
                transition: all 0.3s ease;
                margin-top: auto;
                box-shadow: 0 4px 12px rgba(39, 174, 96, 0.2);
            }
            .btn-add:hover {
                background: linear-gradient(45deg, #219653, #1e8747);
                transform: translateY(-3px);
                box-shadow: 0 6px 16px rgba(39, 174, 96, 0.3);
            }
            .btn-add:disabled {
                background: #95a5a6;
                cursor: not-allowed;
                transform: none;
                box-shadow: none;
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
            .cart-badge {
                background: #ff6b6b;
                color: white;
                border-radius: 50%;
                width: 26px;
                height: 26px;
                font-size: 0.8rem;
                font-weight: bold;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                margin-left: 0.5rem;
                box-shadow: 0 2px 4px rgba(0,0,0,0.2);
            }
            .cart-link {
                color: white;
                text-decoration: none;
                transition: all 0.3s ease;
                padding: 0.75rem 1.5rem;
                background: rgba(255, 255, 255, 0.15);
                border-radius: 12px;
                border: 1px solid rgba(255, 255, 255, 0.2);
            }
            .cart-link:hover {
                color: white;
                background: rgba(255, 255, 255, 0.25);
                transform: translateY(-2px);
            }
            .header-icon {
                font-size: 2.2rem;
                margin-right: 1rem;
                opacity: 0.9;
            }
            .toast-container {
                z-index: 1055;
            }
            .toast {
                border-radius: 12px;
                box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            }
            .product-category {
                position: absolute;
                top: 12px;
                left: 12px;
                background: rgba(190, 24, 93, 0.9);
                color: white;
                padding: 4px 10px;
                border-radius: 20px;
                font-size: 0.75rem;
                font-weight: 600;
                backdrop-filter: blur(4px);
            }
            .btn-light-pink {
                background-color: #f8c6d0; /* màu hồng nhạt */
                color: #831843; /* chữ màu đậm để nổi bật */
                border: none;
                border-radius: 14px;
                padding: 0.5rem 1rem;
                font-weight: 600;
                transition: all 0.3s ease;
                display: inline-flex;
                align-items: center;
                gap: 0.3rem;
            }

            .btn-light-pink:hover {
                background-color: #fcdbe5; /* hồng nhạt hơn khi hover */
                transform: translateY(-2px);
                box-shadow: 0 6px 16px rgba(190, 24, 93, 0.15);
                text-decoration: none;
                color: #831843;
            }
            @media (max-width: 768px) {
                .product-name {
                    font-size: 1.05rem;
                }
                .price {
                    font-size: 1.3rem;
                }
                .page-header {
                    padding: 2rem 0;
                }
                .header-icon {
                    font-size: 1.8rem;
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
                            <i class="bi bi-flower1 header-icon"></i> 
                            <div>
                                <div>Bloom Boutique</div>
                                <small class="fs-6 opacity-75">The most beautiful flowers for the one you love.</small>
                            </div>
                        </h1>
                        <a href="${pageContext.request.contextPath}/homepage" 
                           class="btn btn-light-pink ms-3">
                            <i class="bi bi-house-door me-1"></i> Home
                        </a>

                    </div>
                    <div class="col-auto">
                        <a href="${pageContext.request.contextPath}/view-cart" class="cart-link">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-cart3 fs-4 me-2"></i>
                                <span class="fs-5 fw-medium">Shopping Cart</span>
                                <strong id="cartSize" class="fs-5 ms-2">${cartSize}</strong>
                                <c:if test="${cartSize > 0}">
                                    <span id="cartBadge" class="cart-badge ms-2">${cartSize}</span>
                                </c:if>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container pb-5">
            <c:choose>
                <c:when test="${not empty products}">
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
                        <c:forEach var="p" items="${products}">
                            <div class="col">
                                <div class="product-card h-100">
                                    <!-- Hình ảnh -->
                                    <div class="product-img-container">
                                        <c:choose>
                                            <c:when test="${not empty p.imageUrl}">
                                                <img src="${p.imageUrl}" class="product-img" alt="${p.name}"
                                                     onerror="this.src='https://via.placeholder.com/300x240/fdf2f8/9d174d?text=Hoa+Tươi'">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="bg-light d-flex align-items-center justify-content-center product-img">
                                                    <i class="bi bi-flower2 fs-1" style="color: #f9a8d4;"></i>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="product-category">
                                            ${p.categoryName}
                                        </div>
                                    </div>
                                    <!-- Thông tin -->
                                    <div class="product-info">
                                        <h3 class="product-name">${p.name}</h3>
                                        <div class="shop-info">
                                            <i class="bi bi-shop me-1"></i> ${p.shopName}
                                        </div>
                                        <div class="price">
                                            <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₫"/>
                                        </div>
                                        <p class="stock">
                                            <i class="bi bi-check-circle-fill me-1"></i>
                                            In stock: ${p.stockQuantity} bouquets
                                        </p>
                                        <button class="btn-add w-100 d-flex align-items-center justify-content-center"
                                                onclick="addToCart(${p.productId}, this)"
                                                ${p.stockQuantity == 0 ? 'disabled' : ''}>
                                            <i class="bi bi-cart-plus me-2"></i>
                                            <c:choose>
                                                <c:when test="${p.stockQuantity == 0}">Out of Stock</c:when>
                                                <c:otherwise>Add to Cart</c:otherwise>
                                            </c:choose>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <i class="bi bi-flower2"></i>
                        <h3>No products available</h3>
                        <p class="text-muted">Please check back later or contact the shop to update the list of fresh flowers.</p>
                        <a href="${pageContext.request.contextPath}/product-list" class="btn btn-outline-primary mt-3 px-4 py-2" style="border-color: #be185d; color: #be185d;">
                            <i class="bi bi-arrow-clockwise me-2"></i>Refresh Page
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Toast thông báo -->
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

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                                    // Toast
                                                    const toastEl = document.getElementById('cartToast');
                                                    const toast = new bootstrap.Toast(toastEl);
                                                    const toastMessage = document.getElementById('toastMessage');
                                                    const cartSizeEl = document.getElementById('cartSize');
                                                    const cartBadgeEl = document.getElementById('cartBadge');

                                                    function addToCart(productId, button) {
                                                        if (button.disabled)
                                                            return;

                                                        // Disable button
                                                        button.disabled = true;
                                                        const originalText = button.innerHTML;
                                                        button.innerHTML = '<i class="bi bi-hourglass-split me-2"></i>Đang thêm...';

                                                        fetch('${pageContext.request.contextPath}/add-to-cart', {
                                                            method: 'POST',
                                                            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                                                            body: 'productId=' + productId + '&quantity=1'
                                                        })
                                                                .then(response => {
                                                                    if (!response.ok)
                                                                        throw new Error('Network error');
                                                                    return response.json();
                                                                })
                                                                .then(data => {
                                                                    if (data.success) {
                                                                        toastMessage.innerHTML = data.productName + ' đã thêm vào giỏ!';
                                                                        toast.show();

                                                                        // Update cart size dynamically
                                                                        cartSizeEl.textContent = data.cartSize;
                                                                        if (data.cartSize > 0) {
                                                                            if (!cartBadgeEl) {
                                                                                const badge = document.createElement('span');
                                                                                badge.id = 'cartBadge';
                                                                                badge.className = 'cart-badge ms-2';
                                                                                badge.textContent = data.cartSize;
                                                                                cartSizeEl.parentElement.appendChild(badge);
                                                                            } else {
                                                                                cartBadgeEl.textContent = data.cartSize;
                                                                            }
                                                                        } else if (cartBadgeEl) {
                                                                            cartBadgeEl.remove();
                                                                        }

                                                                        // Thêm hiệu ứng cho nút
                                                                        button.innerHTML = '<i class="bi bi-check-lg me-2"></i>Đã thêm';
                                                                        setTimeout(() => {
                                                                            button.innerHTML = originalText;
                                                                        }, 1500);
                                                                    } else {
                                                                        alert(data.message || 'Không thể thêm vào giỏ');
                                                                        button.innerHTML = originalText;
                                                                    }
                                                                })
                                                                .catch(err => {
                                                                    console.error('Lỗi fetch:', err);
                                                                    alert('Lỗi kết nối. Vui lòng thử lại!');
                                                                    button.innerHTML = originalText;
                                                                })
                                                                .finally(() => {
                                                                    button.disabled = false;
                                                                });
                                                    }

                                                    // Auto hide toast after 3s
                                                    toastEl.addEventListener('shown.bs.toast', () => {
                                                        setTimeout(() => toast.hide(), 3000);
                                                    });
        </script>
    </body>
</html>
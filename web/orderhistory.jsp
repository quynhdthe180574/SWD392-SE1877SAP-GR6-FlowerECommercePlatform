<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Order History - Flower Shop</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">

        <style>
            :root {
                --primary-color: #ea4c89;
                --secondary-color: #f093fb;
                --success-color: #28a745;
                --info-color: #17a2b8;
                --warning-color: #ffc107;
                --danger-color: #dc3545;
                --dark-color: #343a40;
                --light-color: #f8f9fa;
            }

            body {
                font-family: 'Nunito', sans-serif;
                background-color: #f5f5f5;
                color: #333;
            }

            .navbar {
                background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            .navbar-brand {
                font-weight: 800;
                font-size: 1.5rem;
                color: white !important;
            }

            .page-header {
                background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                color: white;
                padding: 3rem 0;
                margin-bottom: 2rem;
            }

            .page-header h1 {
                font-weight: 700;
                margin-bottom: 0.5rem;
            }

            .breadcrumb {
                background: transparent;
                margin-bottom: 0;
                padding: 0;
            }

            .breadcrumb-item a {
                color: rgba(255,255,255,0.8);
                text-decoration: none;
            }

            .breadcrumb-item.active {
                color: white;
            }

            .order-card {
                background: white;
                border-radius: 12px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.08);
                margin-bottom: 1.5rem;
                overflow: hidden;
                transition: all 0.3s ease;
            }

            .order-card:hover {
                box-shadow: 0 5px 20px rgba(0,0,0,0.12);
                transform: translateY(-2px);
            }

            .order-header {
                background: #f8f9fa;
                padding: 1.25rem 1.5rem;
                border-bottom: 1px solid #e9ecef;
            }

            .order-header .order-number {
                font-size: 1.1rem;
                font-weight: 700;
                color: var(--dark-color);
                margin-bottom: 0.25rem;
            }

            .order-header .order-date {
                color: #6c757d;
                font-size: 0.9rem;
            }

            .order-body {
                padding: 1.5rem;
            }

            .order-info {
                display: flex;
                flex-wrap: wrap;
                gap: 1.5rem;
                margin-bottom: 1rem;
            }

            .info-item {
                flex: 1;
                min-width: 150px;
            }

            .info-label {
                font-size: 0.85rem;
                color: #6c757d;
                margin-bottom: 0.25rem;
                text-transform: uppercase;
                font-weight: 600;
                letter-spacing: 0.5px;
            }

            .info-value {
                font-size: 1rem;
                font-weight: 600;
                color: var(--dark-color);
            }

            .order-total {
                font-size: 1.3rem;
                color: var(--primary-color);
            }

            .badge-status {
                padding: 0.5rem 1rem;
                border-radius: 20px;
                font-weight: 600;
                font-size: 0.85rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .status-pending {
                background-color: #fff3cd;
                color: #856404;
            }

            .status-processing {
                background-color: #cfe2ff;
                color: #084298;
            }

            .status-shipping {
                background-color: #d1e7dd;
                color: #0a3622;
            }

            .status-delivered {
                background-color: #d1e7dd;
                color: #0f5132;
            }

            .status-cancelled {
                background-color: #f8d7da;
                color: #842029;
            }

            .order-items {
                margin-top: 1rem;
            }

            .item-row {
                display: flex;
                align-items: center;
                padding: 1rem;
                background: #f8f9fa;
                border-radius: 8px;
                margin-bottom: 0.75rem;
            }

            .item-image {
                width: 70px;
                height: 70px;
                border-radius: 8px;
                object-fit: cover;
                margin-right: 1rem;
            }

            .item-details {
                flex: 1;
            }

            .item-name {
                font-weight: 600;
                color: var(--dark-color);
                margin-bottom: 0.25rem;
            }

            .item-quantity {
                color: #6c757d;
                font-size: 0.9rem;
            }

            .item-price {
                font-weight: 700;
                color: var(--primary-color);
                font-size: 1.1rem;
            }

            .order-actions {
                display: flex;
                gap: 0.75rem;
                margin-top: 1rem;
                padding-top: 1rem;
                border-top: 1px solid #e9ecef;
            }

            .btn-custom {
                border-radius: 8px;
                padding: 0.5rem 1.25rem;
                font-weight: 600;
                transition: all 0.3s ease;
            }

            .btn-primary-custom {
                background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                border: none;
                color: white;
            }

            .btn-primary-custom:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(234, 76, 137, 0.4);
            }

            .btn-outline-custom {
                border: 2px solid var(--primary-color);
                color: var(--primary-color);
                background: white;
            }

            .btn-outline-custom:hover {
                background: var(--primary-color);
                color: white;
            }

            .delivery-tracking {
                background: #f8f9fa;
                padding: 1.5rem;
                border-radius: 8px;
                margin-top: 1rem;
            }

            .tracking-title {
                font-weight: 700;
                margin-bottom: 1rem;
                color: var(--dark-color);
            }

            .tracking-steps {
                position: relative;
                padding-left: 2rem;
            }

            .tracking-step {
                position: relative;
                padding-bottom: 2rem;
            }

            .tracking-step:last-child {
                padding-bottom: 0;
            }

            .tracking-step::before {
                content: '';
                position: absolute;
                left: -1.5rem;
                top: 0;
                width: 12px;
                height: 12px;
                border-radius: 50%;
                background: var(--primary-color);
                border: 3px solid white;
                box-shadow: 0 0 0 2px var(--primary-color);
            }

            .tracking-step::after {
                content: '';
                position: absolute;
                left: -1.45rem;
                top: 12px;
                width: 2px;
                height: calc(100% - 12px);
                background: #dee2e6;
            }

            .tracking-step:last-child::after {
                display: none;
            }

            .tracking-step.completed::before {
                background: var(--success-color);
                box-shadow: 0 0 0 2px var(--success-color);
            }

            .tracking-step.active::before {
                background: var(--primary-color);
                box-shadow: 0 0 0 2px var(--primary-color);
                animation: pulse 2s infinite;
            }

            @keyframes pulse {
                0%, 100% {
                    box-shadow: 0 0 0 2px var(--primary-color);
                }
                50% {
                    box-shadow: 0 0 0 6px rgba(234, 76, 137, 0.3);
                }
            }

            .tracking-step-label {
                font-weight: 600;
                color: var(--dark-color);
            }

            .tracking-step-date {
                font-size: 0.85rem;
                color: #6c757d;
            }

            .empty-state {
                text-align: center;
                padding: 4rem 2rem;
                background: white;
                border-radius: 12px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            }

            .empty-state i {
                font-size: 5rem;
                color: #dee2e6;
                margin-bottom: 1.5rem;
            }

            .empty-state h3 {
                font-weight: 700;
                margin-bottom: 1rem;
            }

            .empty-state p {
                color: #6c757d;
                margin-bottom: 2rem;
            }

            .filter-section {
                background: white;
                padding: 1.5rem;
                border-radius: 12px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.08);
                margin-bottom: 2rem;
            }

            .modal-header {
                background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                color: white;
            }

            .modal-header .btn-close {
                filter: brightness(0) invert(1);
            }

            @media (max-width: 768px) {
                .order-info {
                    flex-direction: column;
                }

                .item-row {
                    flex-direction: column;
                    text-align: center;
                }

                .item-image {
                    margin: 0 0 1rem 0;
                }

                .order-actions {
                    flex-direction: column;
                }

                .btn-custom {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                    <i class="bi bi-flower1"></i> Flower Shop
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/shop">Shop</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="${pageContext.request.contextPath}/orders">My Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/profile">Profile</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Page Header -->
        <div class="page-header">
            <div class="container">
                <h1><i class="bi bi-bag-check"></i> Order History</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Order History</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Main Content -->
        <div class="container pb-5">
            <!-- Filter Section -->
            <div class="filter-section">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <div class="row g-3">
                            <!-- Status -->
                            <div class="col-md-4">
                                <select class="form-select" id="statusFilter">
                                    <option value="">All Status</option>
                                    <option value="Pending"    ${param.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                    <option value="Processing" ${param.status == 'Processing' ? 'selected' : ''}>Processing</option>
                                    <option value="Shipping"   ${param.status == 'Shipping' ? 'selected' : ''}>Shipping</option>
                                    <option value="Delivered"  ${param.status == 'Delivered' ? 'selected' : ''}>Delivered</option>
                                    <option value="Cancelled"  ${param.status == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                                </select>
                            </div>

                            <!-- From Date -->
                            <div class="col-md-4">
                                <input type="date"
                                       class="form-control"
                                       id="dateFrom"
                                       value="${param.dateFrom}">
                            </div>

                            <!-- To Date -->
                            <div class="col-md-4">
                                <input type="date"
                                       class="form-control"
                                       id="dateTo"
                                       value="${param.dateTo}">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 text-end mt-3 mt-md-0">
                        <button class="btn btn-primary-custom btn-custom" onclick="applyFilters()">
                            <i class="bi bi-funnel"></i> Apply Filters
                        </button>
                    </div>
                </div>
            </div>


            <!-- Orders List -->
            <div id="ordersList">
                <!-- Check if orderItems exists and is not empty -->
                <c:if test="${not empty orderItems}">
                    <c:forEach var="item" items="${orderItems}">
                        <div class="order-card">
                            <div class="order-header">
                                <div class="d-flex justify-content-between align-items-center flex-wrap">
                                    <!-- Tên shop bên trái -->
                                    <div class="d-flex align-items-center">
                                        <i class="bi bi-shop me-2"></i>
                                        <span class="order-number mb-0">${item.shopName}</span>
                                    </div>

                                    <!-- Thời gian + trạng thái bên phải -->
                                    <div class="text-end">
                                        <div class="order-date">
                                            <fmt:formatDate value="${item.dateOrder}" pattern="dd/MM/yyyy" />
                                        </div>
                                        <span class="badge-status
                                              <c:choose>
                                                  <c:when test="${item.status == 'Pending'}"> status-pending</c:when>
                                                  <c:when test="${item.status == 'Processing'}"> status-processing</c:when>
                                                  <c:when test="${item.status == 'Shipping'}"> status-shipping</c:when>
                                                  <c:when test="${item.status == 'Delivered'}"> status-delivered</c:when>
                                                  <c:when test="${item.status == 'Cancelled'}"> status-cancelled</c:when>
                                                  <c:otherwise> status-pending</c:otherwise>
                                              </c:choose>
                                              ">
                                            ${item.status}
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="order-body">
                                <!-- Order Item -->
                                <div class="item-row">
                                    <img src="${item.imageUrl != null ? item.imageUrl : 'https://via.placeholder.com/70x70/ea4c89/ffffff?text=Flower'}" 
                                         alt="${item.productName}" 
                                         class="item-image"
                                         onerror="this.src='https://via.placeholder.com/70x70/ea4c89/ffffff?text=Flower'">
                                    <div class="item-details">
                                        <div class="item-name">${item.productName}</div>
                                        <div class="item-quantity">x ${item.quantity}</div>
                                    </div>
                                    <div class="item-price">
                                        <fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                    </div>
                                </div>

                                <!-- Order Total -->
                                <div class="order-info" style="border-top: 1px solid #e9ecef; padding-top: 1rem; margin-top: 1rem;">
                                    <div class="info-item" style="text-align: right; width: 100%;">
                                        <div class="info-label">Thành tiền</div>
                                        <div class="info-value order-total">
                                            <fmt:formatNumber value="${item.totalPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                        </div>
                                    </div>
                                </div>

                                <!-- Order Actions -->
                                <div class="order-actions">
                                    <c:choose>
                                        <c:when test="${item.status == 'Delivered'}">
                                            <button class="btn btn-outline-custom btn-custom" onclick="reorder('${item.productName}')">
                                                Mua Lại
                                            </button>
                                        </c:when>

                                        <c:when test="${item.status == 'Shipping'}">
                                            <button class="btn btn-primary-custom btn-custom" onclick="trackOrder('${item.productName}')">
                                                Đánh Giá
                                            </button>
                                        </c:when>

                                        <c:otherwise>
                                            <!-- Các trạng thái khác không hiển thị Liên hệ / Xem chi tiết theo yêu cầu -->
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                            </div>
                        </div>
                    </c:forEach>
                </c:if>

                <!-- Empty State (Show when no orders) -->
                <c:if test="${empty orderItems}">
                    <div class="empty-state">
                        <i class="bi bi-cart-x"></i>
                        <h3>Chưa có đơn hàng</h3>
                        <p>Bạn chưa có đơn hàng nào. Hãy bắt đầu mua sắm ngay!</p>
                        <a href="${pageContext.request.contextPath}/shop" class="btn btn-primary-custom btn-custom">
                            <i class="bi bi-shop"></i> Mua Sắm Ngay
                        </a>
                    </div>
                </c:if>
            </div>

            <!-- Pagination -->
<!--            <nav aria-label="Order pagination" class="mt-4">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>-->
        </div>

        <!-- Order Details Modal -->
        <div class="modal fade" id="orderDetailsModal" tabindex="-1" aria-labelledby="orderDetailsModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="orderDetailsModalLabel">
                            <i class="bi bi-receipt"></i> Order Details
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Order details content will be loaded here dynamically -->
                        <div id="modalOrderDetails">
                            <div class="text-center py-5">
                                <div class="spinner-border text-primary" role="status">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary-custom">Download Invoice</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="bg-dark text-white py-4 mt-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 mb-3 mb-md-0">
                        <h5><i class="bi bi-flower1"></i> Flower Shop</h5>
                        <p class="mb-0">Beautiful flowers for every occasion</p>
                    </div>
                    <div class="col-md-4 mb-3 mb-md-0">
                        <h6>Quick Links</h6>
                        <ul class="list-unstyled">
                            <li><a href="#" class="text-white-50 text-decoration-none">About Us</a></li>
                            <li><a href="#" class="text-white-50 text-decoration-none">Contact</a></li>
                            <li><a href="#" class="text-white-50 text-decoration-none">FAQ</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h6>Contact Info</h6>
                        <p class="text-white-50 mb-1">
                            <i class="bi bi-telephone"></i> +84 123 456 789
                        </p>
                        <p class="text-white-50 mb-1">
                            <i class="bi bi-envelope"></i> info@flowershop.com
                        </p>
                    </div>
                </div>
                <hr class="bg-white">
                <div class="text-center">
                    <small>&copy; 2025 Flower Shop. All rights reserved.</small>
                </div>
            </div>
        </footer>

        <!-- Bootstrap 5 JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                                                // View order details
                                                function viewOrderDetails(productName) {
                                                    const modal = new bootstrap.Modal(document.getElementById('orderDetailsModal'));
                                                    modal.show();

                                                    document.getElementById('modalOrderDetails').innerHTML = `
                    <div class="text-center py-3">
                        <h6>Chi tiết đơn hàng: ${productName}</h6>
                        <p class="text-muted">Đang phát triển tính năng này...</p>
                    </div>
                `;
                                                }

                                                // Track order / Rate product
                                                function trackOrder(productName) {
                                                    alert('Đánh giá sản phẩm: ' + productName);
                                                    // TODO: Implement rating functionality
                                                }

                                                // Contact shop
                                                function contactShop(shopName) {
                                                    alert('Liên hệ với: ' + shopName);
                                                    // TODO: Implement contact shop functionality
                                                }

                                                // Reorder
                                                function reorder(productName) {
                                                    if (confirm('Bạn có muốn mua lại sản phẩm "' + productName + '" không?')) {
                                                        alert('Đã thêm vào giỏ hàng!');
                                                        // TODO: Implement reorder functionality
                                                    }
                                                }

                                                // Apply filters

                                                function applyFilters() {
                                                    var status = document.getElementById('statusFilter').value;
                                                    var dateFrom = document.getElementById('dateFrom').value;
                                                    var dateTo = document.getElementById('dateTo').value;

                                                    var params = [];

                                                    if (status) {
                                                        params.push('status=' + encodeURIComponent(status));
                                                    }
                                                    if (dateFrom) {
                                                        params.push('dateFrom=' + encodeURIComponent(dateFrom));
                                                    }
                                                    if (dateTo) {
                                                        params.push('dateTo=' + encodeURIComponent(dateTo));
                                                    }

                                                    var baseUrl = '<c:out value="${pageContext.request.contextPath}"/>/history';
                                                    var queryString = params.length > 0 ? '?' + params.join('&') : '';

                                                    window.location.href = baseUrl + queryString;
                                                }



                                                // Smooth scroll
                                                document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                                                    anchor.addEventListener('click', function (e) {
                                                        e.preventDefault();
                                                        const target = document.querySelector(this.getAttribute('href'));
                                                        if (target) {
                                                            target.scrollIntoView({behavior: 'smooth'});
                                                        }
                                                    });
                                                });

                                                // Auto-hide alerts after 3 seconds
                                                document.addEventListener('DOMContentLoaded', function () {
                                                    const alerts = document.querySelectorAll('.alert');
                                                    alerts.forEach(alert => {
                                                        setTimeout(() => {
                                                            alert.style.opacity = '0';
                                                            setTimeout(() => alert.remove(), 300);
                                                        }, 3000);
                                                    });
                                                });
        </script>
    </body>
</html>
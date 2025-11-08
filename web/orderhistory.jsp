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
                --primary-color: #be185d;
                --secondary-color: #831843;
                --accent-color: #fdf2f8;
                --primary-dark: #9d174d;
                --success-color: #d1f7d8;
                --info-color: #d1ecf1;
                --warning-color: #fff3cd;
                --danger-color: #f8d7da;
                --dark-color: #6B5B5B;
                --light-color: #FFF5F7;
                --bg-pink: #fdf2f8;
            }

            body {
                font-family: 'Nunito', sans-serif;
                background-color: #FFFFFF;
                color: #6B5B5B;
                min-height: 100vh;
            }

            .navbar {
                background: linear-gradient(45deg, #be185d, #9d174d);
                box-shadow: 0 2px 15px rgba(190, 24, 93, 0.3);
            }

            .navbar-brand {
                font-weight: 800;
                font-size: 1.5rem;
                color: white !important;
                text-shadow: 0 2px 4px rgba(0,0,0,0.2);
            }

            .page-header {
                background: linear-gradient(45deg, #be185d, #9d174d);
                color: white;
                padding: 3rem 0;
                margin-bottom: 2rem;
                box-shadow: 0 4px 20px rgba(190, 24, 93, 0.2);
            }

            .page-header h1 {
                font-weight: 700;
                margin-bottom: 0.5rem;
                color: white;
            }

            .breadcrumb {
                background: transparent;
                margin-bottom: 0;
                padding: 0;
            }

            .breadcrumb-item a {
                color: rgba(255, 255, 255, 0.8);
                text-decoration: none;
            }

            .breadcrumb-item.active {
                color: white;
            }

            .order-card {
                background: white;
                border-radius: 16px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
                margin-bottom: 1.5rem;
                overflow: hidden;
                transition: all 0.3s ease;
                border: 1px solid #E0E0E0;
            }

            .order-card:hover {
                box-shadow: 0 4px 16px rgba(0, 0, 0, 0.12);
                transform: translateY(-3px);
                border-color: var(--primary-color);
            }

            .order-header {
                background: var(--accent-color);
                padding: 1.25rem 1.5rem;
                border-bottom: 2px solid #E9ECEF;
            }

            .order-header .order-number {
                font-size: 1.1rem;
                font-weight: 700;
                color: var(--secondary-color);
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
                font-weight: 700;
            }

            .badge-status {
                padding: 0.5rem 1rem;
                border-radius: 25px;
                font-weight: 600;
                font-size: 0.85rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            }

            .status-pending {
                background: linear-gradient(135deg, #FFE5B4 0%, #FFD9A0 100%);
                color: #A0826D;
            }

            .status-processing {
                background: linear-gradient(135deg, #C5E3F6 0%, #B3D9F2 100%);
                color: #5C8AA6;
            }

            .status-shipping {
                background: linear-gradient(135deg, #B8E6D5 0%, #A0D9C4 100%);
                color: #4A9B7F;
            }

            .status-delivered {
                background: linear-gradient(135deg, #B8E6D5 0%, #9FDFBB 100%);
                color: #3D8B64;
            }

            .status-cancelled {
                background: linear-gradient(135deg, #FFB4B4 0%, #FFA0A0 100%);
                color: #B85C5C;
            }

            .status-returned {
                background: linear-gradient(135deg, #E5CCFF 0%, #D4B8F7 100%);
                color: #8B5FA8;
            }

            .item-row {
                display: flex;
                align-items: center;
                padding: 1.2rem;
                background: var(--accent-color);
                border-radius: 12px;
                margin-bottom: 0.75rem;
                border: 1px solid #E9ECEF;
                transition: all 0.3s ease;
            }

            .item-row:hover {
                background: #fce8f3;
                border-color: var(--primary-color);
                transform: translateX(5px);
            }

            .item-image {
                width: 70px;
                height: 70px;
                border-radius: 12px;
                object-fit: cover;
                margin-right: 1rem;
                border: 2px solid #E9ECEF;
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
                color: #9B8B8B;
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
                border-top: 2px solid #E9ECEF;
            }

            .btn-custom {
                border-radius: 25px;
                padding: 0.6rem 1.5rem;
                font-weight: 600;
                transition: all 0.3s ease;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            }

            .btn-primary-custom {
                background: linear-gradient(45deg, #be185d, #9d174d);
                border: none;
                color: white;
            }

            .btn-primary-custom:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 15px rgba(190, 24, 93, 0.4);
                background: #9d174d;
            }

            .btn-outline-custom {
                border: 2px solid var(--primary-color);
                color: var(--primary-color);
                background: white;
            }

            .btn-outline-custom:hover {
                background: var(--primary-color);
                color: white;
                border-color: var(--primary-color);
                transform: translateY(-2px);
            }

            .empty-state {
                text-align: center;
                padding: 4rem 2rem;
                background: white;
                border-radius: 16px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
                border: 1px solid #E9ECEF;
            }

            .empty-state i {
                font-size: 5rem;
                color: #DEE2E6;
                margin-bottom: 1.5rem;
            }

            .empty-state h3 {
                font-weight: 700;
                margin-bottom: 1rem;
                color: var(--dark-color);
            }

            .empty-state p {
                color: #9B8B8B;
                margin-bottom: 2rem;
            }

            .status-tabs-container {
                background: white;
                border-radius: 16px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
                overflow: hidden;
                margin-bottom: 0.75rem;
                border: 1px solid #E9ECEF;
            }

            .status-tabs {
                border-bottom: 3px solid #E9ECEF;
                padding: 0;
                margin: 0;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                width: 100%;
            }

            .status-tabs .nav-item {
                flex: 1 1 auto;
                margin: 0;
                min-width: 120px;
            }

            .status-tabs .nav-link {
                color: #6C757D;
                font-weight: 600;
                padding: 1rem 0.75rem;
                border: none;
                background: transparent;
                border-bottom: 3px solid transparent;
                transition: all 0.3s ease;
                white-space: nowrap;
                cursor: pointer;
                width: 100%;
                text-align: center;
            }

            .status-tabs .nav-link:hover {
                color: var(--primary-color);
                background: var(--accent-color);
            }

            .status-tabs .nav-link.active {
                color: white;
                background: linear-gradient(45deg, #be185d, #9d174d);
                border-bottom-color: transparent;
                font-weight: 700;
            }

            .status-tabs .nav-link.active:hover {
                background: #9d174d;
            }

            .modal-header {
                background: linear-gradient(45deg, #be185d, #9d174d);
                color: white;
            }

            .modal-header .btn-close {
                filter: brightness(0) invert(1);
            }

            @media (max-width: 768px) {
                .order-info, .order-actions { flex-direction: column; }
                .item-row { flex-direction: column; text-align: center; }
                .item-image { margin: 0 0 1rem 0; }
                .btn-custom { width: 100%; }
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
                            <a class="nav-link" href="${pageContext.request.contextPath}/homepage">Home</a>
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
            <!-- Status Tabs -->
            <div class="status-tabs-container mb-3">
                <ul class="nav nav-tabs status-tabs" id="statusTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link ${empty param.status ? 'active' : ''}"
                                onclick="filterByStatus('')" type="button">
                            All Status
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link ${param.status == 'Pending' ? 'active' : ''}"
                                onclick="filterByStatus('Pending')" type="button">
                            Pending
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link ${param.status == 'Processing' ? 'active' : ''}"
                                onclick="filterByStatus('Processing')" type="button">
                            Processing
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link ${param.status == 'Shipping' ? 'active' : ''}"
                                onclick="filterByStatus('Shipping')" type="button">
                            Shipping
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link ${param.status == 'Delivered' ? 'active' : ''}"
                                onclick="filterByStatus('Delivered')" type="button">
                            Delivered
                        </button>
                    </li>
                </ul>
            </div>

            <!-- Orders List -->
            <div id="ordersList">
                <c:if test="${not empty orderItems}">
                    <c:forEach var="item" items="${orderItems}">
                        <div class="order-card">
                            <div class="order-header">
                                <div class="d-flex justify-content-between align-items-center flex-wrap">
                                    <div class="d-flex align-items-center">
                                        <i class="bi bi-shop me-2"></i>
                                        <span class="order-number mb-0">${item.shopName}</span>
                                    </div>
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
                                <div class="item-row">
                                    <img src="${item.imageUrl != null ? item.imageUrl : 'https://via.placeholder.com/70x70/fdf2f8/9d174d?text=Flower'}"
                                         alt="${item.productName}" class="item-image"
                                         onerror="this.src='https://via.placeholder.com/70x70/fdf2f8/9d174d?text=Flower'">
                                    <div class="item-details">
                                        <div class="item-name">${item.productName}</div>
                                        <div class="item-quantity">x ${item.quantity}</div>
                                    </div>
                                    <div class="item-price">
                                        <fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                    </div>
                                </div>

                                <div class="order-info" style="border-top: 1px solid #e9ecef; padding-top: 1rem; margin-top: 1rem;">
                                    <div class="info-item" style="text-align: right; width: 100%;">
                                        <div class="info-label">Total Amount</div>
                                        <div class="info-value order-total">
                                            <fmt:formatNumber value="${item.totalPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="order-actions">
                                    <c:choose>
                                        <c:when test="${item.status == 'Delivered'}">
                                            <button class="btn btn-outline-custom btn-custom" onclick="reorder('${item.productName}')">
                                                Buy Again
                                            </button>
                                        </c:when>
                                        <c:when test="${item.status == 'Shipping'}">
                                            <button class="btn btn-primary-custom btn-custom" onclick="trackOrder('${item.productName}')">
                                                Rate Product
                                            </button>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>

                <!-- Empty State -->
                <c:if test="${empty orderItems}">
                    <div class="empty-state">
                        <i class="bi bi-cart-x"></i>
                        <h3>No Orders Yet</h3>
                        <p>You haven't placed any orders. Start shopping now!</p>
                        <a href="${pageContext.request.contextPath}/shop" class="btn btn-primary-custom btn-custom">
                            <i class="bi bi-shop"></i> Shop Now
                        </a>
                    </div>
                </c:if>
            </div>
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
                    <small>© 2025 Flower Shop. All rights reserved.</small>
                </div>
            </div>
        </footer>

        <!-- Bootstrap 5 JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            function filterByStatus(status) {
                const baseUrl = '<c:out value="${pageContext.request.contextPath}"/>/history';
                window.location.href = status ? baseUrl + '?status=' + encodeURIComponent(status) : baseUrl;
            }

            function trackOrder(productName) {
                alert('Rate product: ' + productName);
            }

            function reorder(productName) {
                if (confirm('Do you want to buy "' + productName + '" again?')) {
                    alert('Added to cart!');
                }
            }
        </script>
    </body>
</html>





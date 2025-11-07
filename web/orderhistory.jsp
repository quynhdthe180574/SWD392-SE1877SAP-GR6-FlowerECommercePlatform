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
                /* Pastel Pink Theme */
                --primary-color: #FFB6C1;      /* Light Pink - Màu hồng pastel chính */
                --secondary-color: #FFC0CB;    /* Pink - Hồng nhạt */
                --accent-color: #FFD4E5;       /* Baby Pink - Hồng baby */
                --primary-dark: #FF9EAF;       /* Dark Pink - Hồng đậm hơn */
                --success-color: #B8E6D5;      /* Pastel Green */
                --info-color: #C5E3F6;         /* Pastel Blue */
                --warning-color: #FFE5B4;      /* Pastel Yellow */
                --danger-color: #FFB4B4;       /* Pastel Red */
                --dark-color: #6B5B5B;         /* Soft Dark */
                --light-color: #FFF5F7;        /* Very Light Pink */
                --bg-pink: #FFF0F5;            /* Lavender Blush */
            }

            body {
                font-family: 'Nunito', sans-serif;
                background: linear-gradient(135deg, #FFF0F5 0%, #FFE4E9 100%);
                color: #6B5B5B;
                min-height: 100vh;
            }

            .navbar {
                background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                box-shadow: 0 2px 15px rgba(255, 182, 193, 0.3);
            }

            .navbar-brand {
                font-weight: 800;
                font-size: 1.5rem;
                color: white !important;
                text-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .page-header {
                background: linear-gradient(135deg, var(--primary-color) 0%, var(--accent-color) 100%);
                color: var(--dark-color);
                padding: 3rem 0;
                margin-bottom: 2rem;
                box-shadow: 0 4px 20px rgba(255, 182, 193, 0.2);
            }

            .page-header h1 {
                font-weight: 700;
                margin-bottom: 0.5rem;
                color: var(--dark-color);
            }

            .breadcrumb {
                background: transparent;
                margin-bottom: 0;
                padding: 0;
            }

            .breadcrumb-item a {
                color: rgba(107, 91, 91, 0.7);
                text-decoration: none;
            }

            .breadcrumb-item.active {
                color: var(--dark-color);
            }

            .order-card {
                background: white;
                border-radius: 16px;
                box-shadow: 0 4px 12px rgba(255, 182, 193, 0.15);
                margin-bottom: 1.5rem;
                overflow: hidden;
                transition: all 0.3s ease;
                border: 2px solid var(--accent-color);
            }

            .order-card:hover {
                box-shadow: 0 8px 25px rgba(255, 182, 193, 0.25);
                transform: translateY(-3px);
                border-color: var(--primary-color);
            }

            .order-header {
                background: linear-gradient(135deg, #FFF5F7 0%, #FFE4E9 100%);
                padding: 1.25rem 1.5rem;
                border-bottom: 2px solid var(--accent-color);
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
                color: var(--primary-dark);
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

            .order-items {
                margin-top: 1rem;
            }

            .item-row {
                display: flex;
                align-items: center;
                padding: 1.2rem;
                background: linear-gradient(135deg, #FFF5F7 0%, #FFFDFE 100%);
                border-radius: 12px;
                margin-bottom: 0.75rem;
                border: 1px solid var(--accent-color);
                transition: all 0.3s ease;
            }
            
            .item-row:hover {
                background: linear-gradient(135deg, #FFE4E9 0%, #FFF0F5 100%);
                border-color: var(--primary-color);
                transform: translateX(5px);
            }

            .item-image {
                width: 70px;
                height: 70px;
                border-radius: 12px;
                object-fit: cover;
                margin-right: 1rem;
                border: 2px solid var(--accent-color);
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
                color: var(--primary-dark);
                font-size: 1.1rem;
            }

            .order-actions {
                display: flex;
                gap: 0.75rem;
                margin-top: 1rem;
                padding-top: 1rem;
                border-top: 2px solid var(--accent-color);
            }

            .btn-custom {
                border-radius: 25px;
                padding: 0.6rem 1.5rem;
                font-weight: 600;
                transition: all 0.3s ease;
                box-shadow: 0 2px 8px rgba(255, 182, 193, 0.2);
            }

            .btn-primary-custom {
                background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                border: none;
                color: white;
            }

            .btn-primary-custom:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 15px rgba(255, 182, 193, 0.4);
                background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary-color) 100%);
            }

            .btn-outline-custom {
                border: 2px solid var(--primary-color);
                color: var(--primary-dark);
                background: white;
            }

            .btn-outline-custom:hover {
                background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                color: white;
                border-color: var(--primary-color);
                transform: translateY(-2px);
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
                border-radius: 16px;
                box-shadow: 0 4px 12px rgba(255, 182, 193, 0.15);
                border: 2px solid var(--accent-color);
            }

            .empty-state i {
                font-size: 5rem;
                color: var(--accent-color);
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

            .filter-section {
                background: white;
                padding: 1.5rem;
                border-radius: 16px;
                box-shadow: 0 4px 12px rgba(255, 182, 193, 0.15);
                margin-bottom: 2rem;
                border: 2px solid var(--accent-color);
            }
            
            /* Status Tabs Styling - FULL WIDTH */
            .status-tabs-container {
                background: white;
                border-radius: 16px;
                box-shadow: 0 4px 12px rgba(255, 182, 193, 0.15);
                overflow: hidden;
                margin-bottom: 0.75rem;
                border: 2px solid var(--accent-color);
            }
            
            .status-tabs {
                border-bottom: 3px solid var(--accent-color);
                padding: 0;
                margin: 0;
                display: flex;
                flex-wrap: wrap; /* Changed from nowrap to wrap */
                justify-content: space-between; /* Distribute evenly */
                width: 100%;
            }
            
            .status-tabs::-webkit-scrollbar {
                height: 3px;
            }
            
            .status-tabs::-webkit-scrollbar-track {
                background: var(--bg-pink);
            }
            
            .status-tabs::-webkit-scrollbar-thumb {
                background: var(--primary-color);
                border-radius: 10px;
            }
            
            .status-tabs .nav-item {
                flex: 1 1 auto; /* Changed to flex-grow to fill available space */
                margin: 0;
                min-width: 120px; /* Minimum width for readability */
            }
            
            .status-tabs .nav-link {
                color: #9B8B8B;
                font-weight: 600;
                padding: 1rem 0.75rem;
                border: none;
                background: transparent;
                border-bottom: 3px solid transparent;
                transition: all 0.3s ease;
                white-space: nowrap;
                cursor: pointer;
                width: 100%; /* Full width of nav-item */
                text-align: center;
            }
            
            .status-tabs .nav-link:hover {
                color: var(--primary-dark);
                background: linear-gradient(135deg, #FFF0F5 0%, #FFE4E9 100%);
            }
            
            .status-tabs .nav-link.active {
                color: var(--primary-dark);
                background: linear-gradient(135deg, var(--bg-pink) 0%, var(--accent-color) 100%);
                border-bottom-color: var(--primary-color);
                font-weight: 700;
            }
            
            .status-tabs .nav-link.active:hover {
                background: linear-gradient(135deg, var(--accent-color) 0%, var(--bg-pink) 100%);
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
            <!-- Status Tabs Navigation -->
            <div class="status-tabs-container mb-3">
                <ul class="nav nav-tabs status-tabs" id="statusTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link ${empty param.status ? 'active' : ''}" 
                                onclick="filterByStatus('')" 
                                type="button">
                            All Status
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link ${param.status == 'Pending' ? 'active' : ''}" 
                                onclick="filterByStatus('Pending')" 
                                type="button">
                            Pending
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link ${param.status == 'Processing' ? 'active' : ''}" 
                                onclick="filterByStatus('Delivered')" 
                                type="button">
                            Delivered
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link ${param.status == 'Shipping' ? 'active' : ''}" 
                                onclick="filterByStatus('Shipped')" 
                                type="button">
                            Shipped
                        </button>
                    </li>
                    
                </ul>
            </div>

            <!-- Date Filter Section -->
            <div class="filter-section">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <div class="row g-3">
                            <div class="col-md-4">
                                <label for="dateFrom" class="form-label small text-muted">Từ ngày</label>
                                <input type="date" 
                                       class="form-control" 
                                       id="dateFrom" 
                                       value="${param.dateFrom}"
                                       placeholder="Từ ngày">
                            </div>
                            <div class="col-md-4">
                                <label for="dateTo" class="form-label small text-muted">Đến ngày</label>
                                <input type="date" 
                                       class="form-control" 
                                       id="dateTo" 
                                       value="${param.dateTo}"
                                       placeholder="Đến ngày">
                            </div>
                            <div class="col-md-4 d-flex align-items-end">
                                <button class="btn btn-outline-secondary w-100" onclick="clearDateFilter()">
                                    <i class="bi bi-x-circle"></i> Xóa bộ lọc
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 text-end mt-3 mt-md-0">
                        <button class="btn btn-primary-custom btn-custom w-100" onclick="applyDateFilter()">
                            <i class="bi bi-funnel"></i> Áp dụng
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
            // Filter by status from navbar tabs
            function filterByStatus(status) {
                var dateFrom = document.getElementById('dateFrom').value;
                var dateTo = document.getElementById('dateTo').value;
                var baseUrl = '<c:out value="${pageContext.request.contextPath}"/>/history';
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
                
                var queryString = params.length > 0 ? '?' + params.join('&') : '';
                window.location.href = baseUrl + queryString;
            }
            
            // Apply date filter
            function applyDateFilter() {
                var status = '${param.status}' || '';
                var dateFrom = document.getElementById('dateFrom').value;
                var dateTo = document.getElementById('dateTo').value;
                var baseUrl = '<c:out value="${pageContext.request.contextPath}"/>/history';
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
                
                var queryString = params.length > 0 ? '?' + params.join('&') : '';
                window.location.href = baseUrl + queryString;
            }
            
            // Clear date filter
            function clearDateFilter() {
                var status = '${param.status}' || '';
                var baseUrl = '<c:out value="${pageContext.request.contextPath}"/>/history';
                
                if (status) {
                    window.location.href = baseUrl + '?status=' + encodeURIComponent(status);
                } else {
                    window.location.href = baseUrl;
                }
            }
            
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
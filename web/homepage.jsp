<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Flower System - Fresh Flowers Delivered</title>
    <meta name="description" content="Fresh flowers delivered with love. Handpicked blooms for birthdays, weddings, anniversaries, and more.">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #be185d;
            --primary-light: #fdf2f8;
            --secondary: #831843;
            --success: #27ae60;
            --light: #f8f9fa;
            --dark: #212529;
            --text: #4a4a4a;
            --border: rgba(251, 207, 232, 0.35);
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            background: #fff;
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            color: var(--text);
            line-height: 1.6;
        }
        h1, h2, h5, .navbar-brand { font-family: 'Playfair Display', serif; }

        /* HEADER - DÍNH CHẶT VỚI NAVBAR */
        .page-header {
            background: linear-gradient(45deg, #be185d, #9d174d);
            color: white;
            padding: 1.8rem 0;
            border-bottom: 5px solid #831843;
            box-shadow: 0 6px 16px rgba(190, 24, 93, 0.2);
            margin-bottom: 0 !important; /* XÓA KHOẢNG CÁCH */
        }
        .page-header h1 {
            font-weight: 700;
            letter-spacing: -0.8px;
            font-size: 2.5rem;
            margin: 0;
        }

        /* NAVBAR - DÍNH SÁT HEADER */
        .navbar {
            background: rgba(255, 255, 255, 0.97);
            backdrop-filter: blur(14px);
            box-shadow: 0 3px 18px rgba(190, 24, 93, 0.12);
            padding: 1.2rem 0;
            position: sticky;
            top: 0;
            z-index: 1030;
            border-bottom: 1px solid rgba(190, 24, 93, 0.1);
            margin-top: 0 !important; /* ĐẢM BẢO KHÔNG CÓ KHOẢNG CÁCH */
        }
        .navbar-brand {
            font-weight: 700;
            font-size: 2rem;
            color: var(--primary) !important;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .navbar-brand i {
            font-size: 1.8rem;
        }
        .nav-link {
            color: var(--dark) !important;
            font-weight: 600;
            font-size: 1.15rem;
            transition: all 0.3s ease;
            padding: 0.6rem 1.3rem !important;
            border-radius: 12px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .nav-link:hover, .nav-link.active {
            color: white !important;
            background: var(--primary);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(190, 24, 93, 0.25);
        }

        /* Buttons */
        .btn-login, .btn-signup, .cart-link {
            font-weight: 700;
            font-size: 1rem;
            border-radius: 14px;
            padding: 0.6rem 1.8rem;
            transition: all 0.3s ease;
        }
        .btn-login {
            background: transparent;
            color: var(--primary);
            border: 2px solid var(--primary);
        }
        .btn-login:hover {
            background: var(--primary);
            color: white;
            transform: translateY(-3px);
        }
        .btn-signup {
            background: linear-gradient(45deg, #be185d, #9d174d);
            color: white;
            border: none;
        }
        .btn-signup:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(190, 24, 93, 0.35);
        }
        .cart-link {
            color: white;
            background: rgba(255, 255, 255, 0.18);
            border: 1.5px solid rgba(255, 255, 255, 0.25);
        }
        .cart-link:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-3px);
        }
        .cart-badge {
            background: #ff4757;
            color: white;
            border-radius: 50%;
            width: 28px;
            height: 28px;
            font-size: 0.85rem;
            font-weight: bold;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-left: 0.6rem;
        }

        /* Hero */
        .hero {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
                        url('https://images.unsplash.com/photo-1563208440-8b79e3668f4f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=85') center/cover no-repeat;
            color: white;
            padding: 140px 0;
            text-align: center;
            border-radius: 0 0 35px 35px;
            margin-top: 0 !important;
        }
        .hero h1 { font-size: 4rem; margin-bottom: 1.2rem; }
        .hero p { font-size: 1.35rem; max-width: 800px; margin: 0 auto 1.8rem; }
        .btn-primary {
            background: linear-gradient(45deg, #be185d, #9d174d);
            color: white;
            border: none;
            border-radius: 14px;
            padding: 1rem 2.5rem;
            font-weight: 700;
            font-size: 1.2rem;
            box-shadow: 0 6px 18px rgba(190, 24, 93, 0.35);
        }
        .btn-primary:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 25px rgba(190, 24, 93, 0.45);
        }

        /* Section Title */
        .section-title {
            color: var(--secondary);
            font-weight: 700;
            font-size: 2.6rem;
            position: relative;
            display: inline-block;
            margin: 4rem 0 2rem;
        }
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -14px;
            left: 50%;
            transform: translateX(-50%);
            width: 90px;
            height: 5px;
            background: var(--primary);
            border-radius: 3px;
        }

        /* CATEGORY CARD */
        .category-modern-card {
            background: white;
            border-radius: 24px;
            padding: 2rem 1.2rem;
            transition: all 0.4s ease;
            box-shadow: 0 10px 30px rgba(190, 24, 93, 0.12);
            border: 1.5px solid rgba(190, 24, 93, 0.18);
            height: 100%;
            text-align: center;
        }
        .category-modern-card:hover {
            transform: translateY(-12px);
            box-shadow: 0 25px 50px rgba(190, 24, 93, 0.25);
            border-color: var(--primary);
        }
        .category-img-wrapper {
            width: 120px;
            height: 120px;
            overflow: hidden;
            border-radius: 50%;
            border: 5px solid var(--primary-light);
            box-shadow: 0 6px 18px rgba(190, 24, 93, 0.2);
            padding: 5px;
            background: white;
            margin: 0 auto 1rem;
        }
        .category-img-modern {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        .category-modern-card:hover .category-img-modern {
            transform: scale(1.18);
        }
        .category-name-modern {
            font-family: 'Playfair Display', serif;
            font-size: 1.25rem;
            color: var(--secondary);
            font-weight: 700;
            margin: 0.5rem 0;
        }

        /* PRODUCT CARD */
        .product-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 28px rgba(0,0,0,0.1);
            transition: all 0.4s ease;
            border: 1px solid var(--border);
        }
        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(190, 24, 93, 0.2);
            border-color: var(--primary);
        }
        .product-img {
            height: 220px;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        .product-card:hover .product-img { transform: scale(1.08); }
        .product-body { padding: 1.8rem; }
        .product-name { font-size: 1.2rem; font-weight: 700; margin-bottom: 0.6rem; }
        .product-price { color: var(--primary); font-weight: 700; font-size: 1.45rem; }

        /* Footer */
        .footer {
            background: var(--dark);
            color: #ddd;
            padding: 4rem 0 2rem;
            margin-top: 7rem;
        }
        .footer a { color: #ddd; text-decoration: none; font-weight: 500; }
        .footer a:hover { color: var(--primary); }

        /* Responsive */
        @media (max-width: 992px) {
            .navbar-brand { font-size: 1.8rem; }
            .nav-link { font-size: 1.05rem; }
        }
        @media (max-width: 768px) {
            .hero h1 { font-size: 3rem; }
            .hero p { font-size: 1.2rem; }
            .section-title { font-size: 2.2rem; }
            .category-img-wrapper { width: 100px; height: 100px; }
            .category-name-modern { font-size: 1.1rem; }
            .navbar-brand { font-size: 1.6rem; }
        }
    </style>
</head>
<body>

<!-- HEADER + NAVBAR DÍNH CHẶT -->
<div class="page-header">
    <div class="container">
        <div class="row align-items-center">
            <div class="col">
                <h1 class="d-flex align-items-center gap-3">
                    <i class="bi bi-flower1" style="font-size: 2.6rem;"></i>
                    <div>
                        <div>Flower System</div>
                        <small class="fs-6 opacity-75">Your trusted flower delivery service</small>
                    </div>
                </h1>
            </div>
            <div class="col-auto d-flex gap-3 align-items-center">
                <a href="${pageContext.request.contextPath}/login" class="btn btn-login">
                    <i class="bi bi-person me-1"></i> Login
                </a>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-signup">
                    <i class="bi bi-person-plus me-1"></i> Sign Up
                </a>
                <a href="${pageContext.request.contextPath}/view-cart" class="cart-link">
                    <i class="bi bi-cart3 me-2"></i>
                    <span>Cart</span>
                    <strong class="ms-2">${cartSize}</strong>
                    <c:if test="${cartSize > 0}">
                        <span class="cart-badge">${cartSize}</span>
                    </c:if>
                </a>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/homepage">
            <i class="bi bi-flower1"></i> Flower System
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center gap-2">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/homepage">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/product-list">Products</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/history">History</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/view-cart">
                    Cart (<span id="cartSizeNav">${cartSize}</span>)
                </a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container pb-5">
    <!-- Hero -->
    <section class="hero mb-5">
        <div class="container">
            <h1>Fresh Flowers, Delivered with Love</h1>
            <p>Handpicked blooms for every occasion – birthdays, anniversaries, or just because.</p>
            <a href="${pageContext.request.contextPath}/product-list" class="btn btn-primary btn-lg">
                Shop Now <i class="bi bi-arrow-right ms-2"></i>
            </a>
        </div>
    </section>

    <!-- Categories -->
    <section class="mb-5 py-5">
        <div class="container">
            <h2 class="section-title text-center">Shop by Category</h2>
            <c:choose>
                <c:when test="${not empty categories}">
                    <div class="row g-4 justify-content-center">
                        <c:forEach var="cat" items="${categories}">
                            <div class="col-6 col-md-4 col-lg-3 col-xl-2">
                                <a href="${pageContext.request.contextPath}/product-list?categoryId=${cat.categoryId}" class="text-decoration-none">
                                    <div class="category-modern-card">
                                        <div class="category-img-wrapper">
                                            <img src="
                                                <c:choose>
                                                    <c:when test="${cat.name == 'Rose'}">https://hoatuoi360.vn/uploads/file/bo-hong-do-99-bong.jpg</c:when>
                                                    <c:when test="${cat.name == 'White Rose'}">https://shophoatuoidep.net/assets/upload/page/ruZQA.jpg</c:when>
                                                    <c:when test="${cat.name == 'Orchid'}">https://flowercorner.b-cdn.net/image/cache/catalog/products/August%202023/bo-hoa-15-hong-trang-mix-cuc.jpg.webp</c:when>
                                                    <c:when test="${cat.name == 'Hydrangea'}">https://happyflower.vn/app/uploads/2022/02/CTC_XanhBlue_1B.jpg</c:when>
                                                    <c:when test="${cat.name == 'Lily of the Valley'}">https://flowersight.com/wp-content/uploads/2023/08/Bo-hoa-cau-tu-cau-long-lay-min.jpg</c:when>
                                                    <c:when test="${cat.name == 'Lily'}">https://th.bing.com/th/id/OIP.-tvUeR2Y_0xHsvOAEDfA7QHaH2</c:when>
                                                    <c:when test="${cat.name == 'Giant Crape Myrtle'}">https://vuonhoatuoi.vn/wp-content/uploads/2024/11/z6015956004487_e28fec1f2e9d76fc93a0f9c386e4aea2-jpg.webp</c:when>
                                                    <c:when test="${cat.name == 'Snow Plum Blossom'}">https://th.bing.com/th/id/OIP.SgNrLrokKDqShXVa1SXwmAHaJ4</c:when>
                                                    <c:when test="${cat.name == 'Apricot Blossom'}">https://tse3.mm.bing.net/th/id/OIP.gHofsSd49Ys4xz9TMdEzdQHaJ4</c:when>
                                                    <c:when test="${cat.name == 'Peach Blossom'}">https://tse1.mm.bing.net/th/id/OIP.01X-ckFW3YEtDRsxu-BLmgHaJ4</c:when>
                                                    <c:otherwise>https://via.placeholder.com/300x300/FDE7F3/831843?text=${cat.name}</c:otherwise>
                                                </c:choose>
                                            " class="category-img-modern rounded-circle" alt="${cat.name}">
                                        </div>
                                        <h6 class="category-name-modern">${cat.name}</h6>
                                        <p class="text-muted small mb-0">
                                            <span class="product-count text-primary fw-semibold" data-cat-id="${cat.categoryId}">0</span> products
                                        </p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <p class="text-center text-muted fs-5">No categories available at the moment.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </section>

    <!-- Featured Products -->
    <section class="bg-white py-5">
        <div class="container">
            <h2 class="section-title text-center">Featured Flowers</h2>
            <c:choose>
                <c:when test="${not empty featuredProducts && featuredProducts.size() > 0}">
                    <div class="row g-4">
                        <c:forEach var="p" items="${featuredProducts}" begin="0" end="7">
                            <div class="col-md-6 col-lg-3">
                                <div class="product-card h-100">
                                    <img src="${not empty p.imageUrl ? p.imageUrl : 'https://via.placeholder.com/300x220/fdf2f8/9d174d?text=No+Image'}"
                                         class="product-img w-100" alt="${p.name}" loading="lazy">
                                    <div class="product-body">
                                        <h6 class="product-name">${p.name}</h6>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <span class="product-price">
                                                <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₫"/>
                                            </span>
                                            <a href="${pageContext.request.contextPath}/product-detail?id=${p.productId}"
                                               class="btn btn-outline-primary btn-sm">
                                                <i class="bi bi-eye"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <p class="text-center text-muted">No featured products available at the moment.</p>
                </c:otherwise>
            </c:choose>
            <div class="text-center mt-5">
                <a href="${pageContext.request.contextPath}/product-list" class="btn btn-outline-primary btn-lg">
                    View All Products <i class="bi bi-arrow-right ms-2"></i>
                </a>
            </div>
        </div>
    </section>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4">
                <h5 class="text-white mb-3"><i class="bi bi-flower1"></i> Flower System</h5>
                <p>Fresh flowers delivered with care. Making every moment special since 2025.</p>
            </div>
            <div class="col-md-4 mb-4">
                <h5 class="text-white mb-3">Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">Shipping Info</a></li>
                </ul>
            </div>
            <div class="col-md-4 mb-4">
                <h5 class="text-white mb-3">Follow Us</h5>
                <div>
                    <a href="#" class="me-3"><i class="bi bi-facebook fs-5"></i></a>
                    <a href="#" class="me-3"><i class="bi bi-instagram fs-5"></i></a>
                    <a href="#" class="me-3"><i class="bi bi-twitter fs-5"></i></a>
                </div>
            </div>
        </div>
        <hr class="bg-light">
        <div class="text-center">
            <small>© 2025 Flower System. All rights reserved.</small>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const contextPath = '${pageContext.request.contextPath}' || '';
    document.addEventListener('DOMContentLoaded', () => {
        document.querySelectorAll('.product-count[data-cat-id]').forEach(el => {
            const catId = el.dataset.catId;
            if (!catId) { el.textContent = '0'; return; }
            fetch(contextPath + '/api/category-count?categoryId=' + catId, { cache: 'no-store' })
                .then(r => r.ok ? r.json() : Promise.reject())
                .then(data => el.textContent = data.count ?? 0)
                .catch(() => el.textContent = '0');
        });
    });
</script>
</body>
</html>
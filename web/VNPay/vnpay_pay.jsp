<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Complete Your Booking | GRAND MERCURE</title>
        <link rel="icon" href="image/logo_1.png" type="image/png">

        <style>
            :root {
                --soft-pink: #F9E1E0;
                --coral-pink: #FEADB9;
                --dusty-lavender: #BC85A3;
                --soft-purple: #9799BA;
                --deep-lavender: #8A6E9E;
                --light-gray: #f8f9fa;
                --dark-gray: #343a40;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: var(--light-gray);
                color: var(--dark-gray);
                line-height: 1.7;
                padding-top: 80px;
            }

            /* Header Styles */
            .main-header {
                background: white;
                box-shadow: 0 4px 30px rgba(0, 0, 0, 0.08);
                position: fixed;
                top: 0;
                width: 100%;
                z-index: 1000;
                padding: 12px 0;
                transition: all 0.3s ease;
            }

            .navbar-brand img {
                height: 45px;
                transition: all 0.3s;
            }

            .nav-item {
                margin: 0 5px;
            }

            .nav-link {
                color: var(--dusty-lavender) !important;
                font-weight: 500;
                padding: 12px 18px !important;
                position: relative;
                transition: all 0.3s;
                font-size: 0.95rem;
                letter-spacing: 0.3px;
            }

            .nav-link i {
                margin-right: 8px;
                font-size: 0.9rem;
            }

            .nav-hover {
                position: absolute;
                bottom: 8px;
                left: 18px;
                width: 0;
                height: 2px;
                background: var(--coral-pink);
                transition: width 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            }

            .nav-link:hover {
                color: var(--coral-pink) !important;
            }

            .nav-link:hover .nav-hover {
                width: calc(100% - 36px);
            }

            /* Main Content */
            .booking-container {
                max-width: 1000px;
                margin: 40px auto;
                background: white;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
                overflow: hidden;
            }

            .booking-header {
                background: linear-gradient(135deg, var(--dusty-lavender), var(--deep-lavender));
                color: white;
                padding: 25px 40px;
            }

            .booking-header h1 {
                font-weight: 600;
                margin: 0;
                font-size: 1.8rem;
            }

            .booking-header p {
                opacity: 0.9;
                margin: 5px 0 0;
            }

            .booking-body {
                padding: 40px;
            }

            /* Form Sections */
            .form-section {
                margin-bottom: 40px;
            }

            .section-title {
                color: var(--deep-lavender);
                font-weight: 600;
                margin-bottom: 25px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--soft-pink);
                display: flex;
                align-items: center;
            }

            .section-title i {
                margin-right: 12px;
                font-size: 1.2rem;
            }

            /* Room Info Card */
            .room-card {
                background: var(--soft-pink);
                border-radius: 10px;
                padding: 25px;
                margin-bottom: 30px;
                border-left: 4px solid var(--coral-pink);
                display: flex;
                flex-wrap: wrap;
            }

            .room-info-col {
                flex: 0 0 50%;
                margin-bottom: 15px;
            }

            .room-info-label {
                font-weight: 600;
                color: var(--dusty-lavender);
                display: block;
                margin-bottom: 5px;
                font-size: 0.9rem;
            }

            .room-info-value {
                color: var(--dark-gray);
                font-weight: 500;
            }

            /* Form Elements */
            .form-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 20px;
                margin-bottom: 25px;
            }

            .form-group {
                margin-bottom: 0;
            }

            label {
                display: block;
                margin-bottom: 8px;
                font-weight: 500;
                color: var(--dusty-lavender);
                font-size: 0.95rem;
            }

            input, select, textarea {
                width: 100%;
                padding: 12px 15px;
                border: 1px solid #e0e0e0;
                border-radius: 8px;
                font-size: 0.95rem;
                transition: all 0.3s;
                background-color: white;
            }

            input:focus, select:focus, textarea:focus {
                border-color: var(--coral-pink);
                box-shadow: 0 0 0 3px rgba(254, 173, 185, 0.2);
                outline: none;
            }

            /* Services Section */
            .services-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 15px;
            }

            .service-card {
                background: white;
                border: 1px solid #eee;
                border-radius: 8px;
                padding: 15px;
                transition: all 0.3s;
                display: flex;
                align-items: center;
            }

            .service-card:hover {
                border-color: var(--coral-pink);
                box-shadow: 0 5px 15px rgba(254, 173, 185, 0.1);
            }

            .service-checkbox {
                margin-right: 15px;
            }

            .service-details {
                flex: 1;
            }

            .service-name {
                font-weight: 500;
                margin-bottom: 3px;
            }

            .service-price {
                color: var(--deep-lavender);
                font-weight: 600;
                font-size: 0.9rem;
            }

            .service-quantity {
                width: 70px;
                margin-left: 15px;
                padding: 8px;
                display: none;
            }

            /* Promotions */
            .promotion-select {
                max-width: 400px;
            }

            /* Total Section */
            .total-section {
                background: var(--soft-pink);
                padding: 25px;
                border-radius: 10px;
                margin: 40px 0;
                text-align: right;
            }

            .total-label {
                font-size: 1rem;
                color: var(--dusty-lavender);
                margin-bottom: 5px;
            }

            .total-amount {
                font-size: 28px;
                font-weight: 700;
                color: var(--deep-lavender);
            }

            /* Action Buttons */
            .action-buttons {
                display: flex;
                justify-content: flex-end;
                gap: 15px;
                margin-top: 30px;
            }

            .btn {
                padding: 14px 32px;
                border-radius: 50px;
                font-weight: 500;
                transition: all 0.3s;
                border: none;
                font-size: 0.95rem;
                letter-spacing: 0.5px;
            }

            .btn-confirm {
                background: var(--coral-pink);
                color: white;
                box-shadow: 0 4px 15px rgba(254, 173, 185, 0.3);
            }

            .btn-confirm:hover {
                background: var(--dusty-lavender);
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(188, 133, 163, 0.4);
            }

            .btn-back {
                background: white;
                color: var(--deep-lavender);
                border: 1px solid var(--deep-lavender);
            }

            .btn-back:hover {
                background: var(--light-gray);
                color: var(--deep-lavender);
            }

            /* Responsive Adjustments */
            @media (max-width: 768px) {
                .booking-body {
                    padding: 30px;
                }

                .room-info-col {
                    flex: 0 0 100%;
                }

                .form-grid {
                    grid-template-columns: 1fr;
                }

                .services-grid {
                    grid-template-columns: 1fr;
                }

                .action-buttons {
                    flex-direction: column-reverse;
                }

                .btn {
                    width: 100%;
                }
            }
            /* User Profile Styles */
            .user-profile {
                display: flex;
                align-items: center;
                padding: 8px 12px;
                border-radius: 50px;
                transition: all 0.3s;
            }

            .user-profile:hover {
                background-color: rgba(249, 225, 224, 0.3);
            }

            .user-avatar {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                object-fit: cover;
                margin-right: 8px;
            }

            .user-name {
                color: var(--dusty-lavender);
                font-weight: 500;
                margin-right: 8px;
            }

            .btn-login {
                background: var(--coral-pink);
                color: white;
                border-radius: 50px;
                padding: 8px 20px;
                transition: all 0.3s;
                border: none;
            }

            .btn-login:hover {
                background: var(--dusty-lavender);
                color: white;
                text-decoration: none;
            }

            /* Dropdown menu adjustments */
            .dropdown-menu {
                min-width: 200px;
                border: none;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
                padding: 10px 0;
            }

            .dropdown-item {
                padding: 8px 20px;
                color: var(--deep-lavender);
                transition: all 0.3s;
            }

            .dropdown-item:hover {
                background-color: var(--soft-pink);
                color: var(--deep-lavender);
            }

            .dropdown-divider {
                border-color: rgba(188, 133, 163, 0.2);
            }

            /* Responsive adjustments */
            @media (max-width: 991px) {
                .user-name, .user-profile i {
                    display: none !important;
                }

                .user-profile {
                    padding: 5px;
                }

                .dropdown-menu {
                    position: absolute !important;
                }
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <header class="main-header">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="homepage.jsp">
                        <img src="image/logo_1.png" alt="GRAND MERCURE" style="height: 40px;">
                    </a>
                    <!-- Navigation would be here -->
                </nav>
            </div>
        </header>

        <!-- Booking Container -->
        <div class="booking-container">
            <div class="booking-header">
                <h1><i class="fas fa-calendar-check"></i> Complete Your Booking</h1>
                <p>Please review your reservation details before confirmation</p>
            </div>

            <div class="booking-body">
                <!--<form action="${pageContext.request.contextPath}/bookings?action=create" method="post">-->
                    <!-- Room Information -->
                    <div class="form-section">
                        <h3 class="section-title"><i class="fas fa-bed"></i> Selected Room</h3>
                        <div class="room-card">
                            <div class="room-info-col">
                                <span class="room-info-label">Room Number</span>
                                <!--<span class="room-info-value">${room.roomNumber}</span>-->
                            </div>
                            <div class="room-info-col">
                                <span class="room-info-label">Room Type</span>
                                <!--<span class="room-info-value">${room.roomTypeName}</span>-->
                            </div>
                            <div class="room-info-col">
                                <span class="room-info-label">Nightly Rate</span>
                                <!--<span class="room-info-value"><fmt:formatNumber value="${room.currentPrice}" pattern="#,##0"/> VND</span>-->
                            </div>
                            <div class="room-info-col">
                                <span class="room-info-label">Max Guests</span>
                                <!--<span class="room-info-value">${room.capacity}</span>-->
                            </div>
                        </div>
                    </div>

                    <!-- Booking Details -->
                    <div class="form-section">
                        <h3 class="section-title"><i class="far fa-calendar-alt"></i> Stay Details</h3>
                        <div class="form-grid">
                            <div class="form-group">
                                <label>Check-in Date</label>
                                <!--<input type="date" name="checkInDate" value="<fmt:formatDate value='${booking.checkInDate}' pattern='yyyy-MM-dd' />"  readonly>-->
                            </div>
                            <div class="form-group">
                                <label>Check-out Date</label>
                                <!--<input type="date" name="checkOutDate" value="<fmt:formatDate value='${booking.checkOutDate}' pattern='yyyy-MM-dd' />"  readonly>-->
                            </div>
                            <div class="form-group">
                                <label>Number of Customer</label>
                                <!--<input type="number" name="numberOfGuests" value="${booking.numberOfGuests}" min="1" max="${room.capacity}" readonly>-->
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Special Requests</label>
                            <!--<textarea name="specialRequests" rows="3" placeholder="Any special requirements or preferences">${booking.specialRequests}</textarea>-->
                        </div>
                    </div>

                    <!-- Additional Services -->
                    <div class="form-section">
                        <h3 class="section-title"><i class="fas fa-concierge-bell"></i> Enhance Your Stay</h3>
                        <div class="services-grid">
                            <!--<c:forEach var="service" items="${services}">-->
                                <div class="service-card">
                                    <!--<input type="checkbox" class="service-checkbox" name="serviceIds" value="${service.serviceId}" id="service_${service.serviceId}">-->
                                    <div class="service-details">
                                        <!--<div class="service-name">${service.serviceName}</div>-->
                                        <!--<div class="service-price"><fmt:formatNumber value="${service.price}" pattern="#,##0"/> VND</div>-->
                                    </div>
                                    <!--<input type="number" class="service-quantity" name="quantities" min="1" value="1" data-service-id="${service.serviceId}">-->
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Promotions Input -->
                    <div class="form-section">
                        <h3 class="section-title"><i class="fas fa-tag"></i> Apply Promotion</h3>
                        <div class="form-group">
                            <input type="text" name="promotionName" id="promotionName" class="form-control" placeholder="Enter promotion name">
                        </div>
                    </div>

                    <!-- Total Summary -->
                    <div class="total-section">
                        <div class="total-label">Total Amount</div>
                        <div class="total-amount" id="totalDisplay"><fmt:formatNumber value="0" pattern="#,##0"/> VND</div>
                        <input type="hidden" name="totalAmount" id="totalAmount">
                    </div>

                    <!-- Guest Information -->
                    <div class="form-section">
                        <h3 class="section-title"><i class="fas fa-user"></i> Guest Information</h3>
                        <div class="form-grid">
                            <c:choose>
                                <!--<c:when test="${not empty sessionScope.User}">-->
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <!--<input type="text" value="${sessionScope.User.full_name}" readonly>-->
                                    </div>
                                    <div class="form-group">
                                        <label>Email Address</label>
                                        <!--<input type="email" value="${sessionScope.User.email}" readonly>-->
                                    </div>
                                    <div class="form-group">
                                        <label>Phone Number</label>
                                        <!--<input type="text" value="${sessionScope.User.phone}" readonly>-->
                                    </div>
                                    <div class="form-group">
                                        <label>Address</label>
                                        <!--<input type="text" value="${sessionScope.User.address}" readonly>-->
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <input type="text" name="customer_name" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Email Address</label>
                                        <input type="email" name="customer_email" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Phone Number</label>
                                        <input type="text" name="customer_phone" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Address</label>
                                        <input type="text" name="customer_address" required>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <input type="hidden" name="roomId" value="${room.roomId}">

                    <!-- Action Buttons -->
                    <div class="action-buttons">
                        <!--<a href="${pageContext.request.contextPath}/RoomDetailsController?roomId=${room.roomId}" class="btn btn-back">-->
                            <i class="fas fa-arrow-left"></i> Back to Room
                        </a>
                        <button type="submit" class="btn btn-confirm">
                            <i class="fas fa-check-circle"></i> Confirm Booking
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Footer would be included here -->

        <!-- JavaScript -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

        <script>
            const promotions = [
            <c:forEach var="promo" items="${promotions}" varStatus="loop">
            {
            promotionID: ${promo.promotionID},
                    promotionName: "${promo.promotionName}",
                    discountPercent: ${promo.discountPercent}
            }<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
            ];

            $(document).ready(function () {
                // Toggle quantity input when service is selected
                $('.service-checkbox').change(function () {
                    const quantityInput = $(this).closest('.service-card').find('.service-quantity');
                    if (this.checked) {
                        quantityInput.fadeIn(200);
                    } else {
                        quantityInput.fadeOut(200);
                    }
                    calculateTotal();
                });

                // Calculate total amount
                function calculateTotal() {
                    const checkIn = new Date($('input[name="checkInDate"]').val());
                    const checkOut = new Date($('input[name="checkOutDate"]').val());
                    const roomPricePerNight = ${room.currentPrice};
                    let total = 0;

                    // 1. Calculate room cost based on nights
                    if (checkIn && checkOut && checkOut > checkIn) {
                        const nights = Math.ceil((checkOut - checkIn) / (1000 * 60 * 60 * 24));
                        total = nights * roomPricePerNight;
                    }

                    // 2. Add selected services with quantities
                    $('.service-checkbox:checked').each(function () {
                        const serviceId = $(this).val();
                        const quantity = parseInt($(`input[data-service-id="${serviceId}"]`).val()) || 1;
                        const priceText = $(this).closest('.service-card').find('.service-price').text();
                        const price = parseInt(priceText.replace(/[^0-9]/g, ''));
                        total += price * quantity;
                    });

                    // 3. Áp dụng khuyến mãi nếu có
                    const promotionInput = $('input[name="promotionName"]').val().trim().toLowerCase();
                    if (promotionInput) {
                        const promo = promotions.find(p => p.promotionName.toLowerCase() === promotionInput);
                        if (promo) {
                            const discount = parseFloat(promo.discountPercent);
                            total = total * (100 - discount) / 100;
                        } else {
                            console.warn("Promotion not found:", promotionInput);
                        }
                    }

                    // 4. Hiển thị tổng tiền
                    $('#totalAmount').val(Math.round(total));
                    $('#totalDisplay').text(new Intl.NumberFormat('vi-VN').format(Math.round(total)) + ' VND');
                }


                // Event
                $('input[name="checkInDate"], input[name="checkOutDate"]').change(function () {
                    const checkIn = new Date($('input[name="checkInDate"]').val());
                    const checkOut = new Date($('input[name="checkOutDate"]').val());
                    if (checkIn && checkOut && checkOut <= checkIn) {
                        alert('Check-out date must be after check-in date');
                        $('input[name="checkOutDate"]').val('');
                    }
                    calculateTotal();
                });

                $('.service-quantity').on('input', function () {
                    if ($(this).val() < 1)
                        $(this).val(1);
                    calculateTotal();
                });

                $('input[name="promotionName"]').on('input', calculateTotal);

                // Tính lần đầu
                calculateTotal();
            });
        </script>
    </body>
</html>
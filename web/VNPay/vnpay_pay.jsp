<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Submit Order</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary: #ff8ba7;        /* Hồng phấn chủ đạo */
      --primary-dark: #ff5c8a;    /* Hồng đậm khi hover */
      --primary-light: #fff5f7;  /* Nền hồng nhạt */
      --text-dark: #444444;
      --text-light: #888888;
      --border: #f0d0d9;
      --radius: 16px;
      --shadow: 0 10px 25px rgba(255, 139, 167, 0.1);
      --bg-main: #fdf6f8;
      --accent: #ffb3c6;
      --success: #a8e6cf;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #fdf6f8 0%, #fff5f7 100%);
      color: var(--text-dark);
      min-height: 100vh;
      padding: 20px 0;
    }

    .container {
      width: 90%;
      max-width: 1200px;
      margin: 30px auto;
      background: #ffffff;
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      overflow: hidden;
      animation: fadeIn 0.8s ease-out;
    }

    /* Header */
    header {
      padding: 25px 40px;
      border-bottom: 1px solid var(--border);
      display: flex;
      align-items: center;
      gap: 15px;
    }

    .back-btn {
      background: var(--primary-light);
      border: none;
      width: 44px;
      height: 44px;
      border-radius: 50%;
      font-size: 20px;
      cursor: pointer;
      color: var(--primary);
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all 0.3s ease;
    }

    .back-btn:hover {
      background: var(--primary);
      color: white;
      transform: scale(1.08);
    }

    header h1 {
      font-size: 26px;
      font-weight: 600;
      color: var(--primary-dark);
      display: flex;
      align-items: center;
      gap: 10px;
    }

    header h1 i {
      color: var(--primary);
      font-size: 28px;
    }

    /* Main Layout */
    main {
      display: grid;
      grid-template-columns: 2fr 1.1fr;
      gap: 40px;
      padding: 40px;
    }

    section {
      margin-bottom: 28px;
    }

    h2 {
      font-size: 18px;
      color: var(--primary-dark);
      margin-bottom: 16px;
      font-weight: 600;
      display: flex;
      align-items: center;
      gap: 10px;
    }

    h2 i {
      color: var(--primary);
      font-size: 19px;
    }

    /* Customer Info */
    .customer-info form {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
      gap: 20px;
    }

    .customer-info label {
      font-weight: 500;
      font-size: 14px;
      color: var(--text-dark);
      margin-bottom: 8px;
      display: block;
    }

    .customer-info input {
      padding: 12px 16px;
      border-radius: 12px;
      border: 1.5px solid #f0d0d9;
      font-size: 14.5px;
      background-color: #fff9fb;
      transition: all 0.3s ease;
      width: 100%;
    }

    .customer-info input:focus {
      border-color: var(--primary);
      background-color: #fff;
      box-shadow: 0 0 0 3px rgba(255, 139, 167, 0.15);
      outline: none;
    }

    /* Order Items */
    .order-items .item {
      display: flex;
      align-items: center;
      background: #fff;
      border: 1.5px solid var(--border);
      border-radius: 14px;
      padding: 16px;
      margin-bottom: 16px;
      transition: all 0.3s ease;
      box-shadow: 0 4px 12px rgba(255, 139, 167, 0.06);
    }

    .order-items .item:hover {
      transform: translateY(-4px);
      box-shadow: 0 8px 20px rgba(255, 139, 167, 0.12);
      border-color: var(--primary);
    }

    .order-items img {
      width: 76px;
      height: 76px;
      object-fit: cover;
      border-radius: 12px;
      margin-right: 18px;
      border: 1px solid #f8d8e2;
    }

    .item-details {
      flex: 1;
    }

    .item-name {
      font-weight: 600;
      color: var(--primary-dark);
      font-size: 15px;
      margin-bottom: 6px;
      display: flex;
      align-items: center;
      gap: 6px;
    }

    .item-name i {
      color: var(--success);
      font-size: 14px;
    }

    .order-items p {
      margin: 3px 0;
      font-size: 13.5px;
      color: var(--text-light);
    }

    /* Payment & Note */
    .payment-method p {
      background: linear-gradient(135deg, #fff0f5, #ffe4ee);
      color: var(--primary-dark);
      padding: 12px 18px;
      border-radius: 12px;
      font-weight: 600;
      font-size: 14px;
      display: inline-flex;
      align-items: center;
      gap: 8px;
      border: 1px dashed var(--primary);
    }

    .note textarea {
      width: 100%;
      height: 100px;
      border-radius: 14px;
      border: 1.5px solid #f0d0d9;
      padding: 14px 16px;
      font-family: 'Poppins', sans-serif;
      font-size: 14px;
      resize: none;
      background-color: #fff9fb;
      transition: all 0.3s ease;
    }

    .note textarea:focus {
      border-color: var(--primary);
      background-color: #fff;
      box-shadow: 0 0 0 3px rgba(255, 139, 167, 0.15);
      outline: none;
    }

    /* Summary */
    .summary {
      background: linear-gradient(145deg, #fff5f7, #ffffff);
      padding: 28px;
      border-radius: var(--radius);
      border: 1.5px solid #fad0dc;
      height: fit-content;
      box-shadow: 0 6px 18px rgba(255, 139, 167, 0.1);
    }

    .summary h2 {
      color: var(--primary-dark);
      margin-bottom: 20px;
    }

    .summary p {
      display: flex;
      justify-content: space-between;
      margin: 12px 0;
      font-size: 15px;
      color: var(--text-dark);
    }

    .summary hr {
      border: none;
      height: 1px;
      background: linear-gradient(to right, transparent, #f8b3c9, transparent);
      margin: 16px 0;
    }

    .summary .total {
      font-weight: 700;
      font-size: 21px;
      color: var(--primary-dark);
    }

    /* Submit Button */
    .submit-btn {
      width: 100%;
      background: linear-gradient(135deg, var(--primary), var(--primary-dark));
      border: none;
      color: white;
      padding: 16px;
      font-size: 16px;
      font-weight: 600;
      border-radius: 14px;
      cursor: pointer;
      margin-top: 20px;
      transition: all 0.4s ease;
      box-shadow: 0 6px 16px rgba(255, 139, 167, 0.3);
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .submit-btn:hover {
      transform: translateY(-3px);
      box-shadow: 0 10px 22px rgba(255, 139, 167, 0.4);
    }

    .submit-btn i {
      font-size: 18px;
    }

    /* Responsive */
    @media (max-width: 900px) {
      main { 
        grid-template-columns: 1fr; 
        padding: 25px;
      }
      header { padding: 20px; }
      .container { padding: 0; }
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(15px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>
  <div class="container">
    <header>
      <button class="back-btn" onclick="history.back()">
        <i class="fa-solid fa-arrow-left"></i>
      </button>
      <h1><i class="fa-solid fa-spa"></i> Hoàn tất đơn hàng</h1>
    </header>

    <main>
      <div>
        <!-- Shipping Info -->
        <section class="customer-info">
          <h2><i class="fa-solid fa-user"></i> Thông tin nhận hàng</h2>
          <form>
            <div>
              <label for="name">Họ và tên</label>
              <input type="text" id="name" name="name" value="Dương Quỳnh" required />
            </div>
            <div>
              <label for="phone">Số điện thoại</label>
              <input type="text" id="phone" name="phone" value="0987654321" required />
            </div>
            <div style="grid-column: span 2;">
              <label for="address">Địa chỉ giao hàng</label>
              <input type="text" id="address" name="address" value="123 Flower Street, Hà Nội" required />
            </div>
          </form>
        </section>

        <!-- Order Items -->
        <section class="order-items">
          <h2><i class="fa-solid fa-gift"></i> Sản phẩm của bạn</h2>
          <div class="item">
            <img src="Roses Bouquet.webp" alt="Roses Bouquet">
            <div class="item-details">
              <p class="item-name"><i class="fa-solid fa-check"></i> Roses Bouquet</p>
              <p>Số lượng: 2</p>
              <p>Giá: 50.000đ</p>
            </div>
          </div>
          <div class="item">
            <img src="Sun_flower_box.jpg" alt="Sunflower Box">
            <div class="item-details">
              <p class="item-name"><i class="fa-solid fa-check"></i> Sunflower Box</p>
              <p>Số lượng: 1</p>
              <p>Giá: 75.000đ</p>
            </div>
          </div>
        </section>

        <!-- Payment Method -->
        <section class="payment-method">
          <h2><i class="fa-solid fa-credit-card"></i> Phương thức thanh toán</h2>
          <p><i class="fa-solid fa-qrcode"></i> VNPay</p>
        </section>

        <!-- Note -->
        <section class="note">
          <h2><i class="fa-solid fa-note-sticky"></i> Lời nhắn gửi</h2>
          <textarea placeholder="Gửi lời chúc đến người nhận..."></textarea>
        </section>
      </div>

      <!-- Order Summary -->
      <aside class="summary">
        <h2><i class="fa-solid fa-receipt"></i> Tóm tắt đơn hàng</h2>
        <p>Tạm tính: <span>175.000đ</span></p>
        <p>Phí vận chuyển: <span>5.000đ</span></p>
        <p>Giảm giá: <span>-10.000đ</span></p>
        <hr />
        <p class="total">Tổng cộng: <span>170.000đ</span></p>

        <!-- VNPay Form -->
        <form action="${pageContext.request.contextPath}/VNPay_Payment" method="POST">
          <input type="hidden" name="amount" value="170000" />
          <input type="hidden" name="bank_Code" value="" />
          <input type="hidden" name="language" value="vn" />
          <button type="submit" class="submit-btn">
            <i class="fa-solid fa-lock"></i> Thanh toán an toàn
          </button>
        </form>
      </aside>
    </main>
  </div>
</body>
</html>
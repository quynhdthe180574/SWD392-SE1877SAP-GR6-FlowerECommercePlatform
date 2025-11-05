<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="util.VNPayConfig"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>KẾT QUẢ THANH TOÁN</title>
        <!-- Bootstrap core CSS -->
        <link href="/HotelManagement1/css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="/HotelManagement1/css/jumbotron-narrow.css" rel="stylesheet"> 
        <script src="/HotelManagement1/js/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = VNPayConfig.hashAllFields(fields);

        %>
        <style>
            /* Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body setup */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f7f7f7;
    color: #333;
    line-height: 1.6;
    padding: 20px;
}

/* Container */
.container {
    max-width: 700px;
    margin: 40px auto;
    background: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Header */
.header {
    text-align: center;
    margin-bottom: 30px;
}

.header h3 {
    font-size: 24px;
    color: #4e73df;
    font-weight: bold;
}

/* Form Group */
.form-group {
    margin-bottom: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.form-group label {
    font-weight: bold;
    margin-bottom: 5px;
    flex: 1;
    color: #555;
}

.form-group label:last-child {
    flex: 2;
    text-align: right;
    color: #333;
    font-weight: normal;
    word-wrap: break-word;
}

/* Table responsiveness */
.table-responsive {
    width: 100%;
}

/* Footer */
.footer {
    margin-top: 30px;
    text-align: center;
    color: #777;
    font-size: 14px;
}

/* Button (optional if you want to add a button for return) */
.button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #4e73df;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    margin-top: 20px;
    transition: background-color 0.3s;
}

.button:hover {
    background-color: #2e59d9;
}

/* Mobile Responsive */
@media (max-width: 600px) {
    .form-group {
        flex-direction: column;
        align-items: flex-start;
    }

    .form-group label:last-child {
        text-align: left;
    }
}

        </style>
        <!--Begin display -->
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label >Mã giao dịch thanh toán:</label>
                    <label><%=request.getParameter("vnp_TxnRef")%></label>
                </div>    
                <div class="form-group">
                    <label >Số tiền:</label>
                    <label>
                        <%
                            String amountParam = request.getParameter("vnp_Amount");
                            long amount = 0;
                            if (amountParam != null && !amountParam.isEmpty()) {
                                amount = Long.parseLong(amountParam) / 100; // Chia lại 100
                            }
                            out.print(amount + " VND");
                        %>
                    </label>
                </div>  
                <div class="form-group">
                    <label >Mô tả giao dịch:</label>
                    <label><%=request.getParameter("vnp_OrderInfo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã lỗi thanh toán:</label>
                    <label><%=request.getParameter("vnp_ResponseCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã giao dịch tại CTT VNPAY-QR:</label>
                    <label><%=request.getParameter("vnp_TransactionNo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã ngân hàng thanh toán:</label>
                    <label><%=request.getParameter("vnp_BankCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Thời gian thanh toán:</label>
                    <label><%=request.getParameter("vnp_PayDate")%></label>
                </div> 
                <div class="form-group">
                    <label >Tình trạng giao dịch:</label>
                    <label>
                        <%
                            if (signValue.equals(vnp_SecureHash)) {
                                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                    out.print("Thành công");
                                } else {
                                    out.print("Không thành công");
                                }

                            } else {
                                out.print("invalid signature");
                            }
                        %></label>
                </div> 
            </div>
            <p>
                &nbsp;
            </p>
            
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
            <a href="HomeController" class="btn-secondary">Về trang chủ</a>
        </div>  
                
    </body>
</html>

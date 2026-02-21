<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OTP Verification</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<style>
/* Overlay Background */
.otp-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    background: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Popup Box */
.otp-box {
    background: white;
    padding: 30px;
    width: 350px;
    border-radius: 12px;
    box-shadow: 0px 10px 25px rgba(0,0,0,0.3);
    text-align: center;
}
</style>

</head>
<body>

<div class="otp-overlay">
    <div class="otp-box">
        <h2>OTP Verification</h2>
        <%
		String error = (String) request.getAttribute("error");
		if(error != null){
		%>
		<p style="color:red;"><%= error %></p>
		<% } %>

        <p style="margin:10px 0; color:gray;">
            Generated OTP: <strong>${generatedOtp}</strong>
        </p>

        <form action="<%= request.getContextPath() %>/OtpServlet" method="post">
            <input type="text" name="otp"
                placeholder="Enter OTP"
                class="input-field" required>

            <button type="submit" class="login-btn">Verify</button>
        </form>
    </div>
</div>

</body>
</html>
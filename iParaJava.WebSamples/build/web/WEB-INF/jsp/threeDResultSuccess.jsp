<%-- 
    Document   : ThreeDResultSuccess
    Created on : Aug 29, 2017, 12:10:45 PM
    Author     : fcoskun
    Refactored : oaksoy, Oct 11, 2017
--%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="iParaJava.Entity.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="iParaJava.Entity.PurchaserAddress"%>
<%@page import="iParaJava.Entity.Purchaser"%>
<%@page import="iParaJava.Core.Request.ThreeDPaymentCompleteRequest"%>
<%@page import="iParaJava.Core.Helper"%>
<%@page import="java.util.UUID"%>
<%@page import="iParaJava.Core.Settings"%>
<%@page import="iParaJava.Core.Response.*"%>
<%@page import="com.google.gson.Gson" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! ThreeDPaymentCompleteResponse completeResponse = new ThreeDPaymentCompleteResponse();%>

<jsp:include page="layout.jsp" />

<%

    request.setCharacterEncoding("UTF-8");
    Settings settings = new Settings();

    settings.publicKey = ""; //"Public Magaza Anahtarı",
    settings.privateKey = ""; //"Private Magaza Anahtarı",
    settings.baseUrl = "https://api.ipara.com/"; //Test için 
    settings.version = "1.0";
    settings.mode = "T"; // Test -> T / Prod -> P
    settings.hashString = "";

    ThreeDPaymentInitResponse paymentResponse = new ThreeDPaymentInitResponse();
    paymentResponse.orderId = request.getParameter("orderId");
    paymentResponse.result = request.getParameter("result");
    paymentResponse.mode = request.getParameter("mode");
    paymentResponse.amount = request.getParameter("amount");

    if (request.getParameter("errorCode") != null) {
        paymentResponse.errorCode = request.getParameter("errorCode");
    }

    if (request.getParameter("errorMessage") != null) {
        paymentResponse.errorMessage = request.getParameter("errorMessage");
    }

    if (request.getParameter("transactionDate") != null) {
        paymentResponse.transactionDate = request.getParameter("transactionDate");
    }

    if (request.getParameter("hash") != null) {
        paymentResponse.hash = request.getParameter("hash");
    }

    if (Helper.validate3DReturn(paymentResponse, settings)) {
        
        ThreeDPaymentCompleteRequest completeRequest = new ThreeDPaymentCompleteRequest();
        completeRequest.orderId = request.getParameter("orderId");
        completeRequest.echo = "Echo";
        completeRequest.mode = settings.mode;
        completeRequest.amount = "10000"; // 100 tL
        completeRequest.cardOwnerName = "Fatih Coşkun";
        completeRequest.cardNumber = "4282209027132016";
        completeRequest.cardExpireMonth = "05";
        completeRequest.cardExpireYear = "18";
        completeRequest.installment = "1";
        completeRequest.cvc = "000";
        completeRequest.threeD = "true";
        completeRequest.threeDSecureCode = request.getParameter("threeDSecureCode");

        completeRequest.purchaser = new Purchaser();
        completeRequest.purchaser.birthDate = "1986-07-11";
        completeRequest.purchaser.gsmNumber = "5881231212";
        completeRequest.purchaser.tcCertificate = "1234567890";

        completeRequest.purchaser.invoiceAddress = new PurchaserAddress();
        completeRequest.purchaser.invoiceAddress.name = "Murat";
        completeRequest.purchaser.invoiceAddress.surname = "Kaya";
        completeRequest.purchaser.invoiceAddress.address = "Mevlüt Pehlivan Mah. Multinet Plaza Şişli";
        completeRequest.purchaser.invoiceAddress.zipcode = "34782";
        completeRequest.purchaser.invoiceAddress.city = "34";
        completeRequest.purchaser.invoiceAddress.tcCertificate = "1234567890";
        completeRequest.purchaser.invoiceAddress.country = "TR";
        completeRequest.purchaser.invoiceAddress.taxNumber = "123456";
        completeRequest.purchaser.invoiceAddress.taxOffice = "Kozyatağı";
        completeRequest.purchaser.invoiceAddress.companyName = "iPara";
        completeRequest.purchaser.invoiceAddress.phoneNumber = "2122222222";

        completeRequest.purchaser.shippingAddress = new PurchaserAddress();
        completeRequest.purchaser.shippingAddress.name = "Murat";
        completeRequest.purchaser.shippingAddress.surname = "Kaya";
        completeRequest.purchaser.shippingAddress.address = "Mevlüt Pehlivan Mah. Multinet Plaza Şişli";
        completeRequest.purchaser.shippingAddress.zipcode = "34782";
        completeRequest.purchaser.shippingAddress.city = "34";
        completeRequest.purchaser.shippingAddress.tcCertificate = "1234567890";
        completeRequest.purchaser.shippingAddress.country = "TR";
        completeRequest.purchaser.shippingAddress.phoneNumber = "2122222222";

        completeRequest.products = new ArrayList<>();
        Product product1 = new Product();
        product1.title = "Telefon";
        product1.code = "TLF0001";
        product1.price = "5000";
        product1.quantity = "1";
        completeRequest.products.add(product1);
        Product product2 = new Product();
        product2.title = "Bilgisayar";
        product2.code = "BLG0001";
        product2.price = "5000";
        product2.quantity = "1";
        completeRequest.products.add(product2);

        completeResponse = ThreeDPaymentCompleteRequest.execute(completeRequest, settings);

    }

%>  

<h1>3d Başarılı!</h1>

<pre>
    <%  
        Gson g = new GsonBuilder().disableHtmlEscaping().setPrettyPrinting().create();
        out.println("  <h1>Sonuç</h1>");
        out.println(g.toJson(completeResponse).toString());
    %>
</pre>

<jsp:include page="footer.jsp"/>

<%-- 
    Document   : ApiPaymentWithWallet
    Created on : Sep 13, 2017, 11:03:18 AM
    Author     : fcoskun
    Refactored : oaksoy, Oct 11, 2017
--%>

<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="java.util.UUID"%>
<%@page import="iParaJava.Core.Response.ApiPaymentResponse"%>
<%@page import="iParaJava.Entity.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="iParaJava.Entity.PurchaserAddress"%>
<%@page import="iParaJava.Entity.Purchaser"%>
<%@page import="iParaJava.Core.Request.ApiPaymentRequest"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="iParaJava.Core.Settings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="layout.jsp"/>

<fieldset>
    <legend><label style="font-weight:bold;width:250px;">Sepet Bilgileri</label></legend>
    <table class="table">
        <thead>
            <tr>
                <th>
                    Ürün
                </th>
                <th>
                    Kod
                </th>
                <th>
                    Adet
                </th>
                <th>
                    Birim Fiyat
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    Telefon
                </td>
                <td>
                    TLF0001
                </td>
                <td>
                    1
                </td>
                <td>
                    50.00 TL
                </td>
            </tr>
            <tr>
                <td>
                    Bilgisayar
                </td>
                <td>
                    BLG0001
                </td>
                <td>
                    1
                </td>
                <td>
                    50.00 TL
                </td>
            </tr>

            <tr>
                <td colspan="3">
                    Toplam Tutar
                </td>

                <td>
                    100.00 TL
                </td>
            </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend><label style="font-weight:bold;width:250px;">Kargo Adresi Bilgileri</label></legend>
    <label style="font-weight:bold;">Ad :</label> Murat<br>
    <label style="font-weight:bold;">Soyad :</label> Kaya <br>
    <label style="font-weight:bold;">Adres :</label> Mevlüt Pehlivan Mah. Multinet Plaza Şişli <br>
    <label style="font-weight:bold;">Posta Kodu :</label> 34782 <br>
    <label style="font-weight:bold;">Şehir :</label> İstanbul <br>
    <label style="font-weight:bold;">Ülke :</label> Türkiye <br>
    <label style="font-weight:bold;">Telefon Numarası:</label> 2123886600 <br>
</fieldset>
<fieldset>
    <legend><label style="font-weight:bold;width:250px;">Fatura Adresi Bilgileri</label></legend>
    <label style="font-weight:bold;">Ad :</label> Murat<br>
    <label style="font-weight:bold;">Soyad :</label> Kaya<br>
    <label style="font-weight:bold;">Adres :</label> Mevlüt Pehlivan Mah. Multinet Plaza Şişli<br>
    <label style="font-weight:bold;">Posta Kodu :</label> 34782<br>
    <label style="font-weight:bold;">Şehir :</label> İstanbul<br>
    <label style="font-weight:bold;">Ülke :</label> Türkiye<br>
    <label style="font-weight:bold;">TC Kimlik Numarası :</label> 1234567890<br>
    <label style="font-weight:bold;">Telefon Numarası:</label> 2123886600<br>
    <label style="font-weight:bold;">Vergi Numarası :</label> 123456<br>
    <label style="font-weight:bold;">Vergi Dairesi Adı :</label> Kozyatağı<br>
    <label style="font-weight:bold;">Firma Adı:</label> iPara
</fieldset>
<form action="" method="post" class="form-horizontal">
    <fieldset>
        <legend><label style="font-weight:bold;width:250px;">Tek Tıkla Ödeme</label></legend>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">Kullanıcı Id:</label>
            <div class="col-md-4">
                <input name="userId" type="text" value="" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">Kart Id:</label>
            <div class="col-md-4">
                <input name="cardId" type="text" value="" class="form-control input-md">
            </div>
        </div>
    </fieldset>
    Taksit Sayısı
    <select name="installment">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
    </select>
    <!-- Button -->
    <div class="form-group">
        <label class="col-md-4 control-label" for=""></label>
        <div class="col-md-4">
            <button type="submit" id="" name="" class="btn btn-success">API Payment ile Ödeme</button>
        </div>
    </div>
</form>

<%

    request.setCharacterEncoding("UTF-8");

    if ("POST".equalsIgnoreCase(request.getMethod())) {

        Settings settings = new Settings();
        settings.publicKey = ""; //"Public Magaza Anahtarı - size mağaza başvurunuz sonucunda gönderilen publik key (açık anahtar) bilgisini kullanınız.",
        settings.privateKey = ""; //"Private Magaza Anahtarı  - size mağaza başvurunuz sonucunda gönderilen privaye key (gizli anahtar) bilgisini kullanınız.",
        settings.baseUrl = "https://apitest.ipara.com/";  //iPara web servisleri API url'lerinin başlangıç bilgisidir. Restful web servis isteklerini takip eden kodlar halinde bulacaksınız.
        // Örneğin "https://api.ipara.com/" + "/rest/payment/auth"  = "https://api.ipara.com/rest/payment/auth" 
        settings.version = "1.0";// Kullandığınız iPara API versiyonudur. 
        settings.mode = "T";  // Test -> T, entegrasyon testlerinin sırasında "T" modunu, canlı sisteme entegre olarak ödeme almaya başlamak için ise Prod -> "P" modunu kullanınız.
        settings.hashString = ""; // Kullanacağınız hash bilgisini, bağlanmak istediğiniz web servis bilgisine göre doldurulmalıdır. Bu bilgileri Entegrasyon rehberinin ilgili web servise ait bölümde bulabilirsiniz.

        ApiPaymentRequest apiPaymentRequest = new ApiPaymentRequest();
        UUID uuid = UUID.randomUUID();

        apiPaymentRequest.orderId = uuid.toString();
        apiPaymentRequest.echo = "Echo";
        apiPaymentRequest.mode = settings.mode;
        apiPaymentRequest.amount = "10000"; // 100 tL
        apiPaymentRequest.cardOwnerName = "";
        apiPaymentRequest.cardNumber = "";
        apiPaymentRequest.cardExpireMonth = "";
        apiPaymentRequest.cardExpireYear = "";
        apiPaymentRequest.installment = request.getParameter("installment");
        apiPaymentRequest.cvc = "";
        apiPaymentRequest.cardId = request.getParameter("cardId");
        apiPaymentRequest.userId = request.getParameter("userId");
        apiPaymentRequest.threeD = "false";

        apiPaymentRequest.purchaser = new Purchaser();
        apiPaymentRequest.purchaser.name = "Murat";
        apiPaymentRequest.purchaser.surname = "Kaya";
        apiPaymentRequest.purchaser.birthDate = "1986-07-11";
        apiPaymentRequest.purchaser.email = "murat@kaya.com";
        apiPaymentRequest.purchaser.gsmNumber = "5881231212";
        apiPaymentRequest.purchaser.tcCertificate = "1234567890";
        apiPaymentRequest.purchaser.clientIp = "127.0.0.1";

        apiPaymentRequest.purchaser.invoiceAddress = new PurchaserAddress();
        apiPaymentRequest.purchaser.invoiceAddress.name = "Murat";
        apiPaymentRequest.purchaser.invoiceAddress.surname = "Kaya";
        apiPaymentRequest.purchaser.invoiceAddress.address = "Mevlüt Pehlivan Mah. Multinet Plaza Şişli";
        apiPaymentRequest.purchaser.invoiceAddress.zipcode = "34782";
        apiPaymentRequest.purchaser.invoiceAddress.city = "34";
        apiPaymentRequest.purchaser.invoiceAddress.tcCertificate = "1234567890";
        apiPaymentRequest.purchaser.invoiceAddress.country = "TR";
        apiPaymentRequest.purchaser.invoiceAddress.taxNumber = "123456";
        apiPaymentRequest.purchaser.invoiceAddress.taxOffice = "Kozyatağı";
        apiPaymentRequest.purchaser.invoiceAddress.companyName = "iPara";
        apiPaymentRequest.purchaser.invoiceAddress.phoneNumber = "2122222222";

        apiPaymentRequest.purchaser.shippingAddress = new PurchaserAddress();
        apiPaymentRequest.purchaser.shippingAddress.name = "Murat";
        apiPaymentRequest.purchaser.shippingAddress.surname = "Kaya";
        apiPaymentRequest.purchaser.shippingAddress.address = "Mevlüt Pehlivan Mah. Multinet Plaza Şişli";
        apiPaymentRequest.purchaser.shippingAddress.zipcode = "34782";
        apiPaymentRequest.purchaser.shippingAddress.city = "34";
        apiPaymentRequest.purchaser.shippingAddress.tcCertificate = "1234567890";
        apiPaymentRequest.purchaser.shippingAddress.country = "TR";
        apiPaymentRequest.purchaser.shippingAddress.phoneNumber = "2122222222";

        apiPaymentRequest.products = new ArrayList<>();
        Product product1 = new Product();
        product1.title = "Telefon";
        product1.code = "TLF0001";
        product1.price = "5000";
        product1.quantity = "1";
        apiPaymentRequest.products.add(product1);
        Product product2 = new Product();
        product2.title = "Bilgisayar";
        product2.code = "BLG0001";
        product2.price = "5000";
        product2.quantity = "1";
        apiPaymentRequest.products.add(product2);

        ApiPaymentResponse apiPaymentResponse = ApiPaymentRequest.execute(apiPaymentRequest, settings);
        Gson g = new GsonBuilder().disableHtmlEscaping().setPrettyPrinting().create();
        out.println("  <h1>Sonuç</h1>");
        out.println("<pre>" + g.toJson(apiPaymentResponse) + "</pre>");

    }

%>

<jsp:include page="footer.jsp"/>

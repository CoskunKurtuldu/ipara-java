<%-- 
    Document   : DeleteCardFromWallet
    Created on : Sep 13, 2017, 11:03:03 AM
    Author     : fcoskun
    Refactored : oaksoy, Oct 11, 2017
--%>

<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="iParaJava.Core.Response.BankCardDeleteResponse"%>
<%@page import="iParaJava.Core.Request.BankCardDeleteRequest"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="iParaJava.Core.Settings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="layout.jsp"/>

<form action="" method="post" class="form-horizontal">
    <fieldset>
        <!-- Form Name -->
        <legend>Cüzdandan Kart Sil</legend>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="">Kullanıcı Id:</label>
            <div class="col-md-4">
                <input name="userId" type="text" value="123456" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for=""> Kart ID (Opsiyonel):</label>
            <div class="col-md-4">
                <input value="" name="cardId" class="form-control input-md">
            </div>
        </div>
        <!-- Button -->
        <div class="form-group">
            <label class="col-md-4 control-label" for=""></label>
            <div class="col-md-4">
                <button type="submit" id="" name="" class="btn btn-success">Sorgula</button>
            </div>
        </div>
    </fieldset>
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
        BankCardDeleteRequest bankCardDeleteRequest = new BankCardDeleteRequest();
        bankCardDeleteRequest.userId = request.getParameter("userId");
        bankCardDeleteRequest.cardId = request.getParameter("cardId");
        bankCardDeleteRequest.clientIp = "127.0.0.1";
        BankCardDeleteResponse bankCardDeleteResponse = BankCardDeleteRequest.execute(bankCardDeleteRequest, settings);

        Gson g = new GsonBuilder().disableHtmlEscaping().setPrettyPrinting().create();
        out.println("  <h1>Sonuç</h1>");

        out.println("<pre>" + g.toJson(bankCardDeleteResponse) + "</pre>");

    }

%>

<jsp:include page="footer.jsp"/>
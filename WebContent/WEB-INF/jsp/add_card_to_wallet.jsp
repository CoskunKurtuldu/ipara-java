<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="ipara.core.response.BankCardCreateResponse"%>
<%@page import="ipara.core.request.BankCardCreateRequest"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="ipara.core.Settings"%>
<%@page
	contentType="text/html"
	pageEncoding="UTF-8"
%>

<jsp:include page="layout.jsp" />

<form
	method="post"
	class="form-horizontal">
	<fieldset>
		<!-- Form Name -->
		<legend>Cüzdana Kart Ekleme</legend>
		<!-- Text input-->
		<div class="form-group">
			<label
				class="col-md-4 control-label"
				for=""
			>Kullanıcı Id:</label>
			<div class="col-md-4">
				<input
					name="userId"
					type="text"
					value="123456"
					class="form-control input-md"
					required
				>
			</div>
		</div>
		<div class="form-group">
			<label
				class="col-md-4 control-label"
				for=""
			>Kart Sahibi Adı Soyadı:</label>
			<div class="col-md-4">
				<input
					value="Fatih Coskun"
					name="nameSurname"
					class="form-control input-md"
					required
				>
			</div>
		</div>
		<div class="form-group">
			<label
				class="col-md-4 control-label"
				for=""
			> Kart Numarası:</label>
			<div class="col-md-4">
				<input
					value="4282209027132016"
					name="cardNumber"
					class="form-control input-md"
					required
				>
			</div>
		</div>
		<div class="form-group">
			<label
				class="col-md-4 control-label"
				for=""
			> Kart Kısa Adı: </label>
			<div class="col-md-4">
				<input
					value="Maas Karti"
					name="cardAlias"
					class="form-control input-md"
					required
				>
			</div>
		</div>
		<div class="form-group">
			<label
				class="col-md-4 control-label"
				for=""
			> Son Kullanma Tarihi Ay/Yıl: </label>
			<div class="col-md-4">
				<input
					value="05"
					name="month"
					class="form-control input-md"
					width="50px"
					required
				> <input
					value="18"
					name="year"
					class="form-control input-md"
					width="50px"
					required
				>
			</div>
		</div>
		<!-- Button -->
		<div class="form-group">
			<label
				class="col-md-4 control-label"
				for=""
			></label>
			<div class="col-md-4">
				<button
					type="submit"
					id=""
					name=""
					class="btn btn-success"
				>Sorgula</button>
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
		settings.baseUrl = "https://api.ipara.com/"; //iPara web servisleri API url'lerinin başlangıç bilgisidir. Restful web servis isteklerini takip eden kodlar halinde bulacaksınız.
		// Örneğin "https://api.ipara.com/" + "/rest/payment/auth"  = "https://api.ipara.com/rest/payment/auth" 
		settings.version = "1.0";// Kullandığınız iPara API versiyonudur. 
		settings.mode = "T"; // Test -> T, entegrasyon testlerinin sırasında "T" modunu, canlı sisteme entegre olarak ödeme almaya başlamak için ise Prod -> "P" modunu kullanınız.
		settings.hashString = ""; // Kullanacağınız hash bilgisini, bağlanmak istediğiniz web servis bilgisine göre doldurulmalıdır. Bu bilgileri Entegrasyon rehberinin ilgili web servise ait bölümde bulabilirsiniz.

		BankCardCreateRequest bankCardCreateRequest = new BankCardCreateRequest();
		bankCardCreateRequest.userId = request.getParameter("userId");
		bankCardCreateRequest.cardOwnerName = request.getParameter("nameSurname");
		bankCardCreateRequest.cardNumber = request.getParameter("cardNumber");
		bankCardCreateRequest.cardAlias = request.getParameter("cardAlias");
		bankCardCreateRequest.cardExpireMonth = request.getParameter("month");
		bankCardCreateRequest.cardExpireYear = request.getParameter("year");
		bankCardCreateRequest.clientIp = "127.0.0.1";
		BankCardCreateResponse bankCardCreateresponse = BankCardCreateRequest.execute(bankCardCreateRequest,
				settings);

		Gson g = new GsonBuilder().disableHtmlEscaping().setPrettyPrinting().create();
		out.println("  <h1>Sonuç</h1>");

		out.println("<pre>" + g.toJson(bankCardCreateresponse) + "</pre>");

	}
%>

<jsp:include page="footer.jsp" />

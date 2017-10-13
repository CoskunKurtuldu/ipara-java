package iParaJava.Core.Request;

import iParaJava.Core.*;
import iParaJava.Core.Response.PaymentInquiryResponse;
import javax.xml.bind.annotation.*;

/**
 * @author fcoskun
 * @refactoredby oaksoy
 */
@XmlRootElement(name = "inquiry")
public class PaymentInquiryRequest extends BaseRequest {

    @XmlElement(name = "orderId")
    public String orderId;

    public static PaymentInquiryResponse execute(PaymentInquiryRequest request, Settings settings) throws Exception {

        settings.transactionDate = Helper.getTransactionDateString();
        settings.hashString = settings.privateKey
                + request.orderId
                + settings.mode
                + settings.transactionDate;
        return RestHttpCaller.getInstance().postXML(settings.baseUrl + "rest/payment/inquiry",
                Helper.getHttpHeaders(settings, Constants.ContentTypes.APPLICATION_XML_UTF8),
                request, PaymentInquiryResponse.class);

    }

}

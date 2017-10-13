package iParaJava.Core.Request;

import iParaJava.Core.*;
import iParaJava.Core.Response.*;

/**
 * @author fcoskun
 * @refactoredby oaksoy
 */
public class BinNumberInquiryRequest extends BaseRequest {

    public String binNumber;

    public static BinNumberInquiryResponse execute(BinNumberInquiryRequest request, Settings settings) throws Exception {

        settings.transactionDate = Helper.getTransactionDateString();
        settings.hashString = settings.privateKey
                + request.binNumber
                + settings.transactionDate;
        return RestHttpCaller.getInstance().postJson(settings.baseUrl + "rest/payment/bin/lookup",
                Helper.getHttpHeaders(settings, Constants.ContentTypes.APPLICATION_JSON_UTF8),
                request, BinNumberInquiryResponse.class);

    }

}

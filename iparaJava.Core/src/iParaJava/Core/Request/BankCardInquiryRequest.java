package iParaJava.Core.Request;

import iParaJava.Core.*;
import iParaJava.Core.Response.*;

/**
 * @author fcoskun
 * @refactoredby oaksoy
 */
public class BankCardInquiryRequest extends BaseRequest {

    public String userId;
    public String clientIp;
    public String cardId;

    public static BankCardInquryResponse execute(BankCardInquiryRequest request, Settings settings) throws Exception {
        settings.transactionDate = Helper.getTransactionDateString();
        settings.hashString = settings.privateKey
                + request.userId
                + request.cardId
                + request.clientIp
                + settings.transactionDate;
        return RestHttpCaller.getInstance().postJson(settings.baseUrl + "/bankcard/inquiry",
                Helper.getHttpHeaders(settings, Constants.ContentTypes.APPLICATION_JSON_UTF8),
                request, BankCardInquryResponse.class);
    }

}

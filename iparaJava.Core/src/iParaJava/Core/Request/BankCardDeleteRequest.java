package iParaJava.Core.Request;

import iParaJava.Core.BaseRequest;
import iParaJava.Core.Constants;
import iParaJava.Core.Helper;
import iParaJava.Core.Response.BankCardDeleteResponse;
import iParaJava.Core.RestHttpCaller;
import iParaJava.Core.Settings;

/**
 * @author fcoskun
 * @refactoredby oaksoy
 */
public class BankCardDeleteRequest extends BaseRequest {

    public String userId;
    public String cardId;
    public String clientIp;

    public static BankCardDeleteResponse execute(BankCardDeleteRequest request, Settings settings) throws Exception {

        settings.transactionDate = Helper.getTransactionDateString();
        settings.hashString = settings.privateKey
                + request.userId
                + request.cardId
                + request.clientIp
                + settings.transactionDate;
        return RestHttpCaller.getInstance().postJson(settings.baseUrl + "/bankcard/delete",
                Helper.getHttpHeaders(settings, Constants.ContentTypes.APPLICATION_JSON_UTF8),
                request, BankCardDeleteResponse.class);

    }

}

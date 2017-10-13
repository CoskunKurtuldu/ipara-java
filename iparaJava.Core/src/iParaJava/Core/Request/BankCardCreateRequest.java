package iParaJava.Core.Request;

import iParaJava.Core.*;
import iParaJava.Core.Response.*;

/**
 * @author fcoskun
 * @refactoredby oaksoy
 */
public class BankCardCreateRequest {

    public String userId;
    public String cardOwnerName;
    public String cardNumber;
    public String cardAlias;
    public String cardExpireMonth;
    public String cardExpireYear;
    public String clientIp;

    public static BankCardCreateResponse execute(BankCardCreateRequest request, Settings settings) throws Exception {

        settings.transactionDate = Helper.getTransactionDateString();
        settings.hashString = settings.privateKey
                + request.userId
                + request.cardOwnerName
                + request.cardNumber
                + request.cardExpireMonth
                + request.cardExpireYear
                + request.clientIp
                + settings.transactionDate;
        return RestHttpCaller.getInstance().postJson(settings.baseUrl + "/bankcard/create",
                Helper.getHttpHeaders(settings, Constants.ContentTypes.APPLICATION_JSON_UTF8),
                request, BankCardCreateResponse.class);
    }

}

package iParaJava.Core.Response;

import iParaJava.Core.BaseResponse;
import java.util.List;

/**
 * @author fcoskun
 * @refactoredby oaksoy
 */
public class BankCardCreateResponse extends BaseResponse {

    public String cardId;

    public String maskNumber;

    public String alias;

    public String bankId;

    public String bankName;

    public String cardFamilyName;

    public String supportsInstallment;

    public List<String> supportedInstallments;

    public String type;

    public String serviceProvider;

    public String threeDSecureMandatory;

    public String cvcMandatory;

}

package iParaJava.Core.Response;

import iParaJava.Core.BaseResponse;
import java.util.List;

/**
 * @author fcoskun
 * @refactoredby oaksoy
 */
public class BinNumberInquiryResponse extends BaseResponse {

    public String bankId;

    public String bankName;

    public String cardFamilyName;

    public String supportsInstallment;

    public List<String> supportedInstallments;

    public String type;

    public String serviceProvider;

    public String cardThreeDSecureMandatory;

    public String merchantThreeDSecureMandatory;

    public String cvcMandatory;

    public String businessCard;

}

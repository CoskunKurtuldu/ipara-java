package iParaJava.Core.Response;

import iParaJava.Core.BaseResponse;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author fcoskun
 * @refactoredby oaksoy
 */
@XmlRootElement(name = "inquiryResponse")
public class PaymentInquiryResponse extends BaseResponse {

    @XmlElement(name = "amount")
    public String amount;

    @XmlElement(name = "orderId")
    public String orderId;

}

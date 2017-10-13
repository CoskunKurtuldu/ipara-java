package iParaJava.Core.Response;

import iParaJava.Core.BaseResponse;
import javax.xml.bind.annotation.*;

/**
 * @author fcoskun
 * @refactoredby oaksoy
 */
@XmlRootElement(name = "authResponse")
public class ThreeDPaymentInitResponse extends BaseResponse {

    @XmlElement(name = "amount")
    public String amount;

    @XmlElement(name = "orderId")
    public String orderId;

}

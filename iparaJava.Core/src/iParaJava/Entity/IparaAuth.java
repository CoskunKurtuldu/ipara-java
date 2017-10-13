package iParaJava.Entity;

import java.util.ArrayList;
import javax.xml.bind.annotation.*;

/**
 * @author fcoskun
 * @refactoredby oaksoy
 */
@XmlRootElement(name = "auth")
public class IparaAuth {

    @XmlElement(name = "threeD")
    public String threeD;

    @XmlElement(name = "orderId")
    public String orderId;

    @XmlElement(name = "amount")
    public String amount;

    @XmlElement(name = "echo")
    public String echo;

    @XmlElement(name = "cardOwnerName")
    public String cardOwnerName;

    @XmlElement(name = "cardNumber")
    public String cardNumber;

    @XmlElement(name = "cardExpireMonth")
    public String cardExpireMonth;

    @XmlElement(name = "cardExpireYear")
    public String cardExpireYear;

    @XmlElement(name = "installment")
    public String installment;

    @XmlElement(name = "cardCvc")
    public String cvc;

    @XmlElement(name = "mode")
    public String mode;

    @XmlElement(name = "vendorId")
    public String vendorId;

    @XmlElement(name = "threeDSecureCode")
    public String threeDSecureCode;

    @XmlElementWrapper(name = "products")
    @XmlElement(name = "product")
    public ArrayList<Product> products;

    @XmlElement(name = "purchaser")
    public Purchaser purchaser;

}

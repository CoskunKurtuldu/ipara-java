package iParaJava.Entity;

import javax.xml.bind.annotation.*;

/**
 * @author fcoskun
 * @refactoredby oaksoy
 */
@XmlRootElement(name = "purchaser")
public class Purchaser {

    @XmlElement(name = "name")
    public String name;

    @XmlElement(name = "surname")
    public String surname;

    @XmlElement(name = "birthDate")
    public String birthDate;

    @XmlElement(name = "email")
    public String email;

    @XmlElement(name = "gsmNumber")
    public String gsmNumber;

    @XmlElement(name = "tcCertificate")
    public String tcCertificate;

    @XmlElement(name = "clientIp")
    public String clientIp;

    @XmlElement(name = "invoiceAddress")
    public PurchaserAddress invoiceAddress;

    @XmlElement(name = "shippingAddress")
    public PurchaserAddress shippingAddress;

}

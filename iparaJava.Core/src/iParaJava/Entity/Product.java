package iParaJava.Entity;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author fcoskun
 * @refactoredby oaksoy
 */
@XmlRootElement(name = "product")
public class Product {

    @XmlElement(name = "productCode")
    public String code;

    @XmlElement(name = "productName")
    public String title;

    @XmlElement(name = "quantity")
    public String quantity;

    @XmlElement(name = "price")
    public String price;

}

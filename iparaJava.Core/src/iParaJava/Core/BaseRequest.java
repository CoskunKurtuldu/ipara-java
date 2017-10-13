package iParaJava.Core;

import com.google.gson.annotations.SerializedName;

/**
 * @author fcoskun
 * @refactoredby oaksoy
 */
public class BaseRequest extends Base {

    @SerializedName("echo")
    public String echo;

    @SerializedName("mode")
    public String mode;

}

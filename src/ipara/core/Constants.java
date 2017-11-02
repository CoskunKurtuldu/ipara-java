package ipara.core;

public interface Constants {

	interface IparaHTTPHeaders {

		public static final String TRANSACTION_DATE = "transactionDate";
		public static final String VERSION = "version";
		public static final String TOKEN = "token";

	}

	interface StandardHTTPHeaders {

		public static final String ACCEPT = "Accept";
		public static final String CONTENT_TYPE = "Content-Type";

	}

	interface Formats {

		public static final String SHA1 = "SHA1";
		public static final String UTF8 = "UTF-8";

	}

	interface ContentTypes {

		public static final String APPLICATION_XML_UTF8 = "application/xml;charset=UTF-8";
		public static final String APPLICATION_JSON_UTF8 = "application/json;charset=UTF-8";

	}

	interface HTTPMethods {

		public static final String POST = "POST";
		public static final String GET = "GET";

	}

}

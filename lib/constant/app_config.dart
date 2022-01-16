class AppConfig {
  static String pixabayAPIkey = "25246154-e3465523f8c2469f803842543";

  static const bool HTTPS = true;

  static const DOMAIN_PATH = "pixabay.com";

  static const String API_ENDPATH = "api/";

  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String RAW_BASE_URL = "${PROTOCOL}${DOMAIN_PATH}";
  static const String BASE_URL = "${RAW_BASE_URL}/${API_ENDPATH}";
}

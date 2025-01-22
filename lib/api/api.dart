class ApiConfig {
  static String baseUrl = "https://api.sadik.work";
  static String proxyServer = "https://cors-proxy-five-blond.vercel.app/bypass/image?url=";

  static Map<String, String> regularHeader() => {"Content-Type": "application/json"};

  static Map<String, String> authHeader(String accessToken) => {"Content-Type": "application/json", "Authorization": "Bearer $accessToken"};
}
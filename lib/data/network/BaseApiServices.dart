abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url, dynamic header);
  Future<dynamic> getPostApiResponse(bool isSecure, String url, dynamic data);
}

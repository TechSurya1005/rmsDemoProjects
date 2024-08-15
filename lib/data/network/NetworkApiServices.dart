import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';
import 'BaseApiServices.dart';

class NetworkApiServices extends BaseApiServices {
  // Map<String, String> header = {
  //   'Content-type': 'application/json',
  //   'Accept': 'application/json',
  // };

  @override
  Future<dynamic> getGetApiResponse(String url, dynamic header) async {
    dynamic responseJson;
    print("URL============> $url");
    try {
      final response = await http
          .get(Uri.parse(url), headers: header)
          .timeout(const Duration(seconds: 5));
      responseJson = returnResponse(response);
      print("Body Response : ${response.body}");
    } on SocketException {
      throw FetchDataExceptions("No Internet Connections");
    }
    return responseJson;
  }

  @override
  Future<dynamic> getPostApiResponse(
      bool isSecure, String url, dynamic data) async {
    var uri = Uri.parse(url);
    // var payload = json.encode(data);
    try {
      final response = isSecure
          ? await http
              .post(uri,
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                    'Authorization': 'Bearer access_token_UniQueSolution'
                  },
                  body: data)
              .timeout(const Duration(seconds: 5))
          : await http
              .post(uri,
                  headers: {
                    // 'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: data)
              .timeout(const Duration(seconds: 5));
      // print("Body Response ${response.body}");
      return returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions('No Internet connection');
    }
  }

  Future<dynamic> postimage(
    bool isSecure,
    String url,
    dynamic data,
    String fieldName,
    dynamic imagepath,
  ) async {
    print(data);
    try {
      var headers = {'Content-Type': 'application/json; charset=UTF-8'};
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(data);
      if (imagepath != null) {
        if (imagepath is String && imagepath.isNotEmpty) {
          // Handle file path
          request.files.add(await http.MultipartFile.fromPath(
            fieldName,
            imagepath,
          ));
        } else if (imagepath is Uint8List) {
          // Handle byte array
          request.files.add(http.MultipartFile.fromBytes(
            fieldName,
            imagepath,
            filename: 'upload.jpg', // You can specify any filename
          ));
        }
      }
      request.headers.addAll(headers);
      http.StreamedResponse response =
          await request.send().timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        var apiResponse = jsonDecode(await response.stream.bytesToString());
        return apiResponse;
      } else {
        print(response.reasonPhrase);
      }
    } on SocketException {
      throw FetchDataExceptions('No Internet connection $url');
    } catch (e) {
      // Handle any exceptions that occur during the request
      print("Error occurred during postimage: $e");
      throw FetchDataExceptions("Error occurred during postimage: $e");
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestExceptions("Invalid request ${response.body}");
      case 500:
        throw InvalidInputExceptions("Internal Server Error${response.body}");
      case 415:
        throw UnSupportedMediaType("Unsupported Media Type ${response.body}");
      case 404:
        throw UnAuthorizedException(response.body.toString());
      default:
        throw FetchDataExceptions(
            "Error occurred while communication with server " +
                'with status code ' +
                response.statusCode.toString());
    }
  }
}

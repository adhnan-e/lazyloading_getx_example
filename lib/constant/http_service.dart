import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<http.Response> getRequest(String url) async {
    if (kDebugMode) {
      print(url);
    }
    http.Response response;
    var client = http.Client();
    try {
      var uriResponse = await client.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
      });
      if (kDebugMode) {
        print("${uriResponse.statusCode}   ${uriResponse.body}");
      }
      response = uriResponse;
    } finally {
      client.close();
    }

    return response;
  }
  Future<http.Response> postRequest(String url, var data) async {
    if (kDebugMode) {
      print("url:- $url  data:- $data");
    }
    http.Response response;
    var client = http.Client();
    try {
      var uriResponse =
          await client.post(Uri.parse(url), body: json.encode(data), headers: {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
      });
      if (kDebugMode) {
        print("${uriResponse.statusCode}   ${uriResponse.body}");
      }
      response = uriResponse;
    } finally {
      client.close();
    }

    return response;
  }
  Future<http.Response> postEmptyRequest(String url) async {
    http.Response response;
    var client = http.Client();
    try {
      var uriResponse =
      await client.post(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
      });
      if (kDebugMode) {
        print("${uriResponse.statusCode}   ${uriResponse.body}");
      }
      response = uriResponse;
    } finally {
      client.close();
    }
    return response;
  }
}

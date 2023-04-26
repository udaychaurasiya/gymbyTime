import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gym/mathod/app_exception.dart';
class BaseClient{
  static const int TIME_OUT_DURATION = 40;
  Future<dynamic> post(String url,dynamic body)async
  {
    print(url);
    print(body);

    var uri=Uri.parse(url);
    var payload=body;
    try {
      var response=await http.post(uri,
          headers:   {
            'x-api-key': 'api@vlesociety.com',
            'Cookie': 'ci_session=77b98a1401bc868f2531b191461b6c9240cec171'
          },
          body: payload).timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }
  Future<dynamic> get(String url)async
  {
    var uri=Uri.parse(url);
    try {
      var response=await http.get(uri,
        headers:   {
          'x-api-key': 'api@vlesociety.com',
        },
      ).timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  Future<dynamic> profileUpdate(String path,var bodyreq,String url )async
  {
    var uri=Uri.parse(url);
    try {
      var request = await http.MultipartRequest("POST", uri);
      if(path.isNotEmpty) request.files.add(await http.MultipartFile.fromPath('profile',path));
      request.fields.addAll(bodyreq);
      request.headers.addAll({'x-api-key': 'api@vlesociety.com'});
      var res = await request.send();
      var response=await http.Response.fromStream(res);
      return response.body;
      _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException('Error occured with code : ${response.statusCode}', response.request!.url.toString());
    }
  }
}
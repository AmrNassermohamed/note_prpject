import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_prpject/constants/key_words.dart';





class ServicesHandler {

  Future<dynamic> getService(
      {String? urlSuffix,
        Map<String, String>? headers,
        String? externalUrl,required bool ex,statusCode}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        String userToken;
        headers ??= {
            "Content-Type": "application/json",
          };

        String fullUrl = "";
        if (externalUrl != null) {
          fullUrl = externalUrl;
        } else {
          fullUrl = KeyWords.exlUrl + urlSuffix!;
        }


        print("Full headers");
        print(headers.toString());
        final response = await http.get(Uri.parse(fullUrl),headers: headers);
        print("Get service response");
        print(json.decode(response.body.toString()));
        print("Status code ${response.statusCode}");
        if (response.statusCode == 200) {
          if(statusCode==true) {
            return 200;
          }else{
            print(json.decode(response.body.toString()));
            print(response.body);
            return json.decode(utf8.decode(response.bodyBytes));
          }

        }
        else if (response.statusCode >= 400 && response.statusCode < 500) {
          // If that call was not successful, throw an error.
          throw Exception(response.body);
        } else {
          throw Exception(["Failed to connect to server!"]);
        }
      }
    } on SocketException catch (error) {
      throw Exception(["Please check your internet connection"]);
    } catch (error) {
      print(error.toString() + 'llllllllllllllllllllllllllll');
      throw Exception(error);
    }
  }



  Future<dynamic> postService(
      {required String urlSuffix,
      dynamic requestBody,
        Map<String, String>? headers,
        bool sendBodyAsMap = false,returnBody}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
     //   String userToken = await SharedPreferenceHandler.getToken();
        headers ??= {
            "Content-Type": "application/json",

          };



        print("Request body");
        print(requestBody);
        var finalUrl = KeyWords.exlUrl + urlSuffix;
        print("Request URL");
        print(finalUrl);
        final response = await http.post(Uri.parse(finalUrl),
            headers: headers,
            body:  requestBody );
        print("Response status conde ${response.statusCode}");
        print("Raw response");
        print(response.body);


        if (response.statusCode == 200&&response.statusCode == 201) {
        if(returnBody==true){
          print(response.body);
          return json.decode(utf8.decode(response.bodyBytes));
        //  return response;
        }else {

          return 200;
        }

        } else if (response.statusCode > 201 && response.statusCode < 500) {
          // If that call was not successful, throw an error.

          return json.decode(response.body);
          throw Exception(json.decode(response.body));
        } else {
          if(returnBody==true) {
            return json.decode(utf8.decode(response.bodyBytes));
          }else{
            return response.statusCode;
          }
//throw jsonDecode(response.body);
//          throw Exception(["Failed to connect to server!"]);
        }
      }
    } on SocketException catch (error) {

      //  print("llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
     throw error;
      //  print("");


    }
  }




}

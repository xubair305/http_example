import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class BaseClient {
  var client = http.Client();

  String baseUrl = "https://reqres.in/api";

  Future<dynamic> get(String api) async {
    // var uri = Uri.https("reqres.in", "/api$api", {"id": "12"});
    var uri = Uri.parse(baseUrl + api);
    var header = {
      "Authorization": "Bearer sciiucbub",
      "app_version": "2.0.5",
    };
    var response = await client.get(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //thrown exception
      log("Exception");
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(object);
    var header = {
      "Content-Type": 'application/json',
      "Authorization": "Bearer sciiucbub",
      "app_version": "2.0.5",
    };
    var response = await client.post(uri, body: payload, headers: header);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {
      //thrown exception
      log("Exception");
    }
  }

  Future<dynamic> put(String api, dynamic object) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(object);
    var header = {
      "Content-Type": 'application/json',
      "Authorization": "Bearer sciiucbub",
      "app_version": "2.0.5",
    };
    var response = await client.put(uri, body: payload, headers: header);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {
      //thrown exception
      log("Exception");
    }
  }

  Future<dynamic> delete(String api) async {
    var uri = Uri.parse(baseUrl + api);
    var header = {
      "Authorization": "Bearer sciiucbub",
      "app_version": "2.0.5",
    };
    var response = await client.delete(uri, headers: header);
    if (response.statusCode == 204  ) {
      return response.body;
    } else {
      //thrown exception
      log("Exception");
    }
  }
}

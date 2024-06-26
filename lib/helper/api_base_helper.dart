// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:interpretbot/helper/errors.dart';
import 'package:interpretbot/helper/getx_helper.dart';
import 'package:interpretbot/helper/global_variables.dart';
import 'package:interpretbot/helper/urls.dart';

class ApiBaseHelper {
  final String baseUrl = Urls.baseURL;
  final String token = GlobalVariables.token.value;

  Future<dynamic> postMethod({required String url, dynamic body}) async {
    final String token = GlobalVariables.token.value;
    Map<String, String> header = {
      'token': token,
      'Content-Type': 'application/json'
    };

    try {
      body = json.encode(body);
      print('*********************** Request ********************************');
      print(token);
      print(body);
      print(baseUrl + url);

      Uri urlValue = Uri.parse(baseUrl + url);
      http.Response response = await http
          .post(urlValue, headers: header, body: body)
          .timeout(const Duration(seconds: 45));

      Map<String, dynamic> parsedJSON = jsonDecode(response.body);
      print(
          '*********************** Response **********************************');
      print(urlValue.toString());
      print('body => $body');
      print(parsedJSON);
      print('&&&&&&&&&&&&&&&&&&&&&&& End of Response &&&&&&&&&&&&&&&&&&&&&&\n');
      return parsedJSON;
    } on SocketException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.noInternetError);
      throw Errors.noInternetError;
    } on TimeoutException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.timeOutException);
      throw Errors.timeOutException;
    } on FormatException catch (e) {
      print(e);
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.formatException);
      throw Errors.formatException;
    } catch (e) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.generalApiError);
      throw e.toString();
    }
  }

  Future<dynamic> postMethodFormData(
      {required String url,
      // required Map<String, String> fields,
      http.MultipartFile? imgFile}) async {
    final String token = GlobalVariables.token.value;
    try {
      print(Urls.baseURL + url);
      Uri urlValue = Uri.parse(Urls.baseURL + url);
      http.MultipartRequest request = http.MultipartRequest('POST', urlValue);
      request.headers['token'] = token;
      if (imgFile != null) {
        request.files.add(imgFile);
      }

      // request.fields.addAll(fields);
      http.StreamedResponse response = await request.send();

      Map<String, dynamic> parsedJson =
          await jsonDecode(await response.stream.bytesToString());

      print('********************** Response ********************************');
      // print(fields);
      print(urlValue.toString());
      print(parsedJson.toString());

      print('&&&&&&&&&&&&&&&&&&&&&&& End of Response &&&&&&&&&&&&&&&&&&&&&&\n');
      
      return parsedJson;
    } on SocketException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.noInternetError);
      throw Errors.noInternetError;
    } on TimeoutException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.timeOutException);
      throw Errors.timeOutException;
    } on FormatException catch (e) {
      print(e);
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.formatException);
      throw Errors.formatException;
    } catch (e) {
      print(e);
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.generalApiError);
      throw e.toString();
    }
  }

  Future<dynamic> postMethodImagesFormData(
      {required String url,
      Map<String, String>? fields,
      required List<http.MultipartFile> filesList}) async {
    final String token = GlobalVariables.token.value;
    try {
      print(Urls.baseURL + url);
      Uri urlValue = Uri.parse(Urls.baseURL + url);
      http.MultipartRequest request = http.MultipartRequest('POST', urlValue);
      request.headers['token'] = token;
      request.files.addAll(filesList);
      if (fields != null) {
        request.fields.addAll(fields);
      }
      http.StreamedResponse response =
          await request.send().timeout(const Duration(seconds: 20));
      Map<String, dynamic> parsedJson =
          await jsonDecode(await response.stream.bytesToString());

      print('********************** Response ********************************');
      print(filesList);
      print(urlValue.toString());
      print(parsedJson.toString());
      print('&&&&&&&&&&&&&&&&&&&&&&& End of Response &&&&&&&&&&&&&&&&&&&&&&\n');
      return parsedJson;
    } on SocketException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.noInternetError);
      throw Errors.noInternetError;
    } on TimeoutException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.timeOutException);
      throw Errors.timeOutException;
    } on FormatException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.formatException);
      throw Errors.formatException;
    } catch (e) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.generalApiError);
      throw e.toString();
    }
  }

  Future<dynamic> getMethod({required String url}) async {
    final String token = GlobalVariables.token.value;
    Map<String, String> header = {
      'token': token,
      'Content-Type': 'application/json'
    };

    try {
      Uri urlValue = Uri.parse(baseUrl + url);
      print(urlValue);
      http.Response response = await http
          .get(urlValue, headers: header)
          .timeout(const Duration(seconds: 15));

      Map<String, dynamic> parsedJSON = jsonDecode(response.body);
      print(
          '*********************** Response **********************************');
      print(urlValue.toString());
      print(parsedJSON);
      print('&&&&&&&&&&&&&&&&&&&&&&& End of Response &&&&&&&&&&&&&&&&&&&&&&\n');
      return parsedJSON;
    } on SocketException {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.noInternetError);
      throw Errors.noInternetError;
    } on TimeoutException {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.timeOutException);
      throw Errors.timeOutException + url;
    } on FormatException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.formatException);
      throw Errors.formatException;
    } catch (e) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.generalApiError);
      throw e.toString();
    }
  }

  Future<dynamic> deleteMethod({required String url}) async {
    final String token = GlobalVariables.token.value;
    Map<String, String> header = {
      'token': token,
      'Content-Type': 'application/json'
    };

    try {
      Uri urlValue = Uri.parse(baseUrl + url);
      print(urlValue);
      http.Response response = await http
          .delete(urlValue, headers: header)
          .timeout(const Duration(seconds: 15));

      Map<String, dynamic> parsedJSON = jsonDecode(response.body);
      print(
          '*********************** Response **********************************');
      print(urlValue.toString());
      print(parsedJSON);
      print('&&&&&&&&&&&&&&&&&&&&&&& End of Response &&&&&&&&&&&&&&&&&&&&&&\n');
      return parsedJSON;
    } on SocketException {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.noInternetError);
      throw Errors.noInternetError;
    } on TimeoutException {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.timeOutException);
      throw Errors.timeOutException + url;
    } on FormatException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.formatException);
      throw Errors.formatException;
    } catch (e) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.generalApiError);
      throw e.toString();
    }
  }

  Future<dynamic> putMethod({required String url, dynamic body}) async {
    final String token = GlobalVariables.token.value;
    Map<String, String> header = {
      'token': token,
      'Content-Type': 'application/json'
    };

    try {
      body = jsonEncode(body);
      print('*********************** Request ********************************');
      print(body);
      print(baseUrl + url);

      Uri urlValue = Uri.parse(baseUrl + url);
      http.Response response = await http
          .put(urlValue, headers: header, body: body)
          .timeout(const Duration(seconds: 15));

      Map<String, dynamic> parsedJSON = jsonDecode(response.body);
      print(
          '*********************** Response **********************************');
      print(urlValue.toString());
      print('body => $body');
      print(parsedJSON);
      print('&&&&&&&&&&&&&&&&&&&&&&& End of Response &&&&&&&&&&&&&&&&&&&&&&\n');
      return parsedJSON;
    } on SocketException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.noInternetError);
      throw Errors.noInternetError;
    } on TimeoutException catch (_) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.timeOutException);
      throw Errors.timeOutException;
    } on FormatException catch (e) {
      print(e);
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.formatException);
      throw Errors.formatException;
    } catch (e) {
      GlobalVariables.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.generalApiError);
      throw e.toString();
    }
  }
}

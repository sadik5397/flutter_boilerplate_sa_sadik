import 'dart:convert';
import '../api/constant.dart';
import 'snackbar_message.dart';
import 'package:http/http.dart' as http;
import 'global_function.dart';
import 'print.dart';

export '../api/api.dart';

class Http {
  static _beforeCall(String apiRoute, Map? body) {
    Print.warning("-----------$apiRoute-----------");
    Print.warning("-----------body-----------");
    Print.debug(prettyJson(body));
  }

  static _gotResult(Map result) {
    Print.warning("-----------result-----------");
    Print.info(prettyJson(result));
    Print.warning("----------------------");
  }

  static _ifSuccess(Map result, Function(String?)? onSuccess) {
    Print.success((result["success"]).toString());
    onSuccess?.call((result["success"]).toString());
  }

  static _ifFails(Map result, Function(String?)? onError) async {
    Print.error(cleanedString(result["message"]));
    SnackBarMessage.error(context: navigatorKey.currentState!.context, label: cleanedString(result["message"]));
    if (result["statusCode"] == 401) {
      SnackBarMessage.error(context: navigatorKey.currentState!.context, title: "Unauthorized", label: "Please sign in again");
    }
    onError?.call(cleanedString(result["message"]));
  }

  static _onException(dynamic e, Function(String?)? onError) {
    Print.error(e.toString());
    SnackBarMessage.error(context: navigatorKey.currentState!.context, label: e.toString());
    onError?.call(e.toString());
  }

  static Future<dynamic> call(String url, {Function(String?)? onSuccess, Function(String?)? onError}) async {
    try {
      _beforeCall(url, null);
      var response = await http.get(Uri.parse(url));
      Map result = jsonDecode(response.body);
      _gotResult(result);
      if (response.statusCode == 200) {
        _ifSuccess(result, (p0) => onSuccess?.call(p0));
        return result;
      } else {
        _ifFails(result, (p0) => onError?.call(p0));
      }
    } on Exception catch (e) {
      _onException(e, (p0) => onError?.call(p0));
    }
    return null;
  }

  // static Future<dynamic> get(String apiRoute, {Function(String?)? onSuccess, Function(String?)? onError}) async {
  //   try {
  //     String accessToken = await LocalSave.get(key: "accessToken") ?? "";
  //     _beforeCall(apiRoute, null);
  //     var response = await http.get(Uri.parse("${ApiConfig.baseUrl}$apiRoute"), headers: ApiConfig.authHeader(accessToken));
  //     Map result = jsonDecode(response.body);
  //     _gotResult(result);
  //     if (result["success"] == true) {
  //       _ifSuccess(result, (p0) => onSuccess?.call(p0));
  //       return result;
  //     } else {
  //       _ifFails(result, (p0) => onError?.call(p0));
  //     }
  //   } on Exception catch (e) {
  //     _onException(e, (p0) => onError?.call(p0));
  //   }
  //   return null;
  // }
  //
  // static Future<dynamic> post(String apiRoute, {Map? body, Function(String?)? onSuccess, Function(String?)? onError}) async {
  //   try {
  //     String accessToken = await LocalSave.get(key: "accessToken") ?? "";
  //     _beforeCall(apiRoute, body);
  //     var response = await http.post(Uri.parse("${ApiConfig.baseUrl}$apiRoute"), headers: ApiConfig.authHeader(accessToken), body: body == null ? null : jsonEncode(body));
  //     Map result = jsonDecode(response.body);
  //     _gotResult(result);
  //     if (result["success"] == true) {
  //       _ifSuccess(result, (p0) => onSuccess?.call(p0));
  //       return result;
  //     } else {
  //       _ifFails(result, (p0) => onError?.call(p0));
  //     }
  //   } on Exception catch (e) {
  //     _onException(e, (p0) => onError?.call(p0));
  //   }
  //   return null;
  // }
  //
  // static Future<dynamic> put(String apiRoute, {Map? body, Function(String?)? onSuccess, Function(String?)? onError}) async {
  //   try {
  //     String accessToken = await LocalSave.get(key: "accessToken") ?? "";
  //     _beforeCall(apiRoute, body);
  //     var response = await http.put(Uri.parse("${ApiConfig.baseUrl}$apiRoute"), headers: ApiConfig.authHeader(accessToken), body: body == null ? null : jsonEncode(body));
  //     Map result = jsonDecode(response.body);
  //     _gotResult(result);
  //     if (result["success"] == true) {
  //       _ifSuccess(result, (p0) => onSuccess?.call(p0));
  //       return result;
  //     } else {
  //       _ifFails(result, (p0) => onError?.call(p0));
  //     }
  //   } on Exception catch (e) {
  //     _onException(e, (p0) => onError?.call(p0));
  //   }
  //   return null;
  // }
  //
  // static Future<dynamic> delete(String apiRoute, {Map? body, Function(String?)? onSuccess, Function(String?)? onError}) async {
  //   try {
  //     String accessToken = await LocalSave.get(key: "accessToken") ?? "";
  //     _beforeCall(apiRoute, body);
  //     var response = await http.delete(Uri.parse("${ApiConfig.baseUrl}$apiRoute"), headers: ApiConfig.authHeaderNoBody(accessToken), body: body == null ? null : jsonEncode(body));
  //     Map result = jsonDecode(response.body);
  //     _gotResult(result);
  //     if (result["success"] == true) {
  //       _ifSuccess(result, (p0) => onSuccess?.call(p0));
  //       return result;
  //     } else {
  //       _ifFails(result, (p0) => onError?.call(p0));
  //     }
  //   } on Exception catch (e) {
  //     _onException(e, (p0) => onError?.call(p0));
  //   }
  //   return null;
  // }
}

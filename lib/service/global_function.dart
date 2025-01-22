import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'print.dart';

randomNumber(int max) {
  Random random = Random();
  return random.nextInt(max);
}

randomNumberBetween(int min, int max) {
  Random random = Random();
  return random.nextInt(max) + min;
}

String generateRandomString(int len) {
  var r = Random();
  const characters = '1234567890';
  return List.generate(len, (index) => characters[r.nextInt(characters.length)]).join();
}

String currencyDigit(num num) => NumberFormat("##,##,##,###.##", "en").format(num);

bool isOnMobileScreen(BuildContext context) => MediaQuery.of(context).size.width > 650;

String prettyJson(dynamic map) {
  var encoder = const JsonEncoder.withIndent("     ");
  return encoder.convert(map);
}

String capitalizeAllWord(var value) {
  value = value.toString();
  if (value == "") {
    return value;
  } else {
    var result = value[0].toUpperCase();
    for (int i = 1; i < value.length; i++) {
      (value[i - 1] == " ") ? result = result + value[i].toUpperCase() : result = result + value[i];
    }
    return result;
  }
}

String capitalizeFirstCharacterOfSentence(var value) {
  value = value.toString();
  if (value == "") {
    return value;
  } else {
    var result = value[0].toUpperCase();
    for (int i = 1; i < value.length; i++) {
      result = result + value[i];
    }
    return result;
  }
}

String cleanedString(var input) => capitalizeAllWord(input.toString().replaceAll("_", " ").replaceAll("{", "").replaceAll("}", "").replaceAll("[", "").replaceAll("]", "").replaceAll(", ", "\n"));

String minutesToHourMinute(int minutes) {
  int hours = minutes ~/ 60;
  int remainingMinutes = minutes % 60;
  return "${hours}h ${remainingMinutes}m";
}

Duration hourMinuteToDuration(String hourMinute) {
  List<String> parts = hourMinute.split(" ");
  int hours = int.parse(parts[0].replaceAll("h", ""));
  int minutes = int.parse(parts[1].replaceAll("m", ""));
  return Duration(hours: hours, minutes: minutes);
}

double durationToProgress(Duration current, Duration total) {
  double progress = current.inSeconds / total.inSeconds;
  return progress;
}

String? findValueToKey({required dynamic object, required String? string, required String inputKey, required String outputKey}) {
  if (string == null) return null;
  try {
    final matchingResult = object.firstWhere((entry) => entry[inputKey] == string);
    return matchingResult != null ? matchingResult[outputKey].toString() : null;
  } on Exception catch (e) {
    Print.debug(e.toString());
    return null;
  }
}

String? findKeyToValue({required dynamic object, required String? string, required String inputKey, required String outputKey}) {
  if (string == null) return null;
  List list = (object as List).map((item) => item).toList();
  for (int i = 0; i < list.length; i++) {
    if (list[i][inputKey] == string) return list[i][outputKey];
  }
  return null;
}

String? extractBase64FromBase64ImageData(String? dataUri) => dataUri?.split(',').last;

Future<String> extractBase64FromImageUrl(String imageUrl) async => base64Encode((await http.get(Uri.parse(imageUrl))).bodyBytes);

String webPdfCheck(String? string) {
  String newString = "";
  if (string != "null" && string != null) newString = string.replaceAll("়", "");
  // newString = newString.toBijoyIf(!isEnglish(newString));
  return newString;
}

bool isEnglish(String? str) {
  if (str == null) return true;
  for (int i = 0; i < str.length; i++) {
    int charCode = str.codeUnitAt(i);
    if ((charCode < 65 || charCode > 90) && // A-Z
        (charCode < 97 || charCode > 122) && // a-z
        (charCode < 48 || charCode > 57) && // 0-9
        (charCode != 32) && // space
        (charCode < 33 || charCode > 47) && // basic punctuations
        (charCode < 58 || charCode > 64) && // more basic punctuations
        (charCode < 91 || charCode > 96) && // more basic punctuations
        (charCode < 123 || charCode > 126)) // more basic punctuations
        {
      return false;
    }
  }
  return true;
}
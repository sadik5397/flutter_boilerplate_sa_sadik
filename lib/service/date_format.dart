import 'package:intl/intl.dart';

String primaryDateTime(String dateTime) => DateFormat('dd MMM yyyy | hh:mm a').format(DateTime.parse(dateTime));

String primaryDate(String dateTime) => DateFormat('dd MMM yyyy').format(DateTime.parse(dateTime));

String primaryDateShort(String dateTime) => DateFormat("dd MMM yy").format(DateTime.parse(dateTime));

String primaryDateYYYYMMDD(DateTime dateTime) => DateFormat('yyyy-M-dd').format(dateTime);

String primaryTime(String dateTime) => DateFormat('hh:mm a').format(DateTime.parse(dateTime));

int apiDateTime(DateTime dateTime) => (DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute).toUtc().millisecondsSinceEpoch) ~/ 1000;

String apiDateNTime(DateTime date, DateTime time) => ((DateTime(date.year, date.month, date.day, time.hour, time.minute).toUtc().millisecondsSinceEpoch) / 1000).toString();

String apiDateNTimeAdd6Hr(DateTime date, DateTime time) => ((DateTime(date.year, date.month, date.day, time.hour, time.minute).add(const Duration(hours: 6)).toUtc().millisecondsSinceEpoch) / 1000).toString();
import '../api/app_info.dart';
import 'date_format.dart';

initialConfiguration() async {
  //setPathUrlStrategy();

  // ignore: avoid_print
  print("\x1B[36m"
      "---- ${MyAppInfo.appName} | ${primaryDateTime(DateTime.now().toString())} ----\n---- "
      "Developed by :----\n---- "
      "S.a. Sadik | sadik5397@gmail.com | https://github.com/sadik5397 ----\n---- "
      "www.sadik.work/apps ----"
      "\x1B[0m");
}

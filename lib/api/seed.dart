import 'dart:math';

import 'package:aosed_survey/service/global_function.dart';

class Seed {
  static List<String> example = ["Lorem", "Ipsum", "Dolor", "Set"];
  static List<String> randomNames = [
    'Sakura Tanaka',
    'Raj Patel',
    'Li Wei',
    'Yukihiro Suzuki',
    'Mei Chen',
    'Haruka Nakamura',
    'Ravi Kapoor',
    'Ji-hoon Kim',
    'Ananya Gupta',
    'Takashi Yamamoto',
    'Lei Wang',
    'Ayesha Khan',
    'Hiroshi Tanaka',
    'Priya Sharma',
    'Kazuki Sato',
    'Shan Li',
    'Arjun Singh',
    'Xia Liu',
    'Min-ji Park',
    'Rahul Verma',
    'Mai Nguyen',
    'Kenta Yoshida',
    'Siti Nurul Azizah',
    'Rajesh Patel',
    'Lina Chen',
    'Satoshi Suzuki',
    'Nina Kapoor',
    'Jin Chen',
    'Anushka Sharma',
    'Yusuke Tanaka',
    'Aisha Khan',
    'Chen Wei',
    'Hana Kim',
    'Rahul Kumar',
    'Hiroko Takahashi',
    'Sanjay Kumar',
    'Miyuki Nakamura',
    'Arjun Sharma',
    'Mei Lin',
    'Akio Yamamoto',
    'Fatima Ali',
    'Takeshi Sato',
    'Amir Khan',
    'Yuki Saito',
    'Sara Ahmed',
    'Hong Wu',
    'Jin-ho Lee'
  ];

  static List<String> randomNameList(int count) => (List<String>.from(randomNames)..shuffle(Random())).take(count).toList();
  static String randomName = randomNames[Random().nextInt(randomNames.length)];

  static String randomString(int len) => generateRandomString(len);

  static String randomNumber(int len) => generateRandomNumber(len);

  static String randomAvatarUrl([int? size]) => "https://i.pravatar.cc/${size ?? 150}?u=${generateRandomNumber(4)}";

  static String randomImageUrl([int? height, int? width]) => "https://picsum.photos/${height ?? 512}/${width ?? 512}?random=${generateRandomNumber(4)}";

  static List<Map> randomObjects = List.generate(randomNames.length, (index) => {'id': index + 1, 'value': randomNames[index], 'title': randomNames[index]})..shuffle();
}

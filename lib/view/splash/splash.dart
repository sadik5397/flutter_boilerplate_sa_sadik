import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/no_data.dart';
import '_pr/pr_splash.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<ProviderSplash>(builder: (context, p, child) {
      return Center(child: NoData.loading());
    }));
  }
}

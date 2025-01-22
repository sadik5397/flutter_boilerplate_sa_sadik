import 'package:flutter/material.dart';

class ProviderSplash with ChangeNotifier {
  //region default functions
  void refresh() => notifyListeners();
  Future<void> initiate() async {
    pageLoading = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => refresh());
  }
  //endregion

  //region variables
  bool pageLoading = true;
  //endregion

  //region other functions
  //endregion

  //region api functions
  //endregion
}

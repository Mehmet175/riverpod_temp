import 'package:flutter/material.dart';
import 'package:ici_menu/app/common_view/loading_widget.dart';

class PageLoadingDialog {
  static bool _isLoading = false;

  static bool get isLoading => _isLoading;

  static void showLoading(BuildContext context) {
    if (!_isLoading) {
      _isLoading = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => WillPopScope(
          onWillPop: () async => false,
          child: const Center(child: LoadingWidget()),
        ),
      );
    }
  }

  static void hideLoading(BuildContext context) {
    if (_isLoading) {
      _isLoading = false;
      Navigator.of(context).pop();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:ici_menu/app/resource/value_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              strokeWidth: AppSize.s5,
            ),
          ],
        ),
      ],
    );
  }
}

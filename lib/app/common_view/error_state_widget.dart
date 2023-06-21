import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ici_menu/app/resource/font_manager.dart';
import 'package:ici_menu/app/resource/string_manager.dart';
import 'package:ici_menu/app/resource/value_manager.dart';

class ErrorStateWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback buttonOnClick;

  const ErrorStateWidget({
    super.key,
    required this.errorMessage,
    required this.buttonOnClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sentiment_very_dissatisfied,
              color: Colors.redAccent,
              size: AppSize.s100,
            ),
          ],
        ),
        const SizedBox(
          height: AppSize.s10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: AppSize.s12,
          ),
          child: Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: FontSize.s18,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
        ),
        const SizedBox(
          height: AppSize.s18,
        ),
        Row(
          children: [
            const SizedBox(
              width: AppSize.s22,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                AppStrings.refresh.tr(),
              ),
            ),
            const SizedBox(
              width: AppSize.s22,
            ),
          ],
        )
      ],
    );
  }
}

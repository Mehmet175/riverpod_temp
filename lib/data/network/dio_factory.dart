import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ici_menu/app/constants.dart';
import 'package:ici_menu/app/di/di_order.dart';
import 'package:ici_menu/app/pref/token_pref.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@LazySingleton(order: DiOrder.dioFactory)
class DioFactory {
  final TokenPref tokenPref;
  DioFactory(this.tokenPref);

  Future<Dio> getDio() async {
    final Dio dio = Dio();

    String? token = tokenPref.getValue();

    Map<String, String> headers = {
      if (token != null) "Authorization": token,
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }
}

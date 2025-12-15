import 'dart:async';
import 'dart:developer';

import 'package:api_package/api_package.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final talker = Talker();
  Bloc.observer = TalkerBlocObserver(talker: talker);

  ApiPackage.initialize(
    ApiConfig(
      baseUrl: 'https://rxce.com/',
      interceptors: [
        TalkerDioLogger(talker: talker),
      ],
    ),
  );

  runApp(await builder());
}

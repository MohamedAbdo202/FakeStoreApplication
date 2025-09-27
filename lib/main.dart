import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz/app.dart';
import 'package:pyramakerz/core/constants/app_constants.dart';
import 'package:pyramakerz/core/di/injection_container.dart';
import 'package:pyramakerz/core/hive_service/hive_service.dart';
import 'package:pyramakerz/core/observers/bloc_observers.dart';
import 'package:pyramakerz/core/util/network/network_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.getInstance(boxName: AppConstants.boxName);
  configureDependencies();

  await DioHelper.init();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

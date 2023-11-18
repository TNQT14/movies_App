import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/repository/services/services_locator.dart';
import 'package:movies_app/screen/main_screen/main_screen.dart';
import 'package:movies_app/theme/theme_data/theme_data.dart';
import 'package:movies_app/utils/enum.dart';
import 'package:wakelock/wakelock.dart';
import 'contants/app_string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();
  ScreenUtil.ensureScreenSize();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppString.appTitle,
              theme: getThemeData[AppTheme.darkTheme],
              home: const MainScreen(),
            );
          },
        );
      },
    );
  }
}

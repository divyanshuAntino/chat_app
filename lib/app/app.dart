import 'package:chatapp/app/domain/app_cubit.dart';
import 'package:chatapp/app/domain/app_state.dart';
import 'package:chatapp/models/locale.dart';
import 'package:chatapp/responsive/app_screen_util.dart';
import 'package:chatapp/routes/app_routes.dart';
import 'package:chatapp/utils/dependency_injection/blocs/root_bloc_injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildElements(rebuild);
  }

  @override
  void initState() {
    super.initState();
    // initialFirbaseMessaging();
    // setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                AppScreenUtil().init(constraints, orientation);
                context.setLocale(context.locale);
                return RootBlocInjection(
                  child: BlocConsumer<AppCubit, AppState>(
                    listener: (context, state) {
                      context.setLocale(state.locale ?? LocaleType.english);
                      rebuildAllChildren(context);
                    },
                    builder: (context, state) {
                      return MaterialApp.router(
                        builder: (context, child) =>
                            ResponsiveBreakpoints.builder(
                          child: child!,
                          breakpoints: [
                            const Breakpoint(start: 0, end: 450, name: MOBILE),
                            const Breakpoint(
                                start: 451, end: 800, name: TABLET),
                            const Breakpoint(
                                start: 801, end: 1920, name: DESKTOP),
                            const Breakpoint(
                                start: 1921, end: double.infinity, name: '4K'),
                          ],
                        ),
                        title: "Chat App",
                        debugShowCheckedModeBanner: false,
                        localizationsDelegates: context.localizationDelegates,
                        supportedLocales: context.supportedLocales,
                        locale: context.locale,
                        routerConfig: AppRoutes.appRouter,
                        darkTheme: ThemeData.dark(),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

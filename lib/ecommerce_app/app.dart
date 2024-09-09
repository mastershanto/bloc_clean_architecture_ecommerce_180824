import 'package:bloc_clean_architecture_ecommerce_180824/ecommerce_app/src/blocs/authentication/remember_switch_cubit.dart';
import 'package:bloc_clean_architecture_ecommerce_180824/ecommerce_app/src/blocs/blocs.dart';
import 'package:bloc_clean_architecture_ecommerce_180824/ecommerce_app/src/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/routes/route_pages.dart';
import 'theme/theme.dart';

class BlocEcommerceApp extends StatelessWidget {
  const BlocEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>SplashCubit()..startSplash()),
      BlocProvider(create: (context)=>RememberSwitchCubit()),
      BlocProvider(create: (context)=>SignupBloc()),
    ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            theme: const MaterialTheme(TextTheme()).light(),
            darkTheme: const MaterialTheme(TextTheme()).dark(),
            debugShowCheckedModeBanner: false,
            routerConfig: RoutePages.ROUTER,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/blocs.dart';
import '../../routes/route_pages.dart';
import '../../utils/asset_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      body: BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
if(state is SplashEnd){
  context.goNamed(Routes.WELCOME_ROUTE);
}
    },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.APP_LOGO, height: 50.h, width: 80.w),
            const SizedBox(height: 16),
            const Center(child: CircularProgressIndicator())
          ],
        ),

      ),
    ),);
  }
}
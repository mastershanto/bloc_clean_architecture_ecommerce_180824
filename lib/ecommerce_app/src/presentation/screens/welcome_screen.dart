import 'package:bloc_clean_architecture_ecommerce_180824/ecommerce_app/src/blocs/authentication/login_bloc.dart';
import 'package:bloc_clean_architecture_ecommerce_180824/ecommerce_app/src/presentation/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../routes/route_pages.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Let's get started",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {},
            builder: (context, state) {
              if(state is LoginLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SocialLoginButton(
                        buttonType: SocialLoginButtonType.twitter,
                        onPressed: () {
                          context.read<LoginBloc>().add(RequestTwitterLogin());
                        }),
                    const Gap(10),
                    SocialLoginButton(
                        buttonType: SocialLoginButtonType.facebook,
                        onPressed: () {
                          context.read<LoginBloc>().add(RequestFacebookLogin());
                        }),
                    const Gap(10),
                    SocialLoginButton(
                        buttonType: SocialLoginButtonType.google,
                        onPressed: () {
                          context.read<LoginBloc>().add(RequestGoogleLogin());
                        }),
                  ],
                ),
              );
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  TextButton(
                    onPressed: () => context.pushNamed(Routes.REGISTER_ROUTE),
                    child: Text("Sign In",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                  )
                ],
              ),
              FullWidthButton(
                  buttonText: "Create An Account",
                  onTap: () => context.pushNamed(Routes.REGISTER_ROUTE))
            ],
          ),
        ],
      ),
    );
  }
}

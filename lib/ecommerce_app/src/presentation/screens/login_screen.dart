import 'package:bloc_clean_architecture_ecommerce_180824/ecommerce_app/src/presentation/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_pages.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [


              ],
            ),
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
                    child: Text("Sign Up",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                  )
                ],
              ),
              FullWidthButton(buttonText: "Log In", onTap: () => context.pushNamed(Routes.REGISTER_ROUTE),)
            ],
          ),
        ],
      ),
    );
  }
}

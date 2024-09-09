
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:bloc_clean_architecture_ecommerce_180824/ecommerce_app/src/blocs/block_ecommerce_observer.dart';

// import 'counter_app/counter_app.dart';
import 'package:flutter/material.dart';

import 'ecommerce_app/app.dart';

// void main() {
//   runApp(const CounterApp());
// }

// void main() {
//   runApp(const EcommerceApp());
// }


Future<void> main() async{
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer=BlocEcommerceObserver();
  runApp(const BlocEcommerceApp());
}

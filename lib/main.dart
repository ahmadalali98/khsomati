import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:khsomati/business_logic/cubit/auth/auth_cubit.dart';
import 'package:khsomati/business_logic/cubit/localization/localization_cubit.dart';
import 'package:khsomati/business_logic/cubit/localization/localization_state.dart';
=======
import 'package:khsomati/business_logic/cubit/cubit/auth_cubit.dart';
import 'package:khsomati/business_logic/cubit/layout/layout_cubit.dart';
>>>>>>> 27fffdd5f9b68509378f6b19cae1579bcfee28fd
import 'package:khsomati/constants/app_size.dart';
import 'package:khsomati/firebase_options.dart';
import 'package:khsomati/router/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => LocalizationCubit()),
      ],
      child: Khosomati(),
    ),
  );
}

class Khosomati extends StatelessWidget {
  const Khosomati({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.setSize(
      newWidth: MediaQuery.sizeOf(context).width,
      newHeight: MediaQuery.sizeOf(context).height,
    );
<<<<<<< HEAD
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (BuildContext context, LocalizationState state) {
        return MaterialApp(
          locale: state.locale,
          supportedLocales: [Locale('en'), Locale('ar')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          title: "Khosomati App",
          debugShowCheckedModeBanner: false,
          routes: routes,
        );
      },
=======
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => LayoutCubit()),
      ],

      child: MaterialApp(
        title: "Khosomati App",
        debugShowCheckedModeBanner: false,
        routes: routes,
      ),
>>>>>>> 27fffdd5f9b68509378f6b19cae1579bcfee28fd
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/business_logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:la_vie/business_logic/bloc/auth_bloc/auth_state.dart';
import 'package:la_vie/business_logic/cubit/seeds_cubit/seeds_cubit.dart';
import 'package:la_vie/business_logic/cubit/products_cubit/products_cubit.dart';
import 'package:la_vie/data/repository/products_repository.dart';
import 'package:la_vie/data/web_services/products_web_services.dart';
import 'package:la_vie/data/repository/auth_repository.dart';
import 'package:la_vie/data/repository/seeds_repository.dart';
import 'package:la_vie/presentation/screens/home_screen.dart';
import 'package:la_vie/presentation/screens/registeration_screen.dart';
import 'package:la_vie/data/web_services/seeds_web_services.dart';

void main() {
  runApp(
    const LaVieApp(),
  );
}

class LaVieApp extends StatelessWidget {
  const LaVieApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthLoginBloc(
            LoginInitState(),
            AuthLoginRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => AuthSignupBloc(
            SignupInitState(),
            AuthSignupRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => SeedsCubit(
            SeedsRepository(
              SeedsWebServices(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(
            ProductsRepository(
              ProductsWebServices(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const RegisterationScreen(),
          'home': (context) => HomeScreen()
        },
      ),
    );
  }
}

// import 'package:strava_clone/src/module/sign-up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strava_clone/src/module/internet/pages/offline_page.dart';

import '../../module/car/car.dart';
import '../../module/matrimonial/matrimonial.dart';
import '../../module/module.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  final SettingsCubit _settingsCubit = SettingsCubit();
  final SearchBloc _searchBloc = SearchBloc();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const HomeScreen(
                title: 'Home Screen', color: Colors.amberAccent),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const SecondScreen(
                title: 'Second Screen', color: Colors.blueAccent),
          ),
        );
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const ThirdScreen(
                    title: 'Third Screen',
                    color: Colors.deepPurpleAccent,
                  ),
                ));
      // case '/sign-in':
      //   return MaterialPageRoute(builder: ((context) => const SignInPage()));
      // case '/sign-up':
      //   return MaterialPageRoute(builder: ((context) => const SignUpPage()));
      case '/timer':
        return MaterialPageRoute(builder: ((context) => const TimerPage()));
      case '/offline':
        return MaterialPageRoute(builder: ((context) => const OfflinePage()));
      case '/search':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _searchBloc,
                  child: const SearchPage(),
                ));
      case '/settings':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _settingsCubit,
                  child: const SettingsPage(),
                ));

       case '/car':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _settingsCubit,
                  child: const CarPage(),
                ));

         case '/wedding':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _settingsCubit,
                  child: const frontPage(),
                ));
                
      default:
        return null;
        
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}

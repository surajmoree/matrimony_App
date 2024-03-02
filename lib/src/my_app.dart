import 'package:strava_clone/src/module/components/menu/bloc/menu_bloc.dart';

import 'boot.dart';
import 'module/module.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // final AuthenticationRepository _authenticationRepository =
  //     AuthenticationRepository();

  MyApp({super.key, required this.appRouter, required this.connectivity,});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthenticationRepository(),
      child: MultiBlocProvider(
          providers: [
            // BlocProvider<AppBloc>(
            //   create: (context) =>
            //       AppBloc(authenticationRepository: _authenticationRepository),
            // ),
            BlocProvider<InternetCubit>(
              create: (context) => InternetCubit(connectivity: connectivity),
            ),
            BlocProvider<MenuBloc>(
              create: (context) => MenuBloc(),
            ),
          ],
          child: BlocListener<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state.runtimeType == InternetDisconnected) {
                MyApp.navigatorKey.currentState?.pushNamed('/offline');
              }
            },
            child: MaterialApp(
              title: 'Flutter Demo',
              navigatorKey: MyApp.navigatorKey,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              onGenerateRoute: appRouter.onGenerateRoute,
            ),
          )),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late final AppRouter appRouter;
//   late final Connectivity connectivity;

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // routes: {
//       //   '/': (context) => BlocProvider.value(
//       //         value: _counterCubit,
//       //         child: const HomeScreen(title: 'Hoome Screen', color: Colors.red),
//       //       ),
//       //   '/second': (context) => BlocProvider.value(
//       //         value: _counterCubit,
//       //         child:
//       //             const SecondScreen(title: '2nd Sceen', color: Colors.orange),
//       //       ),
//       //   '/third': (context) => BlocProvider.value(
//       //         value: _counterCubit,
//       //         child:
//       //             const ThirdScreen(title: '3rd Screen', color: Colors.white),
//       //       )
//       // },
//       onGenerateRoute: _appRouter.onGenerateRoute,
//     );
//   }

//   @override
//   void dispose() {
//     _appRouter.dispose();
//     super.dispose();
//   }
// }

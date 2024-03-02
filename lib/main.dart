import 'package:strava_clone/src/utility/app_bloc_observer.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'src/boot.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'src/my_app.dart';

Future<void> main() async {
  
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory());

  Bloc.observer = AppBlocObserver();

  // if (!kIsWeb) {
  //   await Firebase.initializeApp();
  // } else {
  //   await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //       apiKey: "${dotenv.env['FIREBASE_API_KEY']}",
  //       authDomain: "${dotenv.env['FIREBASE_AUTH_DOMAIN']}",
  //       projectId: "${dotenv.env['FIREBASE_PROJECT_ID']}",
  //       storageBucket: "${dotenv.env['FIREBASE_STORAGE_BUCKET']}",
  //       messagingSenderId: "${dotenv.env['FIREBASE_MESSAGING_SENDER_ID']}",
  //       appId: "${dotenv.env['FIREBASE_APP_ID']}",
  //       measurementId: "${dotenv.env['FIREBASE_MEASUREMENT_ID']}",
  //     ),
  //   );
  // }

  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  
  ));
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:plusfit/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/src/exercise/cardiovascular/view.dart';
import 'package:plusfit/src/exercise/inferior/view.dart';
import 'package:plusfit/src/signInPage/view.dart';
import 'package:plusfit/src/homePage/view.dart';
import 'package:plusfit/src/profilePage/view.dart';
import 'package:plusfit/src/resetPasswordPage/view.dart';
import 'package:plusfit/src/aboutPage/view.dart';
import 'package:plusfit/src/exercisePage/view.dart';
import 'package:plusfit/src/signUpPage/view.dart';
import 'package:plusfit/src/exercise/superior/view.dart';
import 'package:plusfit/src/treinos_c/base.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PFApp());
}

class PFApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(),
          ),
          StreamProvider(
              create: (context) =>
                  context.read<AuthenticationService>().authStateChanges),
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            '/home': (context) => HomePage(),
            '/login': (context) => LoginPage(),
            '/signup': (context) => SignupPage(),
            '/reset': (context) => ResetPassword(),
            '/about': (context) => AboutPage(),
            '/exercises': (context) => ExercisePage(),
            '/perfil': (context) => PerfilPage(),
            '/superior': (context) => SuperiorPage(),
            '/inferior': (context) => InferiorPage(),
            '/cardio': (context) => CardiovascularPage(),
            '/base': (context) => BasePage(),
          },
          title: 'PlusFit v1.0',
          theme: ThemeData(
            primaryColor: porange,
            primarySwatch: Colors.deepOrange,
          ),
          home: Authenticate(),
          debugShowCheckedModeBanner: false,
        ));
  }
}

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return ExercisePage();
    }
    return LoginPage();
  }
}

import 'package:find_it/UI/screens/auth/sign_up_form/sign_up_provider.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/bottom_navigation_bar_provider.dart';
import 'package:find_it/UI/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ResponsiveSizer(
    builder: (context,orientation,screenType){
      return MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> BottomNavigationBarProvider()),
      ChangeNotifierProvider(create: (_)=> SignUpProvider()),
    ],
      child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen()
      ),
    );
  }
}
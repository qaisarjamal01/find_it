import 'package:find_it/UI/screens/auth/login_form/login_provider.dart';
import 'package:find_it/UI/screens/auth/sign_up_form/sign_up_provider.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/add_post_section/FoundPostCategory/found_post_details_provider.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/add_post_section/LostPostCategory/lost_post_details_provider.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/admin_section/admin_section_provider.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/bottom_navigation_bar_provider.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/dashboard_screen/home_screen_provider.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/profile_section/profile_section_provider.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/profile_section/UpdatePasswordScreen/update_password_provider.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/profile_section/UpdateProductsScreen/update_products_provider.dart';
import 'package:find_it/UI/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    //DeviceOrientation.portraitDown,
  ]).then((_){
    runApp(ResponsiveSizer(
      builder: (context,orientation,screenType){
        return MyApp();
      },
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
      ChangeNotifierProvider(create: (_) => SignUpProvider()),
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_) => LostPostDetailsProvider()),
      ChangeNotifierProvider(create: (_) => FoundPostDetailsProvider()),
      ChangeNotifierProvider(create: (_) => AdminSectionProvider()),
      ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
      ChangeNotifierProvider(create: (_) => ProfileSectionProvider()),
      ChangeNotifierProvider(create: (_) => UpdatePasswordProvider()),
      ChangeNotifierProvider(create: (_) => UpdateProductsProvider())
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
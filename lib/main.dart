import 'package:appointment_doctor/backend/auth/auth.dart';
import 'package:appointment_doctor/backend/auth/login.dart';
import 'package:appointment_doctor/firebase_options.dart';
// import 'package:appointment_doctor/pages/adminApk/detail_rs_page.dart';
import 'package:appointment_doctor/pages/login_page.dart';
import 'package:appointment_doctor/pages/onboard/onboard.dart';
// import 'package:appointment_doctor/widgets/navigator.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(Auth()));

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await GetStorage.init();

  await initializeDateFormatting('id_ID', null);
  // Get an instance of SharedPreferences
  // SharedPreferences prefs = await SharedPreferences.getInstance();

  // Check if the user has seen the onboarding screen before
  // bool isOnboardingComplete = prefs.getBool('onboardingComplete') ?? false;

  // runApp(MyApp(isOnboardingComplete: isOnboardingComplete));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // final bool isOnboardingComplete;
  // const MyApp({super.key, required this.isOnboardingComplete});
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(38, 38, 66, 1)),
        useMaterial3: true,
      ),
      // home: isOnboardingComplete ? const LoginPage() : const MainApp(),
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

// class MainApp extends StatefulWidget {
//   const MainApp({super.key});

//   @override
//   State<MainApp> createState() => _MainAppState();
// }

// class _MainAppState extends State<MainApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainApp(),
//     );
//   }
// }


        // appBar: AppBar(
        //   title:
        //       Text("Hello ${FirebaseAuth.instance.currentUser!.email ?? ''}"),
        //   actions: [
        //     IconButton(
        //       icon: const Icon(Icons.logout),
        //       onPressed: isLoading == false
        //           ? () {
        //               setState(() {
        //                 isLoading = true;
        //               });

        //               final logout = Auth();

        //               logout.logout();

        //               setState(() {
        //                 isLoading = true;
        //               });
        //             }
        //           : null,
        //     )
        //   ],
        // ),

        // body:
        //     const SplashScreen(), // untuk ganti tampilan saat slicing, hanya perlu ganti line ini dg nama fungsi file masing2
        // bottomNavigationBar: const NavigationBarApp(),




// dibawah ini adalah button untuk logout, sementara di comment dulu. bilang klo mau ngehapus

// body: Center(
//           child: ElevatedButton(
//             onPressed: isLoading == false
//                 ? () {
//                     setState(() {
//                       isLoading = true;
//                     });

//                     final logout = Auth();

//                     logout.logout();

//                     setState(() {
//                       isLoading = true;
//                     });
//                   }
//                 : null,
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xffde1a51),
//                 padding: const EdgeInsets.symmetric(vertical: 16.0)),
//             child: isLoading == false
//                 ? const Text(
//                     "Logout",
//                     style: TextStyle(color: Colors.white),
//                   )
//                 : const CircularProgressIndicator(
//                     color: Colors.white,
//                   ),
//           ),
//         ),




// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {

//     bool isLoading = false;

//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello ${FirebaseAuth.instance.currentUser}!'),
//         ),
//         floatingActionButton: GestureDetector(
//           onTap: isLoading == false ? () async {

//             setstate

//             final logout = Auth();

//             logout.logout();


//           } : null,
//         ),
//       ),
//     );
//   }
// }

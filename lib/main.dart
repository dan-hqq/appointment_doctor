import 'package:appointment_doctor/backend/auth/auth.dart';
import 'package:appointment_doctor/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(Auth()));

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await GetStorage.init();

  await initializeDateFormatting('id_ID', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:
              Text("Hello ${FirebaseAuth.instance.currentUser!.email ?? ''}"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: isLoading == false
                ? () {
                    setState(() {
                      isLoading = true;
                    });

                    final logout = Auth();
                    logout.logout();

                    setState(() {
                      isLoading = true;
                    });
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffde1a51),
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 120),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: isLoading == false
                ? Text(
                    "Logout",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                : const CircularProgressIndicator(
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}

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

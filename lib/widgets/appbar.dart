// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Appbar extends StatelessWidget implements PreferredSizeWidget {
//   // final VoidCallback onTapBack;
//   final String title;
//   final VoidCallback logout;

//   const Appbar({
//     super.key,
//     // required this.onTapBack,
//     required this.title,
//     required this.logout,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: preferredSize,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: AppBar(
//           // leading: CircleAvatar(
//           //   backgroundColor: const Color(0xffde1a51),
//           //   child: IconButton(
//           //     onPressed: onTapBack,
//           //     icon: const Icon(
//           //       Icons.arrow_back_ios_new_rounded,
//           //       color: Colors.white,
//           //       size: 30,
//           //     ),
//           //   ),
//           // ),
//           scrolledUnderElevation: 0,
//           toolbarHeight: kToolbarHeight + 26,
//           backgroundColor: const Color(0xFF352f44),
//           title: Text(
//             title,
//             style: GoogleFonts.nunito(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           centerTitle: true,
//           actions: [
//             CircleAvatar(
//               radius: 30,
//               backgroundColor: const Color(0xffde1a51),
//               child: IconButton(
//                 onPressed: logout,
//                 icon: const Icon(
//                   Icons.logout,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight + 36);
// }

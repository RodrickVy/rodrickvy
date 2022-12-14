import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rodrickvy/controller.dart';
import 'package:rodrickvy/firebase_options.dart';
import 'package:rodrickvy/image.fader.dart';
import 'package:rodrickvy/landing/landing.view.dart';
import 'package:rodrickvy/resume/resume.view.dart';
import 'package:rodrickvy/util/adaptive.dart';
import 'package:rodrickvy/values.list.section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'rodrickvy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          outlinedButtonTheme: OutlinedButtonThemeData(style: OutlinedButton.styleFrom(foregroundColor: Colors.red)),
          primaryColor: Colors.orange,
          colorScheme: const ColorScheme(
            primary: Colors.orange,
            brightness: Brightness.light,
            onPrimary: Colors.black,
            secondary: Colors.red,
            onSecondary: Colors.black,
            error: Colors.redAccent,
            onError: Colors.white,
            background: Colors.white,
            onBackground: Colors.black,
            surface: Colors.white,
            onSurface: Colors.white,
          ),
          textTheme: TextTheme(
            headline1: GoogleFonts.poppins(
              fontSize: 93,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.5,
            ),
            headline2: GoogleFonts.poppins(fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
            headline3: GoogleFonts.poppins(fontSize: 46, fontWeight: FontWeight.w400),
            headline4: GoogleFonts.poppins(fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            headline5: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400),
            headline6: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
            subtitle1: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
            subtitle2: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
            bodyText1: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.5),
            bodyText2: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            button: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 1.25),
            caption: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
            overline: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
          )),
      getPages: [
        GetPage(name: "/", page: () => const Home()),
        GetPage(name: '/resume', page: () => ResumeView()),
        GetPage(name: '/projects', page: () => Project()),
      ],
    );
  }
}

// class Story extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: Get.width,
//       height: Get.height,
//       decoration: const BoxDecoration(
//         image: DecorationImage(image: AssetImage("assets/images/thesky.jpg"), fit: BoxFit.cover),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.white54,
//         appBar: null,
//         body: NotificationListener<UserScrollNotification>(
//           onNotification: (notification) {
//             final ScrollDirection direction = notification.direction;
//
//             return Adaptive(context).adaptBuilder(
//                 phone: () => false,
//                 tablet: () => false,
//                 desktop: () {
//                   if (HomeController.instance().viewIsScrolling == false) {
//                     if (direction == ScrollDirection.forward) {
//                       print("moving up ");
//                       HomeController.instance().toPreviousSection();
//                     } else if (direction == ScrollDirection.reverse) {
//                       print("moving down ");
//                       HomeController.instance().toNextSection();
//                     }
//                   }
//                   return true;
//                 });
//           },
//           child: ListView(
//             controller: HomeController.instance().scrollController,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: IconButton(
//                     onPressed: () {
//                       Get.toNamed("/");
//                     },
//                     icon: const Icon(Icons.arrow_back)),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 50, bottom: 40),
//                 child: RichText(
//                     text: const TextSpan(children: [
//                   // TextSpan(
//                   //     text: "..here is my work",
//                   //     style: Theme.of(context).textTheme.headline1?.copyWith(
//                   //         fontWeight: FontWeight.w900,
//                   //         fontSize: Adaptive(context)
//                   //             .adapt(phone: 17, tablet: 20, desktop: 27))),
//                 ])),
//               ),
//               ValuesListSection()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class Project extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/thesky.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title:  Text( "${AppController.currentProject["name"]}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
          leading: IconButton(
              onPressed: () {
                Get.toNamed("/");
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.all(20)
              .copyWith(left: Adaptive(context).adapt(phone: 12, tablet: 20, desktop: 50), bottom: 40),
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 40),
            //   child: RichText(
            //       text: TextSpan(children: [
            //
            //   ])),
            // ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 17),
                  child: ImageFader(
                    image: AppController.currentProject["image"] ?? '',
                    // color: primaryColor,
                    fit: BoxFit.fitWidth,
                    width: Adaptive(context).adapt(phone: Get.width - 70, tablet: 340, desktop: 400),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 17,left: 10),
              width: Get.width,
              child: Text(AppController.currentProject["description"] ?? "",
                  textAlign: TextAlign.left,
                  style: Get.textTheme.bodyLarge?.copyWith(
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontWeight: FontWeight.w100)),
            ),
            if (AppController.currentProject["url"]?.isNotEmpty ?? false)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(foregroundColor: Colors.black),
                      onPressed: () async {
                        await launchUrl(Uri.parse(AppController.currentProject["url"] ?? ''));
                      },
                      label: Icon(Icons.arrow_forward),
                      icon: Text("Check It Out"),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

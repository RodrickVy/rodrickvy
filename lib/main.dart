import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rodrickvy/controller.dart';
import 'package:rodrickvy/firebase_options.dart';
import 'package:rodrickvy/image.fader.dart';
import 'package:rodrickvy/util/adaptive.dart';
import 'package:rodrickvy/values.list.section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setPathUrlStrategy();
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
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // colorScheme: ColorScheme(
          //   onBackground: Colors.black, brightness: null
          // ),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(primary: Colors.red)),
          primaryColor: Colors.orange,
          textTheme: TextTheme(
            headline1: GoogleFonts.poppins(
              fontSize: 93,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.5,
            ),
            headline2: GoogleFonts.poppins(
                fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
            headline3:
                GoogleFonts.poppins(fontSize: 46, fontWeight: FontWeight.w400),
            headline4: GoogleFonts.poppins(
                fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            headline5:
                GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400),
            headline6: GoogleFonts.poppins(
                fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
            subtitle1: GoogleFonts.poppins(
                fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
            subtitle2: GoogleFonts.poppins(
                fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
            bodyText1: GoogleFonts.poppins(
                fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.5),
            bodyText2: GoogleFonts.poppins(
                fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            button: GoogleFonts.poppins(
                fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 1.25),
            caption: GoogleFonts.poppins(
                fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
            overline: GoogleFonts.poppins(
                fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
          )),
      getPages: [
        GetPage(name: "/", page: () => Home()),
      ],
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all( 5),
            child: OutlinedButton.icon(
                onPressed: ()async {
                  await launchUrl(
                      Uri.parse('https://www.youtube.com/channel/UCyRu3m1t5c9ISX_sOE24C0A'));
                },
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                icon:const Icon( Icons.play_arrow),
                label: Text(
                  "Youtube",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all( 5),
            child: OutlinedButton.icon(
                onPressed: () async {
                  await launchUrl(
                      Uri.parse('https://medium.com/@rodrickvy'));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(14),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                icon:const Icon( Icons.article),
                label: Text(
                  "Medium",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [Colors.white,Colors.white,Adaptive(context).adapt(phone: Colors.white,tablet: Colors.white,desktop: Colors.white12)],
        //     begin: Alignment.centerLeft,
        //     end: Alignment.centerRight
        //   )
        // ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar:null,
          // backgroundColor: Colors.black87,
          body: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height / 7,
                    width: Get.width,
                  ),
                  Container(
                    width: Adaptive(context)
                        .adapt(phone: Adaptive(context).width, tablet: Adaptive(context).width-20, desktop: (Adaptive(context).width/4)*3),
                    padding: EdgeInsets.only(
                        left: Adaptive(context)
                            .adapt(phone: 15, tablet: 30, desktop: 50)),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Hey,\n",
                          style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.black87,
                              fontSize: Adaptive(context).adapt(
                                  phone: 23, tablet: null, desktop: null))),
                      TextSpan(
                          text: "am",
                          style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                              fontStyle: FontStyle.italic)),
                      TextSpan(
                          text: " Rodrick\n",
                          style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontWeight: FontWeight.w800,
                              color:
                                  Theme.of(context).primaryColor.withGreen(120))),
                      TextSpan(
                          text:
                              "A student merging my passion for 📐design, 👨🏿‍💻software, and 💰business. This is where I share knowledge & value to help others as I grow.",
                          style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87)),
                    ])),
                  ),
                  SizedBox(
                    width: Get.width,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: Adaptive(context)
                                .adapt(phone: 15, tablet: 30, desktop: 50),
                            top: 22),
                        child: OutlinedButton(
                            onPressed: ()async {
                              await launchUrl(
                                  Uri.parse('https://www.youtube.com/channel/UCyRu3m1t5c9ISX_sOE24C0A'));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.all(14),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0))),
                            child: Text(
                              "Youtube",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: Adaptive(context)
                                .adapt(phone: 10, tablet: 20, desktop: 30),
                            top: 22),
                        child: OutlinedButton(
                            onPressed: () async {
                              await launchUrl(
                                  Uri.parse('https://medium.com/@rodrickvy'));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                padding: const EdgeInsets.all(14),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0))),
                            child: Text(
                              "Medium",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 200,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Story extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/thesky.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.white54,
        appBar: null,
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;

            return Adaptive(context).adaptBuilder(
                phone: () => false,
                tablet: () => false,
                desktop: () {
                  if (HomeController.homeController().viewIsScrolling ==
                      false) {
                    if (direction == ScrollDirection.forward) {
                      print("moving up ");
                      HomeController.homeController().toPreviousSection();
                    } else if (direction == ScrollDirection.reverse) {
                      print("moving down ");
                      HomeController.homeController().toNextSection();
                    }
                  }
                  return true;
                });
          },
          child: ListView(
            controller: HomeController.homeController().scrollController,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: IconButton(
                    onPressed: () {
                      Get.toNamed("/");
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, bottom: 40),
                child: RichText(
                    text: const TextSpan(children: [
                  // TextSpan(
                  //     text: "..here is my work",
                  //     style: Theme.of(context).textTheme.headline1?.copyWith(
                  //         fontWeight: FontWeight.w900,
                  //         fontSize: Adaptive(context)
                  //             .adapt(phone: 17, tablet: 20, desktop: 27))),
                ])),
              ),
              ValuesListSection()
            ],
          ),
        ),
      ),
    );
  }
}

class Project extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/thesky.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: null,
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.all(20).copyWith(
              left: Adaptive(context).adapt(phone: 12, tablet: 20, desktop: 50),
              bottom: 40),
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                  onPressed: () {
                    Get.toNamed("/work");
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: ".. ${HomeController.currentProject["name"]}",
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(fontWeight: FontWeight.w900)),
              ])),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 17),
                  child: ImageFader(
                    image: HomeController.currentProject["image"] ?? '',
                    // color: primaryColor,
                    fit: BoxFit.fitWidth,
                    width: Adaptive(context).adapt(
                        phone: Get.width - 70, tablet: 340, desktop: 400),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 17),
              width: Get.width,
              child: Text(HomeController.currentProject["description"] ?? "",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: Adaptive(context)
                          .adapt(phone: 25, tablet: 34.8, desktop: 34.8),
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontWeight: FontWeight.w100)),
            ),
            if (HomeController.currentProject["url"]?.isNotEmpty ?? false)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: OutlinedButton(
                        onPressed: () async {
                          await launchUrl(Uri.parse(
                              HomeController.currentProject["url"] ?? ''));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(14),
                            primary: Colors.white54,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0))),
                        child: const Text("Check It Out")),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

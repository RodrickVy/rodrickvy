import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rodrickvy/controller.dart';
import 'package:rodrickvy/experience.data.dart';
import 'package:rodrickvy/main.dart';
import 'package:rodrickvy/util/adaptive.dart';
import 'package:rodrickvy/util/list.extention.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  /// screen built to fit in 270*513 small size phone
  @override
  Widget build(BuildContext context) {
    const double? sectionHeight = null /*Get.height* 2*/;
    TextStyle? descriptionStyle = Adaptive(context)
        .adapt(
            phone: Theme.of(context).textTheme.bodyLarge,
            tablet: Theme.of(context).textTheme.headline5,
            desktop: Theme.of(context).textTheme.headline5)
        ?.copyWith(fontWeight: FontWeight.w300, color: Colors.black87);
    double width = Adaptive(context).adapt(
        phone: Adaptive(context).width,
        tablet: Adaptive(context).width - 20,
        desktop: (Adaptive(context).width / 4) * 3);

    final TextAlign textAlignment =
        Adaptive(context).adapt(phone: TextAlign.left, tablet: TextAlign.left, desktop: TextAlign.left);
    final double contentWidth =
        Adaptive(context).adapt(phone: Get.width - 20, tablet: Get.width - 100, desktop: Get.width / 2.8);
    return Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),
        // ),
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: ListView(
            controller: AppController.instance.scrollController,
            restorationId: "scrollController",
            children: [
              HeaderView(
                  width: width,
                  contentWidth: contentWidth,
                  textAlignment: textAlignment,
                  descriptionStyle: descriptionStyle),
              About(contentWidth: contentWidth, textAlignment: textAlignment, descriptionStyle: descriptionStyle),
              Projects(),
            ],
          ),
        ));
  }
}

class Projects extends StatelessWidget {
  const Projects({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.only(top: 22.0),
      constraints: BoxConstraints(
        minHeight: Get.height,
      ),
      child: Obx(
        () {
          double sectionsScrolled = (AppController.currentOffset.value / Get.height);
          Experience cardData = AppController.cards.first;
          return AnimatedContainer(
            margin: EdgeInsets.only(left: sectionsScrolled > 1 ? 0 : (Get.width / 4)),
            duration: const Duration(seconds: 1),
            width: Get.width,
            child: Container(
              color: Colors.transparent,
              height: Get.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      "Projects I've Worked On",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        spacing: 50,
                        children: [
                          ...cardData.projects.map2((project, index) {
                            return SizedBox(
                             height:400,
                              width: 300,
                              child: InkWell(
                                onTap: () async {
                                  AppController.currentProject(project);
                                  Get.toNamed('/projects?projectId=$index');
                                  // await launchUrl(Uri.parse(project['url']!));
                                },
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  color: Colors.white,
                                  elevation: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.only(top: 20),
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(project["image"] ?? ""),
                                                    fit: BoxFit.fitWidth)),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          width: Get.width,
                                          child: Text(project["name"] ?? "",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize:
                                                    Adaptive(context).adapt(phone: 16, tablet: 18, desktop: 18),
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              )),
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
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({
    Key? key,
    required this.contentWidth,
    required this.textAlignment,
    required this.descriptionStyle,
  }) : super(key: key);

  final double contentWidth;
  final TextAlign textAlignment;
  final TextStyle? descriptionStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.only(top: 22.0),
      // height: Get.height,
      constraints: BoxConstraints(
        minHeight: Get.height - 20,
      ),
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            width: Adaptive(context).adapt(phone: 200, tablet: 250, desktop: 300),
            child: Image.asset(
              'assets/images/profile_pic.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: contentWidth,
            child: Text(
                "I have built and managed apps  HTML/CSS, JS, Svelte, Angular and recently Dart and Flutter. "
                "working with back-end systems like Firebase,"
                "Cloud Run, Identity Platform, Cloud Storage and other GCP APIs.",
                textAlign: textAlignment,
                style: descriptionStyle),
          ),
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              spacing: 2,
              runSpacing: 2,
              alignment: WrapAlignment.center,
              crossAxisAlignment:Adaptive(context).adapt(phone:  WrapCrossAlignment.start, tablet:  WrapCrossAlignment.center, desktop:  WrapCrossAlignment.center),
              children: [
                OutlinedButton.icon(
                    onPressed: () async {
                      await launchUrl(
                          Uri.parse('https://www.youtube.com/channel/UCyRu3m1t5c9ISX_sOE24C0A'));
                    },
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(14),
                        // backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                    icon: CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('assets/images/youtube.png'),
                    ),
                    label: Text(
                      "Youtube",
                      style:
                      Theme.of(context).textTheme.button?.copyWith(fontWeight: FontWeight.bold),
                    )),
                OutlinedButton.icon(
                    onPressed: () async {
                      await launchUrl(Uri.parse('https://medium.com/@rodrickvy'));
                    },
                    style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                    icon: CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('assets/images/medium.png'),
                    ),
                    label: Text(
                      "Medium",
                      style:
                      Theme.of(context).textTheme.button?.copyWith(fontWeight: FontWeight.bold),
                    )),
                OutlinedButton.icon(
                    onPressed: () async {
                      Get.toNamed("/resume");
                    },
                    style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                    icon: CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('assets/images/resume.png'),
                    ),
                    label: Text(
                      "Resume",
                      style:
                      Theme.of(context).textTheme.button?.copyWith(fontWeight: FontWeight.bold),
                    )),
                OutlinedButton.icon(
                    onPressed: () async {
                      await launchUrl(Uri.parse('https://github.com/RodrickVy'));
                    },
                    style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                    icon: CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('assets/images/github.png'),
                    ),
                    label: Text(
                      "Github",
                      style:
                      Theme.of(context).textTheme.button?.copyWith(fontWeight: FontWeight.bold),
                    )),
                OutlinedButton.icon(
                    onPressed: () async {
                      await launchUrl(Uri.parse('https://www.linkedin.com/in/rodrickvy/'));
                    },
                    style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                    icon: CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('assets/images/linkedin.png'),
                    ),
                    label: Text(
                      "Linkedin",
                      style:
                      Theme.of(context).textTheme.button?.copyWith(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          Container(
            width: contentWidth + 10,
            padding: const EdgeInsets.only(top: 20,bottom: 50),
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              onPressed: () {
                AppController.instance.scrollController
                    .animateTo(Get.height*2 , duration: const Duration(seconds: 1), curve: Curves.easeInCubic);
              },
              label: const Icon(Icons.arrow_forward),
              icon: const Text("my work"),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key? key,
    required this.width,
    required this.contentWidth,
    required this.textAlignment,
    required this.descriptionStyle,
  }) : super(key: key);

  final double width;
  final double contentWidth;
  final TextAlign textAlignment;
  final TextStyle? descriptionStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      width: width,
      height: Get.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            width: contentWidth,
            child: RichText(
                textAlign: textAlignment,
                text: TextSpan(children: [
                  TextSpan(
                      text: "Hi there,\n",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                          fontSize: Adaptive(context).adapt(phone: 46, tablet: null, desktop: null))),
                  TextSpan(
                      text: "I'm Rodrick  ",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          fontSize: Adaptive(context).adapt(phone: 46, tablet: null, desktop: null))),
                  // TextSpan(
                  //     text: "am",
                  //     style: Theme.of(context).textTheme.headline1?.copyWith(
                  //         fontWeight: FontWeight.w500,
                  //         color: Colors.black87,
                  //         fontSize: Adaptive(context).adapt(phone: 23, tablet: null, desktop: null),
                  //         fontStyle: FontStyle.italic)),
                  // TextSpan(
                  //     text: " Rodrick",
                  //     style: Theme.of(context).textTheme.headline1?.copyWith(
                  //         fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor)),
                ])),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            width: contentWidth,
            child: Text(AppController.description, textAlign: textAlignment, style: descriptionStyle),
          ),
          Container(
            width: contentWidth + 10,
            padding: const EdgeInsets.only(top: 20),
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              onPressed: () {
                AppController.instance.scrollController
                    .animateTo(Get.height , duration: const Duration(seconds: 1), curve: Curves.easeInCubic);
              },
              label: const Icon(Icons.arrow_forward),
              icon: const Text("about"),
            ),
          ),
          Container(
            width: contentWidth + 10,
            padding: const EdgeInsets.only(top: 20),
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              onPressed: () {
                AppController.instance.scrollController
                    .animateTo(Get.height * 2, duration: const Duration(seconds: 1), curve: Curves.linear);
              },
              label: Icon(Icons.arrow_forward),
              icon: Text("my Work"),
            ),
          ),
          const Spacer(),
          const Spacer(),
          // Image.asset(
          //   AppController.scrollGif,
          //   width: 80,
          // ),
        ],
      ),
    );
  }
}

// Container(
//   width: Get.width,
// ),
// const Divider(
//   height: 20,
// ),          const SizedBox(
//           //             height: 130,
//           //           ),
// SizedBox(
//   width: width,
//   child: Text(
//       "\n\n"
//           "I want a place I could merge my passion for 📐design, 👨🏿‍💻software, and 💰business to impact the world.",
//       style: _descriptionStyle?.copyWith(fontStyle: FontStyle.italic)),
// ),
// Container(
//   width: Adaptive(context).adapt(phone: Get.width - 20, tablet: Get.width-100, desktop: Get.width/2.8),
//
//   child:   Container(
//     alignment: Alignment.centerLeft,
//     child: Image.asset(
//       'assets/images/background.png',
//       width: 130,
//       fit: BoxFit.fitWidth,
//     ),
//   ),
// ),

// ...HomeController.cards.map2((Experience cardData, index) {
//   return Container(
//     width: Get.width,
//     clipBehavior: Clip.hardEdge,
//     height: sectionHeight,
//     padding: EdgeInsets.zero,
//     decoration: const BoxDecoration(color: Colors.transparent),
//     child: Wrap(
//       alignment: WrapAlignment.center,
//       children: [
//         Container(
//           padding: const EdgeInsets.only(top: 17),
//           width: Get.width,
//           child: Text(cardData.heading,
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                   fontSize: Adaptive(context).adapt(phone: 25, tablet: 34.8, desktop: 34.8),
//                   fontStyle: FontStyle.normal,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w900)),
//         ),
//         SizedBox(
//           width: Get.width,
//         ),
//         Container(
//           padding: const EdgeInsets.only(top: 0),
//           width: Get.width,
//           child: Text(cardData.time,
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                   fontSize: Adaptive(context).adapt(phone: 15, tablet: 24.8, desktop: 24.8),
//                   fontStyle: FontStyle.normal,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w900)),
//         ),
//         SizedBox(
//           width: Get.width,
//         ),
//         if (cardData.projects.isNotEmpty)
//           Container(
//             padding: const EdgeInsets.only(top: 20),
//             child: Wrap(
//               direction: Axis.horizontal,
//               children: [
//                 ...cardData.projects.map2((project, index) {
//                   return SizedBox(
//                     height: 200,
//                     width: Adaptive(context).adapt(phone: 180, tablet: 200, desktop: 200),
//                     child: InkWell(
//                       onTap: () async {
//                         HomeController.currentProject(project);
//                         await launchUrl(Uri.parse(project['url']!));
//                       },
//                       child: Card(
//                         clipBehavior: Clip.hardEdge,
//                         color: Colors.white,
//                         elevation: 3,
//                         child: Column(
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 padding: const EdgeInsets.only(top: 20),
//                                 width: Get.width,
//                                 height: 100,
//                                 decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                         image: AssetImage(project["image"] ?? ""),
//                                         fit: BoxFit.fitWidth)),
//                               ),
//                             ),
//                             Container(
//                               padding: const EdgeInsets.all(12),
//                               width: Get.width,
//                               child: Text(project["name"] ?? "",
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     fontSize:
//                                         Adaptive(context).adapt(phone: 16, tablet: 18, desktop: 18),
//                                     fontStyle: FontStyle.normal,
//                                     color: Colors.black,
//                                   )),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ],
//             ),
//           ),
//         SizedBox(
//           width: Get.width,
//         ),
//         // Container(
//         //   padding: const EdgeInsets.only(left: 15, top: 16.0),
//         //   child: Text(
//         //     cardData.description,
//         //     style: GoogleFonts.poppins(
//         //         fontSize: Adaptive(context).adapt(phone: 20, tablet: 22, desktop: 34),
//         //         color: Colors.black,
//         //         fontWeight: FontWeight.w200),
//         //     textDirection: TextDirection.ltr,
//         //   ),
//         // ),
//         // const SizedBox(
//         //   height: 100,
//         // ),
//         // SizedBox(
//         //   width: Get.width,
//         // ),
//         // if (cardData.skills.isNotEmpty)
//         //   Padding(
//         //     padding: const EdgeInsets.all(8.0),
//         //     child: Wrap(
//         //       alignment: WrapAlignment.start,
//         //       direction: Axis.horizontal,
//         //       children: [
//         //         ...cardData.skills.map2((skill, index) {
//         //           return Padding(
//         //             padding: const EdgeInsets.all(8.0),
//         //             child: CircleAvatar(
//         //               backgroundColor: Colors.black,
//         //               backgroundImage: AssetImage(skill),
//         //               // child: Image.asset(skill,width: 100,
//         //               //   fit: BoxFit.fitWidth,
//         //               // )
//         //             ),
//         //           );
//         //         }),
//         //       ],
//         //     ),
//         //   ),
//       ],
//     ),
//   );
// }),
// Obx(
//   () {
//     final int scrollPosition = ((HomeController.currentOffset.value / (Get.height * 3)) * 100).toInt();
//     return AnimatedPositioned(
//       left: scrollPosition > 10 ? 0 : -30,
//       duration: Duration(seconds: 1),
//       child: SizedBox(
//         width: Get.width,
//         height: Get.height,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text(scrollPosition.toString()),
//               ...HomeController.navSections.map2((e, int index) {
//                 return Container(
//                   width: 50,
//                   height: 50,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       border: const Border.fromBorderSide(BorderSide(color: Colors.black, width: 0.8)),
//                       borderRadius: BorderRadius.circular(100)),
//                   child: IconButton(onPressed: () {}, icon: Icon(e.icon)),
//                 );
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   },
// ),
// Container(
//   padding: const EdgeInsets.only(top: 20),
//   width: Get.width,
//   child: Text("Skills",
//       textAlign: TextAlign.left,
//       style: TextStyle(
//           fontSize: Adaptive(context).adapt(
//               phone: 16, tablet: 26.8, desktop: 26.8),
//           fontStyle: FontStyle.normal,
//           color: Colors.black.withAlpha(190),
//           fontWeight: FontWeight.w500)),
// ),

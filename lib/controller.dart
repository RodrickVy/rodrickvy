import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rodrickvy/experience.data.dart';


class NavSection{
  final String name;
  final IconData icon;

  NavSection({required this.name, required this.icon});
}

enum HomeSections{
  header,
  about,
  
}
class AppController extends GetxController {
  bool viewIsScrolling = false;
  late ScrollController scrollController;
  static RxDouble currentOffset = 0.0.obs;
  static RxMap<String, String> currentProject = cards.first.projects.first.obs;
  static RxBool controllerAttached = false.obs;
  
  static Rx<HomeSections> currentPage = HomeSections.header.obs ;
  /// Circle Animation

  static  Rx<double> circle1Radius = 10.0.obs;
  static Rx<double> circle2Radius =100.0.obs;

  static Rx<double> circle1YPosition = 0.0.obs;

  
  static List<NavSection> navSections = [
    NavSection(name: "home", icon: Icons.home),
    NavSection(name: "About", icon: Icons.info),
    NavSection(name: "project", icon: Icons.work_history),
    NavSection(name: "skills", icon: Icons.fact_check_rounded),
  ];
 static Rx<ScrollDirection> userScrollDirection = ScrollDirection.forward.obs;
  static final List<Experience> cards = [
    // Experience(
    //     heading: "The Newbie",
    //     time: "2018",
    //     description: "Began with a passion for creation & zeal for learning."
    //         " My introduction to the magic of HTML & CSS is what"
    //         " unleashed this journey. ",
    //     projects: [
    //       {
    //         "name": "My Own Office 365 :)",
    //         "url": "https://felicitous-4813c.firebaseapp.com/",
    //         "image": "assets/images/office-365.png",
    //         "description":
    //             "Half of the code not my own , half of it didnt understand it :). But this was my first hosted site, and it meant the world to me.",
    //       },
    //       {
    //         "name": "SDA-Beliefs",
    //         "url": "https://sda-beliefs-34869.web.app",
    //         "image": "assets/images/sda-beliefs.png",
    //         "description":
    //             "First single page website in js.",
    //       },
    //     ],
    //     skills: [
    //       "assets/images/html.png",
    //       "assets/images/css.png",
    //       "assets/images/js.png",
    //     ]),
    // Experience(
    //     heading: "Junior Web Developer?",
    //     time: "2019-2020",
    //     description:
    //         "Energetic, kind of knew what I was upto, I built problem solving skills, and learnt great lessons the hard way. ",
    //     projects: [
    //       {
    //         "name": "Powertry-Media",
    //         "url": "https://rodriel-1.web.app/home",
    //         "image": "assets/images/powertry.png",
    //         "description":
    //             "Tried to start out a business and built a website for it, used angular for this.",
    //       },
    //       {
    //         "name": "Dr Mura Health",
    //         "url": "https://mura-health.firebaseapp.com/",
    //         "image": "assets/images/dr-mura-health.png",
    //         "description":
    //             "Freelanced for a lifestyle medicine intervention and education program based in SA. They needed a site temporally for a course event and I created a site with course dashboard,CM and accounts.",
    //       },
    //       {
    //         "name": "Survivors API/SITE",
    //         "url": "https://survivors-history.web.app",
    //         "image": "assets/images/suvivors.png",
    //         "description":
    //             "Using Js I web-scraped video information on residential school survivor's stories , created an API with it and a website to slink those videos.",
    //       },
    //     ],
    //     skills: [
    //       "assets/images/angular.png",
    //       "assets/images/typescript.png",
    //       "assets/images/chrome-dev-tools.png",
    //       "assets/images/firebase-hosting.png",
    //       "assets/images/gitlab.png",
    //     ]),
    Experience(
        heading: "",
        time: "",
        description: "Here are some of the projects I have worked on over the years.",
        projects: [
          {
            "name": "Amen.bible",
            "url": "https://amen.bible/",
            "image": "assets/images/amenbible.png",
            "description":
                "Worked with a team to create a bible app, that supported translation of over 23 languages, I was tasked to design & create the user interface.",
          },
          {
            "name": "Celebrated",
            "url": "https://celebrated-app.web.app/home",
            "image": "assets/images/celebrated.png",
            "description":
                "Created  a multiplatform flutter app as a side project, that helps people remember,plan & celebrate their birthdays",
          },
          {
            "name": "Dr Mura Health",
            "url": "https://mura-health.firebaseapp.com/",
            "image": "assets/images/dr-mura-health.png",
            "description":
                "A Lifestyle medicine intervention and education program based in SA. They needed a site temporally for a course event and I created a site with course dashboard,CMS and accounts.",
          },
        ],
        skills: [
          "assets/images/agile.png",
          "assets/images/dart.png",
          "assets/images/angular-1.png",
          "assets/images/clean-architecture.png",
          "assets/images/svelte.png",
          "assets/images/flutter.png",
          "assets/images/angular.png",
          "assets/images/typescript.png",
          "assets/images/chrome-dev-tools.png",
          "assets/images/firebase-hosting.png",
          "assets/images/gitlab.png",
          "assets/images/html.png",
          "assets/images/css.png",
          "assets/images/js.png",
        ]),
    // Experience(
    //     heading: "My Mission",
    //     time: "2021-Present",
    //     description:
    //         "My ultimate goal is to blend passion for software development with my love for design and business and I do this by growing in all these aspects.",
    //     projects: [],
    //     skills: []
    // ),
  ];

  final Rx<Offset> pointerOffset = const Offset(0, 0).obs;
  final RxBool tapped = false.obs;

  static String description =
      "Am a  software developer with 3 years of experience creating adaptable web, mobile, and desktop applications.";

  static String scrollGif = "assets/images/mouse-scroll.gif";

  AppController() {
    scrollController = ScrollController();
  }

  static AppController get instance {
    try {
      return Get.find<AppController>();
    } catch (_) {
      return Get.put<AppController>(AppController());
    }
  }

  @override
  void onReady() {
    super.onReady();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (scrollController.hasClients) {
        controllerAttached(true);
        timer.cancel();
        print("controller_attached");
      }
    });
   controllerAttached.listen((p0) {
     scrollController.addListener(() {
       currentOffset(scrollController.offset);
       updateAnimation(scrollController.offset);
       userScrollDirection(scrollController.position.userScrollDirection);
     });
   });
  }



  void updateAnimation(double scrollOffset){
    if(scrollOffset < 300){

      circle1Radius(250-scrollOffset);
      circle2Radius(100);
      circle1YPosition(Get.height*((scrollOffset/300)));

      print("totalHeight: ${Get.height}  \nScrollPosition: $scrollOffset \ncircleRadius: ${circle1Radius.value}\ncircle1TopPosition:${circle1YPosition.value}  ");

    }
  }
}

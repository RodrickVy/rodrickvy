import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rodrickvy/controller.dart';
import 'package:rodrickvy/experience.data.dart';
import 'package:rodrickvy/main.dart';
import 'package:rodrickvy/util/adaptive.dart';
import 'package:rodrickvy/util/list.extention.dart';
RxBool _expand = false.obs;

class ValuesListSection extends StatelessWidget {
  ValuesListSection() : super(key: UniqueKey()){
    Timer.periodic(const Duration(seconds: 3), (_) {
      _expand.toggle();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double sectionHeight =  Get.height* 2;
    return SizedBox(
      width: Get.width,
      height:sectionHeight * HomeController.cards.length  ,
      child: Column(
        children: [
          ...HomeController.cards.map2((Experience cardData, index) {
            return Container(
              width: Get.width,
              clipBehavior: Clip.hardEdge,
              height:sectionHeight ,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Container(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 17),
                            width: Get.width,
                            child: Text(cardData.heading,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: Adaptive(context).adapt(
                                        phone: 25, tablet: 34.8, desktop: 34.8),
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900)),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 0),
                            width: Get.width,
                            child: Text(cardData.time,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: Adaptive(context).adapt(
                                        phone: 15, tablet: 24.8, desktop: 24.8),
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900)),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              cardData.description,
                              style: GoogleFonts.poppins(
                                  fontSize: Adaptive(context)
                                      .adapt(phone: 20, tablet: 22, desktop: 34),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200),
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                          // Container(
                          //   padding: const EdgeInsets.only(top: 20),
                          //   width: Get.width,
                          //   child: Text("Projects",
                          //       textAlign: TextAlign.left,
                          //       style: TextStyle(
                          //           fontSize: Adaptive(context).adapt(
                          //               phone: 16, tablet: 26.8, desktop: 26.8),
                          //           fontStyle: FontStyle.normal,
                          //           color: Colors.black.withAlpha(190),
                          //           fontWeight: FontWeight.w500)
                          //   ),
                          // ),

                          if (cardData.projects.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  ...cardData.projects.map2((project, index) {
                                    return SizedBox(
                                      height: 200,
                                      width: 200,
                                      child: InkWell(
                                        onTap: ()  {
                                         HomeController.currentProject(project);
                                         Get.toNamed("/project");
                                        },
                                        child: Card(
                                          clipBehavior: Clip.hardEdge,
                                          color: Colors.white,
                                          elevation: 3,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets.only(
                                                      top: 20),
                                                  width: Get.width,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              project["image"] ??
                                                                  ""),
                                                          fit: BoxFit.fitWidth)),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.all(12),
                                                width: Get.width,
                                                child: Text(project["name"] ?? "",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: Adaptive(context)
                                                          .adapt(
                                                              phone: 16,
                                                              tablet: 22.8,
                                                              desktop: 22.8),
                                                      fontStyle: FontStyle.normal,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            width: Get.width,
                            child: Text("Skills",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: Adaptive(context).adapt(
                                        phone: 16, tablet: 26.8, desktop: 26.8),
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black.withAlpha(190),
                                    fontWeight: FontWeight.w500)),
                          ),
                          if (cardData.skills.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Wrap(
                                alignment:WrapAlignment.start,
                                direction:Axis.horizontal,
                                children: [
                                  ...cardData.skills.map2((skill, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(backgroundColor:Colors.black,child: Image.asset(skill,width: 100,fit: BoxFit.fitWidth,)),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          SizedBox(height: 100,),
                          // SizedBox(width: 400, child:InkWell(
                          //   onTap: () {
                          //     if (HomeController.currentSection.value <
                          //         HomeController.cards.length - 1) {
                          //       HomeController.homeController().toNextSection();
                          //     } else {
                          //       HomeController.homeController().toPreviousSection();
                          //     }
                          //   },
                          //   child:  SizedBox(
                          //     height: 100,
                          //     width: Get.width,
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.center,
                          //       children: [
                          //         if (index != HomeController.cards.length-1)
                          //           Text(
                          //             "${Adaptive(context).adapt(phone: 'tap me', tablet: 'tap me', desktop: 'scroll down')}",
                          //             style: TextStyle(
                          //               fontFamily: "Aileron",
                          //               color: Colors.black,
                          //               fontWeight: FontWeight.w100,
                          //             ),
                          //           ),
                          //         if (index == HomeController.cards.length-1)
                          //           Text(
                          //             "${Adaptive(context).adapt(phone: 'tap me', tablet: 'tap me ', desktop: 'scroll back up')}",
                          //             style: TextStyle(
                          //               fontFamily: "Aileron",
                          //               color: Colors.black,
                          //               fontWeight: FontWeight.w100,
                          //             ),
                          //           ),
                          //         Obx(() => AnimatedContainer(
                          //           duration: const Duration(seconds: 2),
                          //           height: _expand.value ? 40 : 0,
                          //           curve: Curves.linear,
                          //         )),
                          //         if (index != HomeController.cards.length-1)
                          //           Icon(
                          //             Icons.arrow_downward,
                          //             color: Colors.black,
                          //           ),
                          //         if (index == HomeController.cards.length-1)
                          //           Icon(
                          //             Icons.arrow_upward,
                          //             color: Colors.black,
                          //           )
                          //       ],
                          //     ),
                          //   ),
                          // )),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -10,
                      left: 20,
                      child: Container(
                        width: 5,
                        padding: const EdgeInsets.all(10),
                        height: sectionHeight / 3,
                        color: Colors.red,
                      ),
                    ),
                    Obx(
                      () {
                        HomeController.currentSection.value;
                        return Positioned(
                          bottom: 0,
                          left: 0,
                          child: AnimatedContainer(
                              duration: const Duration(milliseconds: 800),
                              margin: EdgeInsets.only(
                                bottom:
                                    HomeController.currentSection.value == index
                                        ? sectionHeight- 58
                                        : sectionHeight / 3,
                                top: 20,
                                left: 2,
                              ),
                              child: const CircleAvatar(
                                backgroundColor: Colors.orange,
                                radius: 20,
                              )),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

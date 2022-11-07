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
      height:sectionHeight * AppController.cards.length  ,
      child: Column(
        children: [

        ],
      ),
    );
  }
}

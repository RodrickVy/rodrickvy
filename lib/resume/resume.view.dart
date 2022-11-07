import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeView extends StatelessWidget {
  static final RxInt _currentPage = 1.obs;

   ResumeView({super.key});


  @override
  Widget build(BuildContext context) {
    //   Container(
    // width: Adaptive(context).adapt(
    //     phone: Adaptive(context).width-50,
    //     tablet: Adaptive(context).width - 150,
    //     desktop: (Adaptive(context).width / 4) * 3),
    // padding: EdgeInsets.all(Adaptive(context).adapt(phone: 200, tablet: 100, desktop: 60)),
    //child:
    

    return Obx(
        ()=> Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("My Resume"),
          ),
          leading: IconButton(
              onPressed: () {
                Get.toNamed('/');
              },
              icon: const Icon(Icons.arrow_back)),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child:  Padding(
              padding: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text( "To zoom in pinch or double click/tap on the image to see more clear"),
              ),
            ),
          ),
          actions: [
          if (_currentPage.value == 2)
           IconButton(
                onPressed: () {

                    _currentPage(1);

                },
                icon: const Icon( Icons.arrow_back_ios)),
            OutlinedButton(
              onPressed: (){},
              style: OutlinedButton.styleFrom(side: BorderSide.none),
              child: Text("${_currentPage.value}/2"),
            ),
            if (_currentPage.value == 1)
              IconButton(
                onPressed: () {

                    _currentPage(2);

                },
                icon: const Icon(Icons.arrow_forward_ios))
          ],
        ),
        body: Obx(
          () => PhotoView(
            backgroundDecoration: const BoxDecoration(
              color: Colors.white,
            ),
            basePosition: Alignment.topCenter,
            imageProvider: AssetImage('assets/resume/${_currentPage.value}.png'),
          ),
        ),
       // bottomSheet: const GetSnackBar(title: "To Zoom In",message: 'pinch or double click/tap on the image to see more clear',duration: Duration(seconds: 2),isDismissible: true,),
        floatingActionButton: FloatingActionButton(onPressed: ()async{
          await launchUrl(Uri.parse('mailto:rodrielnt@gmail.com'));

        },child: const Icon(Icons.email),),

      ),
    );
  }
}

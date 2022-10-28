import 'package:flutter/cupertino.dart';
import 'package:pdfx/pdfx.dart';
import 'package:rodrickvy/util/adaptive.dart';
final pdfPinchController = PdfController(
  document: PdfDocument.openAsset('assets/images/resume.pdf'),
);
class ResumeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 //   Container(
      // width: Adaptive(context).adapt(
      //     phone: Adaptive(context).width-50,
      //     tablet: Adaptive(context).width - 150,
      //     desktop: (Adaptive(context).width / 4) * 3),
      // padding: EdgeInsets.all(Adaptive(context).adapt(phone: 200, tablet: 100, desktop: 60)),
        //child:
        return PdfView(controller: pdfPinchController);
  }
}

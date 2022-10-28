
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rodrickvy/util/adaptive.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? _descriptionStyle = Adaptive(context)
        .adapt(
        phone: Theme.of(context).textTheme.subtitle1,
        tablet: Theme.of(context).textTheme.headline5,
        desktop: Theme.of(context).textTheme.headline5)
        ?.copyWith(fontWeight: FontWeight.w600, color: Colors.black87);
    double width = Adaptive(context).adapt(
        phone: Adaptive(context).width,
        tablet: Adaptive(context).width - 20,
        desktop: (Adaptive(context).width / 4) * 3);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        padding: EdgeInsets.all(Adaptive(context).adapt(phone: 12, tablet: 18, desktop: 24)),
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: OutlinedButton.icon(
                    onPressed: () async {
                      await launchUrl(Uri.parse('https://www.youtube.com/channel/UCyRu3m1t5c9ISX_sOE24C0A'));
                    },
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(14),
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                    icon: const Icon(Icons.play_arrow),
                    label: Text(
                      "Youtube",
                      style: Theme.of(context).textTheme.button?.copyWith(fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: OutlinedButton.icon(
                    onPressed: () async {
                      await launchUrl(Uri.parse('https://medium.com/@rodrickvy'));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                    icon: const Icon(Icons.article),
                    label: Text(
                      "Medium",
                      style: Theme.of(context).textTheme.button?.copyWith(fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: OutlinedButton.icon(
                    onPressed: () async {
                      Get.toNamed("/resume");
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                    icon: const Icon(Icons.article),
                    label: Text(
                      "Resume",
                      style: Theme.of(context).textTheme.button?.copyWith(fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
          SizedBox(
            width: width,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              children: [
                SizedBox(
                  height: Get.height / 7,
                  width: Get.width,
                ),
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Hey,\n",
                          style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.black87,
                              fontSize: Adaptive(context).adapt(phone: 23, tablet: null, desktop: null))),
                      TextSpan(
                          text: "am",
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontStyle: FontStyle.italic)),
                      TextSpan(
                          text: " Rodrick\n",
                          style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor.withGreen(120))),
                      TextSpan(
                          text:
                          "Am a front-end software developer with 3 years of experience in website and application development.\n\n"
                              "I have created adaptable web, mobile, and desktop applications "
                              " working with back-end systems like Firebase,"
                              "Cloud Run, Identity Platform, Cloud Storage and other GCP APIs.",
                          style: _descriptionStyle),
                    ])),
                SizedBox(
                  width: Get.width,
                  height: 30,
                ),
                const Divider(
                  height: 20,
                ),
                Container(
                  width: width,
                  child: Text(
                      "\n\n"
                          "I am currently a student ,seeking more experience to one day merge my passion for 📐design, 👨🏿‍💻software, and 💰business.",
                      style: _descriptionStyle?.copyWith(fontStyle: FontStyle.italic)),
                ),
                const SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
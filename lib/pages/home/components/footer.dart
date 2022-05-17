import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolioth/models/footer_item.dart';
import 'package:portifolioth/utils/constants.dart';
import 'package:portifolioth/utils/screen_helper.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:responsive_framework/responsive_framework.dart';

final List<FooterItem> footerItems = [
  //FooterItem(
  //  iconPath: "assets/mappin.png",
  //  title: "ADDRESS",
  //  text1: "999 Carter Street",
  //  text2: "Sailor Springs, IL 64234",
  //),
  //FooterItem(
  //  iconPath: "assets/phone.png",
  //  title: "PHONE",
  //  text1: "+1 618-689-9604",
  //  text2: "+1 781-689-9632",
  //),
  FooterItem(
    iconPath: "assets/email.png",
    title: "EMAIL",
    text1: "thtowers@gmail.com",
  ),
  FooterItem(
    iconPath: "assets/whatsapp.png",
    title: "WHATSAPP",
    text1: "(21) 96552-4224 ",
  )
];

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => Container(
                          color: Colors.transparent,
                          height: 120.0,
                          width: ScreenHelper.isMobile(context)
                              ? constraints.maxWidth / 2.0 - 20.0
                              : constraints.maxWidth / 4.0 - 20.0,
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      footerItem.iconPath,
                                      width: 25.0,
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      footerItem.title,
                                      style: GoogleFonts.oswald(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "${footerItem.text1}\n",
                                        style: const TextStyle(
                                          color: kCaptionColor,
                                          height: 1.8,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: ScreenHelper.isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Copyright (c) 2021 Thiago Torres. All rights Reserved",
                      style: TextStyle(
                        color: kCaptionColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Política de Privacidade ",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: const Text(
                          "|",
                          style: TextStyle(
                            color: kCaptionColor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Termos & Condições",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}

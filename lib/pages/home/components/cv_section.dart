import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolioth/models/design_process.dart';
import 'package:portifolioth/utils/constants.dart';
import 'package:portifolioth/utils/screen_helper.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:responsive_framework/responsive_grid.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:responsive_framework/responsive_wrapper.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "DESIGN",
    imagePath: "assets/design.png",
    subtitle: "Um Design moderno e leve",
  ),
  DesignProcess(
    title: "PROGRAMADOR",
    imagePath: "assets/develop.png",
    subtitle: "App e Web Site escalável e responsivo ",
  ),
  DesignProcess(
    title: "LINGUAGEM",
    imagePath: "assets/write.png",
    subtitle: "Desenvolvimento dos App e Web Site do zero",
  ),
  DesignProcess(
    title: "PUBLICAR",
    imagePath: "assets/promote.png",
    subtitle: "Orientação de publicação do App e Web Site",
  ),
];

class CvSection extends StatelessWidget {
  const CvSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    // we need the context to get maxWidth before the constraints below
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "MELHORES DESIGN,\nMELHORES EXPERIÊNCIAS",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  height: 1.8,
                  fontSize: 18.0,
                ),
              ),
              //GestureDetector(
              //  onTap: () {},
              //  child: MouseRegion(
              ///    cursor: SystemMouseCursors.click,
              //    child: Text(
              //      "DOWNLOAD CV",
              //      style: GoogleFonts.oswald(
              //         color: kPrimaryColor,
              //         fontWeight: FontWeight.w900,
              //         fontSize: 16.0,
              //       ),
              //     ),
              //   ),
              //  ),
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
          Container(
            color: Colors.transparent,
            child: LayoutBuilder(
              builder: (_context, constraints) {
                return ResponsiveGridView.builder(
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  alignment: Alignment.topCenter,
                  gridDelegate: ResponsiveGridDelegate(
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                            ScreenHelper.isMobile(context)
                        ? constraints.maxWidth / 2.0
                        : 250.0,
                    // Hack to adjust child height
                    childAspectRatio: ScreenHelper.isDesktop(context)
                        ? 1
                        : MediaQuery.of(context).size.aspectRatio * 1.5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                designProcesses[index].imagePath,
                                width: 40.0,
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                designProcesses[index].title,
                                style: GoogleFonts.oswald(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            designProcesses[index].subtitle,
                            style: const TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: designProcesses.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

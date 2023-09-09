import 'package:flutter/material.dart';
import 'package:resume_creator/core/components.dart';
import 'package:resume_creator/main.dart';
import 'package:resume_creator/screens/onboarding/pager_content.dart';
import 'package:resume_creator/screens/onboarding/pager_dots.dart';
import 'package:resume_creator/screens/routes.dart';
import 'package:resume_creator/screens/splash_screen.dart';
import 'package:resume_creator/utils/app_constants.dart';
import 'package:resume_creator/utils/dimensions.dart';
import 'package:resume_creator/utils/gaps.dart';
import 'package:resume_creator/utils/navigation.dart';
import 'package:resume_creator/utils/shared_preference/shared_prefer.dart';
import 'package:resume_creator/utils/styles.dart';

List<Map<String, String>> onBoardPagerData = [
  {
    "text": 'Step:1 Upload Your Information ',
    "subTitle": 'First Add all your academic and experience details.',
    "image": "assets/images/onboard_light.gif"
  },
  {
    "text": 'Step2:  Select Theme',
    "subTitle":
        'customize theme with your favorite fonts, colors and backgrounds.',
    "image": "assets/images/onboard_light_two.gif"
  },
  {
    "text": 'Step3:  Download or Share',
    "subTitle": 'Now you can download and share your resumes.',
    "image": "assets/images/onboard_light_three.gif"
  }
];

class OnBoardPopulated extends StatefulWidget {
  OnBoardPopulated({Key? key}) : super(key: key);

  @override
  State<OnBoardPopulated> createState() => _OnBoardPopulatedState();
}

class _OnBoardPopulatedState extends State<OnBoardPopulated> {
  final PageController _pageController = PageController();

  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemCount: onBoardPagerData.length,
              itemBuilder: (context, index) => PagerContent(
                image: onBoardPagerData[index]["image"]!,
                text: onBoardPagerData[index]["text"]!,
                subText: onBoardPagerData[index]["subTitle"]!,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  Gaps.verticalGapOf(30),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          onBoardPagerData.length,
                          (index) => PagerDot(
                              index: index, currentIndex: _activePage))),
                  const Spacer(),
                ],
              ),
            ),
          ),
          _activePage != 0
              ? Row(
                  children: [
                    button(context, previousPage, "Prev"),
                    const Spacer(),
                    button(
                        context, nextPage, _activePage != 2 ? "Next" : "Finish")
                  ],
                )
              : Row(
                  children: [
                    button(context, () {
                      SharedPrefs.instance
                          .setBool(AppConstants.onboarding, false);
                      AppNavigatorService.pushNamedAndRemoveUntil(context, RouteGenerator.splashScreen);
                    }, "Skip"),
                    const Spacer(),
                    button(context, nextPage, "Next")
                  ],
                )
        ],
      ),
    );
  }

  Widget button(BuildContext context, Function()? onTap, text) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: ubuntuRegular.copyWith(
              fontSize: Dimensions.fontSizeExtraLarge,
              color:
                  Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(.6),
            ),
          ),
        ),
      ),
    );
  }


  nextPage() {
    if (_activePage == 2) {
      AppNavigatorService.pushNamedAndRemoveUntil(context, RouteGenerator.splashScreen);
    } else {
      _activePage = _activePage + 1;
      _pageController.animateToPage(
        _activePage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
  }

  previousPage() {
    if (_activePage == 0) {
    } else {
      _activePage = _activePage - 1;
      _pageController.animateToPage(
        _activePage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
  }
}

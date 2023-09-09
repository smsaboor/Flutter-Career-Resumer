
import 'package:flutter/material.dart';
import 'package:resume_creator/utils/dimensions.dart';

bool darkTheme=false;

const ubuntuLight = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w300,
);

const ubuntuRegular = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w400,
);

const ubuntuMedium = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w500,
);

const ubuntuBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w700,
);

List<BoxShadow>? searchBoxShadow = darkTheme
    ? null
    : [
        const BoxShadow(
            offset: Offset(0, 3),
            color: Color(0x208F94FB),
            blurRadius: 5,
            spreadRadius: 2)
      ];

//card boxShadow
List<BoxShadow>? cardShadow = darkTheme
    ? [const BoxShadow()]
    : [
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 2,
          color: Colors.black.withOpacity(0.15),
        )
      ];

List<BoxShadow>? shadow = darkTheme
    ? [
        BoxShadow(
            offset: const Offset(0, 3),
            color: Colors.grey[100]!,
            blurRadius: 1,
            spreadRadius: 2)
      ]
    : [
        BoxShadow(
            offset: const Offset(0, 3),
            color: Colors.grey[100]!,
            blurRadius: 1,
            spreadRadius: 2)
      ];


Decoration shimmerDecorationGreySoft = BoxDecoration(
  color: Colors.grey[darkTheme ? 700 : 300],
  borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
);

Decoration shimmerDecorationGreyHard = BoxDecoration(
  color: Colors.grey[darkTheme ? 700 : 400],
  borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
);

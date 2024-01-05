import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle getAppFonts(
      {required FontWeight fontWeight,
      required double fontSize,
      required Color color,
      required double fontHeight}) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
      height: fontHeight,
    );
  }

  static final w700white24 = getAppFonts(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Colors.white,
    fontHeight: 1.2,
  );
  static final w700black20 = getAppFonts(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: Colors.black,
    fontHeight: 1.2,
  );
  static final w700green20 = getAppFonts(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: const Color(0xff45C08D),
    fontHeight: 1.2,
  );
  static final w500dark214 = getAppFonts(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: const Color(0xff606060),
    fontHeight: 1.2,
  );
  static final w500white14 = getAppFonts(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.white,
    fontHeight: 1.2,
  );
  static final w500green14 = getAppFonts(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Color(0xff45C08D),
    fontHeight: 1.2,
  );
  static final w500blue14 = getAppFonts(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Color(0xff161F31),
    fontHeight: 1.2,
  );
  static final w700white16 = getAppFonts(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Colors.white,
    fontHeight: 1.2,
  );

  static final w500blue18 = getAppFonts(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: const Color(0xff161F31),
    fontHeight: 1.2,
  );
  static final w700black16 = getAppFonts(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Colors.black,
    fontHeight: 1.2,
  );
  static final w700green15 = getAppFonts(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: Color(0xff45C08D),
    fontHeight: 1.2,
  );
  static final w700black15 = getAppFonts(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: Colors.black,
    fontHeight: 1.2,
  );
  static final w700blue16 = getAppFonts(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: const Color(0xff161F31),
    fontHeight: 1.2,
  );
  static final w700black14 = getAppFonts(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: Colors.black,
    fontHeight: 1.2,
  );
  static final w500dark210 = getAppFonts(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: const Color(0xff484848),
    fontHeight: 1.2,
  );
  static final w500dark212 = getAppFonts(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: const Color(0xff484848),
    fontHeight: 1.2,
  );
  static final w500black12 = getAppFonts(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: Colors.black,
    fontHeight: 1.2,
  );
  static final w500black14 = getAppFonts(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.black,
    fontHeight: 1.2,
  );
  static final w500black11 = getAppFonts(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: Colors.black,
    fontHeight: 1.2,
  );
  static final w500dark216 = getAppFonts(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: const Color(0xff484848),
    fontHeight: 1.2,
  );
  static final w700blue20 = getAppFonts(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: const Color(0xff161F31),
    fontHeight: 1.2,
  );
}

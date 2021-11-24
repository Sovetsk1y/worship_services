import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final bigTitle = GoogleFonts.montserrat(
  fontWeight: FontWeight.w800,
  fontSize: 30,
);

final bigTitleStroked = GoogleFonts.montserrat(
  foreground: Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1,
  fontWeight: FontWeight.w800,
  fontSize: 30,
);

final emptyListStyle = GoogleFonts.montserrat(
  fontWeight: FontWeight.w500,
  fontSize: 21,
  color: black1,
);

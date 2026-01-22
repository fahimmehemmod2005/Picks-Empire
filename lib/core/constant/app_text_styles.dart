import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle size32w500({Color? color}) => GoogleFonts.plusJakartaSans(fontSize: 32, fontWeight: FontWeight.w500, color: color,
  );
}

extension TextStyleExtension on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
}

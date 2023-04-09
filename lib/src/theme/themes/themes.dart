import 'package:flutter/material.dart';

const inputDecorationTheme =
    InputDecorationTheme(border: outlineInputBorder, isDense: true);

const inputDecoration = InputDecoration(filled: true);

const outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 0, style: BorderStyle.none),
  borderRadius: borderRadius30,
);

const borderRadius10 = BorderRadius.all(Radius.circular(10));
const borderRadius15 = BorderRadius.all(Radius.circular(15));
const borderRadius20 = BorderRadius.all(Radius.circular(20));
const borderRadius30 = BorderRadius.all(Radius.circular(30));

const tabDecoration = BoxDecoration(borderRadius: borderRadius30);
const roundedBoxDecoration30 = BoxDecoration(borderRadius: borderRadius30);
const roundedBoxDecoration15 = BoxDecoration(borderRadius: borderRadius15);
const roundedBoxDecoration20 = BoxDecoration(borderRadius: borderRadius20);
const roundedRectangleBorder30 =
    RoundedRectangleBorder(borderRadius: borderRadius30);
const roundedRectangleBorder15 =
    RoundedRectangleBorder(borderRadius: borderRadius15);

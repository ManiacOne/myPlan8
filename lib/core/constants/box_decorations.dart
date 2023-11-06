import 'package:flutter/material.dart';

final BoxDecoration authBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [const Color(0xffd8f2b5).withOpacity(0.2), const Color(0xffffffff)],
    stops: const [0, 0.6],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

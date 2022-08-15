import 'dart:js';

import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:la_vie/presentation_layer/constants/constants.dart';

Widget navBarWeb(List<Map<String, Widget>> screens) {
  return Flexible(
    flex: 1,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(AppPadding.p20),
          child: Text(
            screens[index]
                .keys
                .toString()
                .replaceAll('(', '')
                .replaceAll(')', ''),
          ),
        );
      },
      itemCount: screens.length,
    ),
  );
}

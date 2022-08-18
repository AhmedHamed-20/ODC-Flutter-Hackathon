import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

Widget navBarWeb(List<Map<String, Widget>> screens) {
  return Flexible(
    flex: 2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text('Home'),
        Text('Shop'),
        Text('Blog'),
        Text('About'),
        Text('Community'),
      ],
    ),
  );
}

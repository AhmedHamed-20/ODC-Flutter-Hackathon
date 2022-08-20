import 'package:flutter/material.dart';
import 'package:la_vie/view/constants/constants.dart';

class BlogDetailes extends StatelessWidget {
  final String photoUrl;
  final String blogTitle;
  final String blogDetailes;
  const BlogDetailes(this.blogDetailes, this.blogTitle, this.photoUrl,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image.network(
              photoUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: AppHeight.h8,
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Text(
              blogTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: AppFontSize.s20),
            ),
          ),
          const SizedBox(
            height: AppHeight.h8,
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Text(
              blogDetailes,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: AppFontSize.s18,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

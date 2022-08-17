import 'package:flutter/material.dart';
import 'package:la_vie/presentation_layer/constants/constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyp4gAct8mXsUK_purhunJBH5baCGdd7j8-MKYs98cnMjWZUniSXBdp9DvzzHmqs_5TyY&usqp=CAU',
                  ),
                  radius: AppRadius.r22,
                ),
                title: Text(
                  'name',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(
                  'subtitle',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              );
            },
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: AppColors.dividerColorGrey,
              );
            },
          ),
        )
      ],
    );
  }
}

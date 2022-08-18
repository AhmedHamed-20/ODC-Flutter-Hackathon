import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Stack(
                      children: [
                        Image.network(
                          'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.8),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.iconColorWhite,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                radius: AppRadius.r70,
                                backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                                ),
                              ),
                              const SizedBox(
                                height: AppHeight.h8,
                              ),
                              Text(
                                'Ahmed Mohamed',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      fontSize: AppFontSize.s20,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(AppRadius.r22),
                          topRight: Radius.circular(AppRadius.r22),
                        ),
                        color: Theme.of(context).backgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.circular(AppRadius.r10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(AppPadding.p14),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: AppColors.starsCircleBorder),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.all(AppPadding.p6),
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/stars.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: AppWidth.w8,
                                    ),
                                    Text(
                                      'You have 30 points',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: AppHeight.h20,
                            ),
                            Text(
                              'Edit Your Profile',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p12),
                              child: Card(
                                child: ListTile(
                                  leading: CircleAvatar(),
                                  title: Text(
                                    'Change Name',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward,
                                    color: AppColors.iconColorGrey,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(AppElevation.eL12),
                              child: Card(
                                child: ListTile(
                                  leading: CircleAvatar(),
                                  title: Text(
                                    'Change Email',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward,
                                    color: AppColors.iconColorGrey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

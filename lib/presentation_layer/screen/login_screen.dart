import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/data_layer/bloc/login_cubit/login_cubit.dart';
import 'package:la_vie/data_layer/bloc/login_cubit/login_states.dart';
import 'package:la_vie/presentation_layer/constants/constants.dart';
import 'package:la_vie/presentation_layer/constants/controllers.dart';

import '../widgets/widgets.dart';
import 'components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    TabBarController.tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginCubitStates>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: -10,
                  right: -10,
                  child: Image.asset('assets/images/login_tree.png'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppPadding.p16),
                        child: Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                          ),
                        ),
                      ),
                      TabBar(
                        unselectedLabelStyle: GoogleFonts.roboto(
                          fontSize: AppFontSize.s18,
                          fontWeight: FontWeight.w600,
                        ),
                        labelColor: Theme.of(context).primaryColor,
                        unselectedLabelColor: AppColors.subtitleTextColor,
                        controller: TabBarController.tabController,
                        labelStyle: GoogleFonts.roboto(
                          fontSize: AppFontSize.s18,
                          fontWeight: FontWeight.w600,
                        ),
                        indicatorColor: Theme.of(context).primaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: const [
                          Text(
                            'Sign up',
                          ),
                          Text(
                            'Login',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppHeight.h10,
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: TabBarController.tabController,
                          children: [
                            Container(),
                            loginWidget(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -15,
                  left: -15,
                  child: RotationTransition(
                      turns: const AlwaysStoppedAnimation(180 / 360),
                      child: Image.asset('assets/images/login_tree.png')),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:obod_shahar/cubit/tab/tab_cubit.dart';
import 'package:obod_shahar/utils/color.dart';
import 'package:obod_shahar/utils/custom_packages/bottom_navy_bar.dart';
import 'package:obod_shahar/utils/icons/action/action.dart';
import 'package:obod_shahar/utils/icons/editor/editor.dart';
import 'package:obod_shahar/utils/icons/notification/notification.dart';
import 'package:obod_shahar/utils/icons/social/social.dart';

class TabBox extends StatefulWidget {
  TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      Container(),
      Container(),
      Container(),
    ];
    super.initState();
  }

  _init() async {
    print("INTERNET TURNED ON CALL ANY API");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      //drawer: const CustomDrawer(),
      body: BlocBuilder<TabCubit, TabsState>(
        builder: (cubit, state) {
          return Stack(
            children: [
              IndexedStack(
                index: state.currentPage,
                children: screens,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: BottomNavyBar(
                  bottomNavHeight: 70.h,
                  selectedIndex: state.currentPage,
                  showElevation: true,
                  curve: Curves.easeIn,
                  onItemSelected: (index) => setState(
                      () => context.read<TabCubit>().changeTabState(index)),
                  items: <BottomNavyBarItem>[
                    BottomNavyBarItem(
                      icon: SvgPicture.asset(
                        ActionIcons.home,
                        color: MyColors.primary,
                        height: 24.h,
                      ),
                      title: Text(tr('Asosiy')),
                      activeColor: MyColors.primary,
                      textAlign: TextAlign.center,
                    ),
                    BottomNavyBarItem(
                      icon: SvgPicture.asset(
                        NotificationIcons.eventNote,
                        color: MyColors.primary,
                        height: 24.h,
                      ),
                      title: Text(tr('others.appointment')),
                      activeColor: MyColors.primary,
                      textAlign: TextAlign.center,
                    ),
                    BottomNavyBarItem(
                      icon: SvgPicture.asset(
                        EditorIcons.formatLineSpacing,
                        color: MyColors.primary,
                        height: 24.h,
                      ),
                      title: Text(
                        tr("history_screen.history"),
                      ),
                      activeColor: MyColors.primary,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // BlocListener<ConnectivityCubit, ConnectivityState>(
              //   listener: (context, state) {
              //     if (state.connectivityResult == ConnectivityResult.none) {
              //       Navigator.pushNamed(
              //         context,
              //         noInternetRoute,
              //         arguments: _init,
              //       );
              //     }
              //   },
              //   child: const SizedBox(),
              // )
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:something/screens/dashboard/components/mortage.dart';
import 'package:something/screens/dashboard/components/utilities.dart';
import 'package:something/screens/dashboard/dashboard_screen.dart';
import 'package:something/screens/main/main_screen.dart';

import '../../dashboard/components/llc.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [

          DrawerListTile(
            title: "Properties",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashBoardPage()),
              );

            },
          ),
          DrawerListTile(
            title: "Utilities",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UtilityPage()),
              );
            },
          ),
          DrawerListTile(
            title: "INFO-LLC",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LLCPage()),
              );
            },
          ),
          DrawerListTile(
            title: "INFO - Mortage",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MortagePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}

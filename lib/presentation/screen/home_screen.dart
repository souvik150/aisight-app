import 'package:aisight_app/constants/colors.dart';
import 'package:aisight_app/presentation/screen/image_screen.dart';
import 'package:aisight_app/presentation/screen/dashboard_screen.dart';
import 'package:aisight_app/presentation/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu, color: primaryIconColor),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  final List<Widget> screeens = [
    const ImageScreen(),
    const DashboardScreen(),
    const ProfileScreen()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScrren = const DashboardScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: appBarColor,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "AISight",
                    style: TextStyle(color: primaryColor, fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  SvgPicture.asset(
                    'assets/logo.svg',
                    height: 70,
                    width: 70,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined, color: textColor),
              title: const Text('Home', style: TextStyle(color: textColor)),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.account_circle_outlined, color: textColor),
              title: const Text('Profile', style: TextStyle(color: textColor)),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined, color: textColor),
              title: const Text('Logout', style: TextStyle(color: textColor)),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
            // Add more menu items as needed
          ],
        ),
      ),
      body: PageStorage(
        bucket: bucket,
        child: currentScrren,
      ),
      bottomNavigationBar: BottomAppBar(
        color: appBarColor,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 30,
                    onPressed: () {
                      setState(() {
                        currentScrren = const DashboardScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 0
                              ? primaryIconColor
                              : hoverIconColor,
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                            color: currentTab == 0
                                ? primaryIconColor
                                : hoverIconColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    minWidth: 30,
                    onPressed: () {
                      setState(() {
                        currentScrren = const ImageScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.document_scanner_rounded,
                          color: currentTab == 1
                              ? primaryIconColor
                              : hoverIconColor,
                        ),
                        Text(
                          'Image',
                          style: TextStyle(
                              color: currentTab == 1
                                  ? primaryIconColor
                                  : hoverIconColor),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    minWidth: 30,
                    onPressed: () {
                      setState(() {
                        currentScrren = const ProfileScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: currentTab == 2
                              ? primaryIconColor
                              : hoverIconColor,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: currentTab == 2
                                  ? primaryIconColor
                                  : hoverIconColor),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

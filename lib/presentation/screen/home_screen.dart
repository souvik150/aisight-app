import 'package:aisight_app/presentation/screen/camera_screen.dart';
import 'package:aisight_app/presentation/screen/dashboard_screen.dart';
import 'package:aisight_app/presentation/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffADC8CE),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu, color: Color(0xff00425A)),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      title: Image.asset('assets/images/logo_jaunnt.png', height: 45),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.filter_alt,
            color: Color(0xff00425A),
          ),
          onPressed: () {
            // TODO: Implement filter functionality
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications_rounded,
            color: Color(0xff00425A),
          ),
          onPressed: () {
            // TODO: Implement notifications functionality
          },
        ),
      ],
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
    const CameraScreen(),
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
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffADC8CE),
              ),
              child: Text('Menu'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // TODO: Navigate to home screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                // TODO: Navigate to profile screen
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
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          currentTab == 0
                              ? Icons.home_rounded
                              : Icons.home_outlined,
                          color: currentTab == 0
                              ? const Color.fromARGB(255, 5, 74, 153)
                              : const Color(0xff3D3D3D),
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(
                              color: currentTab == 0
                                  ? const Color.fromARGB(255, 5, 74, 153)
                                  : const Color(0xff3D3D3D)),
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
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          currentTab == 1
                              ? Icons.explore
                              : Icons.explore_outlined,
                          color: currentTab == 1
                              ? const Color.fromARGB(255, 5, 74, 153)
                              : const Color(0xff3D3D3D),
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                              color: currentTab == 1
                                  ? const Color.fromARGB(255, 5, 74, 153)
                                  : const Color(0xff3D3D3D)),
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
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          currentTab == 4
                              ? Icons.account_circle
                              : Icons.account_circle_outlined,
                          color: currentTab == 4
                              ? const Color.fromARGB(255, 5, 74, 153)
                              : const Color(0xff3D3D3D),
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: currentTab == 4
                                  ? const Color.fromARGB(255, 5, 74, 153)
                                  : const Color(0xff3D3D3D)),
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

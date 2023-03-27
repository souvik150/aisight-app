import 'package:aisight_app/presentation/screen/image_screen.dart';
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
      actions: [
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 30,
                    onPressed: () {
                      setState(() {
                        currentScrren = const ProfileScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 0
                              ? const Color.fromARGB(255, 5, 74, 153)
                              : const Color(0xff3D3D3D),
                        ),
                        Text(
                          'Dashboard',
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
                        currentScrren = const ImageScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: currentTab == 1
                              ? const Color.fromARGB(255, 5, 74, 153)
                              : const Color(0xff3D3D3D),
                        ),
                        Text(
                          'Camera',
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
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: currentTab == 2
                              ? const Color.fromARGB(255, 5, 74, 153)
                              : const Color(0xff3D3D3D),
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: currentTab == 2
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

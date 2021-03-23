import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vk_responsive/config/palette.dart';
import 'home_page.dart';
import 'package:vk_responsive/widgets/widgets.dart';
import 'package:vk_responsive/repository/repository.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  final List<Widget> _pages = [
    HomePage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
          preferredSize: Size(screenSize.width, 64.0),
          child: CustomAppBar(
            currentUser: currentUser,
          ),
        ) : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar:  !Responsive.isDesktop(context)
            ? BottomNavigationBar(
             currentIndex: _selectedIndex,
            onTap: (i){
               setState(() {
                 _selectedIndex =i;
               });
            },
            items: [
              BottomNavigationBarItem(icon: Icon( Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon( MdiIcons.blur),label: "Hub"),
              BottomNavigationBarItem(icon: Icon( MdiIcons.chatOutline),label: "Messages"),
              BottomNavigationBarItem(icon: Icon( MdiIcons.handPeace),label: "Clips"),
              BottomNavigationBarItem(icon: Icon(  MdiIcons.account),label: "Profile"),
            ],
          type: BottomNavigationBarType.fixed,
          fixedColor: Palette.vkBlue,
        ) : const SizedBox.shrink(),
      ),

    );
  }
}

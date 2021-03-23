import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vk_responsive/config/palette.dart';
import 'package:vk_responsive/models/left_navbar_model.dart';


class LeftNavBar extends StatelessWidget {

  List<LeftNavBarModel> navs1 = [
    LeftNavBarModel(label: "My Profile", iconData: MdiIcons.account),
    LeftNavBarModel(label: "News", iconData: MdiIcons.newspaper),
    LeftNavBarModel(label: "Messenger", iconData: MdiIcons.chatOutline),
    LeftNavBarModel(label: "Friends", iconData: MdiIcons.accountMultipleOutline),
    LeftNavBarModel(label: "Communities", iconData: MdiIcons.accountGroupOutline),
    LeftNavBarModel(label: "Photos", iconData: MdiIcons.image),
    LeftNavBarModel(label: "Music", iconData: MdiIcons.music),
    LeftNavBarModel(label: "Videos", iconData: MdiIcons.playCircleOutline),
    LeftNavBarModel(label: "Clips", iconData: MdiIcons.handPeace),
    LeftNavBarModel(label: "Games", iconData: MdiIcons.gamepadVariantOutline),
  ];
  List<LeftNavBarModel> navs2 = [
    LeftNavBarModel(label: "Mini Apps", iconData: MdiIcons.blur),
    LeftNavBarModel(label: "Vk Pay", iconData: MdiIcons.currencyRub),
    LeftNavBarModel(label: "Jobs", iconData: MdiIcons.briefcaseOutline),
  ];
  List<LeftNavBarModel> navs3 = [
    LeftNavBarModel(label: "Market", iconData: MdiIcons.briefcasePlusOutline),
    LeftNavBarModel(label: "Bookmarks", iconData: MdiIcons.bookmarkMultipleOutline),
    LeftNavBarModel(label: "Files", iconData: MdiIcons.fileDocumentMultipleOutline),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          _NavsList(list: navs1),
          _Divide(),
          _NavsList(list: navs2),
          _Divide(),
          _NavsList(list: navs3),
          _Divide(),
        ],
      ),
    );
  }
}

class _NavsList extends StatelessWidget {
  final List<LeftNavBarModel> list;
  const _NavsList({@required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: list.map((e) => _Item(label: e.label, iconData: e.iconData,)).toList(),
    );
  }
}

class _Divide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26,6,10,6),
      child: Divider(
        color: Colors.grey.withOpacity(0.8),
      ),
    );
  }
}


class _Item extends StatelessWidget {
  final String label;
  final IconData iconData;

  const _Item({this.label, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical : 6.0),
      child: Row(
        children: [
         Icon(iconData, size: 20, color: Palette.vkBlue,),
          SizedBox(width: 6,),
          Text('$label',
            style: TextStyle(
              color: Palette.textActive,
              fontSize: 14
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vk_responsive/config/palette.dart';
import 'widgets.dart';

class RightNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ListView(
        children: [
          ClipContainer(
            vertPadding: false,
           widget: Container(
             padding: const EdgeInsets.symmetric(vertical: 16),
             width: double.infinity,
             child: Column(
               children: [
                 _Item(label: 'News', selected: true,),
                 _Item(label: 'Recommendations'),
                 _Item(label: 'Search'),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                   child: Divider(
                     color: Colors.grey.withOpacity(0.8),
                   ),
                 ),
                 _Item(label: 'Liked'),
                 _Item(label: 'Updates'),
                 _Item(label: 'Comments'),
               ],
             ),
           ),
          )
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final bool selected;
  final String label;
  const  _Item({this.selected= false, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected ? Colors.grey.withOpacity(0.2) : Colors.transparent,
      height: 30,
      child: Row(
        children: [
          selected
              ? Container(
            width: 3,
            color: Palette.vkBlue,)
          : Container(),
          SizedBox(width: 18,),
          Text('$label', style: TextStyle(
            color: selected ? Palette.textActive: Palette.vkBlue
          ),)
        ],
      ),
    );
  }
}


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vk_responsive/config/palette.dart';
import 'package:vk_responsive/models/models.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;

  CustomAppBar({@required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 4,
      child: Row(
        children: [
          const Spacer(),
          Flexible(
            flex: 2,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: CachedNetworkImage(
                    height: 30,
                    width: 30,
                    imageUrl:
                        'data:image/png;base64,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',
                  ),
                )),
          ),
          Container(
            width: 600.0,
            child: Row(
              children: [
                Flexible(
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.18),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            icon: Icon(Icons.search)),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(MdiIcons.bellOutline),
                  iconSize: 28,
                  color: Palette.vkBlue,
                  onPressed: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: Icon(MdiIcons.music),
                  iconSize: 28,
                  color: Palette.vkBlue,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${currentUser.name.split(' ')[0]}",
                      style: TextStyle(
                          color: Palette.textActive,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          CachedNetworkImageProvider(currentUser.imageUrl),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

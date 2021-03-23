import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class  CreatePostContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[200],
              backgroundImage: CachedNetworkImageProvider(
                  'https://images.unsplash.com/photo-1525253086316-d0c936c814f8'),
            ),
          ),
          SizedBox(width: 8,),
          Expanded(
            flex: 8,
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey.withOpacity(0.18),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "What's new?",
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: IconButton(
                  icon: Icon(MdiIcons.handPeace),
                  color: Colors.grey,
                  onPressed: (){})),
          Expanded(
              flex: 1,
              child: IconButton(
                  icon: Icon(MdiIcons.lightbulb),
                  color: Colors.grey,
                  onPressed: (){}))
        ],
      ),
    );
  }
}

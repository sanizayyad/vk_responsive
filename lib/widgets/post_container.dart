import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vk_responsive/config/palette.dart';
import 'package:vk_responsive/models/models.dart';
import 'package:vk_responsive/widgets/widgets.dart';


class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({@required this.post});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return ClipContainer(
      widget: Container(
        padding: EdgeInsets.symmetric(vertical: isDesktop ? 16 : 8, horizontal: isDesktop ? 16 : 0),
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(16, 0,0,0),
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200],
                backgroundImage: CachedNetworkImageProvider(post.user.imageUrl),
              ),
              title: Text("${post.user.name}",
                style: TextStyle(
                  color: Palette.textActive,
                  fontWeight: FontWeight.w400,
              ),),
              subtitle: Text("${post.timeAgo}",
                style: TextStyle(
                  color: Palette.textPassive,
                ),),
              trailing: IconButton(
                  icon: Icon(MdiIcons.dotsVertical),
                  onPressed: (){}),
            ),
            SizedBox(height: 2,),
            post.imageUrl  != null ? CachedNetworkImage(imageUrl: post.imageUrl) : Container(),
            SizedBox(height: 16,),
            isDesktop ? Divider() :Container() ,
            isDesktop ? SizedBox(height: 16,):Container(),
           Row(
             children: [
               Row(
                 children: [
                   SizedBox(width: 16,),
                   _Interactions(iconData: MdiIcons.heartOutline, number: post.likes,),
                   SizedBox(width: 20,),
                   _Interactions(iconData: MdiIcons.messageOutline, number: post.comments,),
                   SizedBox(width: 20,),
                   _Interactions(iconData: MdiIcons.share, number: post.shares,),
                 ],
               ),
               Expanded(child: Container()),
               _Interactions(iconData: MdiIcons.eye, number: post.views,),
               SizedBox(width: 10,)
             ],
           ),
          ],
        ),
      ),
    );
  }
}

class _Interactions extends StatelessWidget {
   final IconData iconData;
   final int number;

  const _Interactions({@required this.iconData, @required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData, color: Colors.grey,size: 20,),
        SizedBox(width: 2,),
        Text('$number',style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 14
        ),)
      ],
    );
  }
}

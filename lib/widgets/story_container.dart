import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vk_responsive/config/palette.dart';
import 'package:vk_responsive/models/models.dart';
import 'package:vk_responsive/widgets/widgets.dart';


class StoryContainer extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;
  const StoryContainer({@required this.currentUser, @required this.stories});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return ClipContainer(
      widget: Container(
        color: Colors.white,
        height:  isDesktop ? 250 :  120,
        padding: EdgeInsets.symmetric(vertical: isDesktop ? 10 : 0,horizontal: isDesktop ? 16 : 0),
        child: Column(
          children: [
            isDesktop
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text("Stories", style: TextStyle(
                    color: Palette.textActive,
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text("Settings", style: TextStyle(
                    color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),),
                )
              ],
            )
                : Container(),
            SizedBox(height:  isDesktop ? 10 : 0,),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1 + stories.length,
                itemBuilder: (BuildContext context, int index) {

                  if (index == 0) {
                    final Story userStory =  Story(
                        user: currentUser,
                        imageUrl: currentUser.imageUrl,
                        isViewed: true
                    );
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  !isDesktop
                          ? _StoryCard(story: userStory,plus: true)
                          : _StoryDesktopCard(story: userStory, plus: true,),
                    );
                  }
                  final Story story = stories[index - 1];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: !isDesktop
                        ? _StoryCard(story: story)
                        : _StoryDesktopCard(story: story),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _StoryCard extends StatelessWidget {
 final Story story;
 final bool plus;

 const _StoryCard({@required this.story, this.plus =  false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                 border: Border.all(width: 2.2,color: !story.isViewed ? Colors.blueAccent : Colors.transparent),
                  borderRadius: BorderRadius.circular(100),
              ),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                backgroundImage: CachedNetworkImageProvider(story.imageUrl),
              ),
            ),
            plus
                ? Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          border: Border.all(width: 3.0, color: Colors.white),
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          plus ? 'Story' :"${story.user.name.split(' ')[0]}",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Responsive.isDesktop(context) ? Colors.white : plus ? Palette.textPassive : Palette.vkBlue,
              fontWeight: FontWeight.w500,
            fontSize: Responsive.isMobile(context) ? 12 : 16,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}

class _StoryDesktopCard extends StatelessWidget {
  final Story story;
  final bool plus;
  const _StoryDesktopCard({this.story, this.plus= false});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Stack(
        children: [
          Material(
              elevation: 2,
              child: Container(
                height: 250,
                width: 110,
                child: CachedNetworkImage(
                  imageUrl: story.user.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Container(
            height: 250,
            width: 110,
            decoration: BoxDecoration(
              gradient: Palette.storyGradient
            ),
          ),
          Positioned(
            bottom: 8,
              left: 20,
              right: 20,
              child: _StoryCard(story: story, plus: plus,)),
        ],
      ),
    );
  }
}

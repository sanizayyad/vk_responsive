import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vk_responsive/config/palette.dart';
import 'package:vk_responsive/repository/repository.dart';
import 'package:vk_responsive/widgets/widgets.dart';
import 'package:vk_responsive/models/models.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TrackingScrollController _trackingScrollController =  TrackingScrollController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile:
          _HomePageMobile(scrollController: _trackingScrollController),
          desktop:
          _HomePageDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}


class _HomePageMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  _HomePageMobile({this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverSafeArea(
              top: false,
              sliver:  SliverAppBar(
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                title: Text("Home",style: TextStyle(
                  color: Palette.textActive,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),),
                floating: true,
                pinned: true,
                snap: true,
                leading: IconButton(
                  icon: Icon(MdiIcons.cameraOutline),
                  iconSize: 28,
                  color: Palette.vkBlue,
                  onPressed: (){},
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    iconSize: 28,
                    color: Palette.vkBlue,
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(MdiIcons.bellOutline),
                    iconSize: 28,
                    color: Palette.vkBlue,
                    onPressed: (){},
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size(0,36),
                  child: DefaultTabController(
                    length: tabs.length,
                    child: Builder(
                      builder: (BuildContext context){
                        return TabBar(
                            isScrollable: true,
                            labelColor: Palette.textActive,
                            unselectedLabelColor: Palette.textPassive,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            labelPadding: const EdgeInsets.fromLTRB(16,10,16,8),
                            onTap: (index) {

                            },
                            tabs: tabs
                        );
                      },
                    ),
                  ),
                ),
              )),
          SliverToBoxAdapter(
            child: StoryContainer(
              currentUser: currentUser,
              stories: stories,
            ),
          ),
          SliverToBoxAdapter(child: CreatePostContainer()),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
              childCount: posts.length,
            ),
          ),
        ]
    );
  }
}
class _HomePageDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  _HomePageDesktop({this.scrollController});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const Spacer(),
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:12.0),
                // child: MoreOptionsList(currentUser: currentUser),
                child: LeftNavBar()
              ),
            ),
          ),
          Container(
            width: 600.0,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(child: CreatePostContainer()),
                SliverToBoxAdapter(
                  child: StoryContainer(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final Post post = posts[index];
                    return PostContainer(post: post);
                  },
                    childCount: posts.length,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:12.0),
                child: RightNavBar(),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}


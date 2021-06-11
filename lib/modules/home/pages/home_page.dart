import 'package:almarwa/classes/resposive.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../widgets/action_widget.dart';
import '../widgets/head_home_page_widget.dart';
import '../widgets/service_widget.dart';
import '../widgets/gallery_widget.dart';
import '../widgets/about_widget.dart';
import '../widgets/contact_us_widget.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  final scrollDirection = Axis.vertical;
  AutoScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final res = Responsive(context);
    return Scaffold(
      drawerScrimColor: Colors.grey.withOpacity(0.3),
      endDrawer: Drawer(
        child: Container(
          color: Colors.blue[900],
          child: ListView(
            children: [
              ActionWidget(
                'الرئيسية',
                onTap: () async {
                  Navigator.of(context).pop();

                  srollIndex(0);
                },
              ),
              SizedBox(height: 8),
              ActionWidget(
                'عنا',
                onTap: () async {
                  Navigator.of(context).pop();
                  srollIndex(1);
                },
              ),
              SizedBox(height: 8),
              ActionWidget(
                'منتجاتنا',
                onTap: () async {
                  Navigator.of(context).pop();
                  srollIndex(2);
                },
              ),
              SizedBox(height: 8),
              ActionWidget(
                'أعمالنا',
                onTap: () async {
                  Navigator.of(context).pop();
                  srollIndex(3);
                },
              ),
              SizedBox(height: 8),
              Container(
                margin: const EdgeInsets.all(0),
                child: TextButton(
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    backgroundColor:
                        MaterialStateProperty.all(theme.primaryColor),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    srollIndex(4);
                  },
                  child: Text(
                    'تواصل معنا',
                    style: theme.textTheme.headline5.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blue[900],
        iconTheme: IconThemeData(color: theme.primaryColor),
        // backgroundColor: Colors.transparent,
        // foregroundColor: Colors.transparent,
        // title: Image.asset(
        //   'assets/images/logo.jpg',
        //   height: 100,
        //   width: 120,
        // ),
        title: Text('شركة المروة',
            style: theme.textTheme.headline1.copyWith(color: Colors.white)),
        elevation: 0,
        actions: res.size.width > 800
            ? [
                ActionWidget(
                  'الرئيسية',
                  onTap: () async {
                    await controller.scrollToIndex(
                      0,
                      preferPosition: AutoScrollPosition.begin,
                      duration: Duration(seconds: 1),
                    );
                  },
                ),
                SizedBox(height: 8),
                ActionWidget(
                  'عنا',
                  onTap: () async {
                    await controller.scrollToIndex(
                      1,
                      preferPosition: AutoScrollPosition.begin,
                      duration: Duration(seconds: 1),
                    );
                  },
                ),
                SizedBox(height: 8),
                ActionWidget(
                  'خدماتنا',
                  onTap: () async {
                    await controller.scrollToIndex(
                      2,
                      preferPosition: AutoScrollPosition.begin,
                      duration: Duration(seconds: 1),
                    );
                  },
                ),
                SizedBox(height: 8),
                ActionWidget(
                  'منتجاتنا',
                  onTap: () async {
                    await controller.scrollToIndex(
                      3,
                      preferPosition: AutoScrollPosition.begin,
                      duration: Duration(seconds: 2),
                    );
                  },
                ),
                SizedBox(height: 8),
                Container(
                  margin: const EdgeInsets.all(2),
                  child: TextButton(
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(20)),
                      backgroundColor:
                          MaterialStateProperty.all(theme.primaryColor),
                    ),
                    onPressed: () async {
                      await controller.scrollToIndex(
                        4,
                        preferPosition: AutoScrollPosition.begin,
                        duration: Duration(seconds: 1),
                      );
                    },
                    child: Text(
                      'تواصل معنا',
                      style: theme.textTheme.headline5.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]
            : null,
      ),
      body: Container(
        child: Scrollbar(
          isAlwaysShown: true,
          controller: controller,
          child: ListView(
            controller: controller,
            children: [
              AutoScrollTag(
                  key: ValueKey(0),
                  index: 0,
                  controller: controller,
                  child: HeadHomePageWidget(
                    onPressed: () async {
                      await controller.scrollToIndex(
                        1,
                        preferPosition: AutoScrollPosition.begin,
                        duration: Duration(seconds: 1),
                      );
                    },
                  )),
              AutoScrollTag(
                  key: ValueKey(1),
                  index: 1,
                  controller: controller,
                  child: AboutWidget()),
              AutoScrollTag(
                  key: ValueKey(2),
                  index: 2,
                  controller: controller,
                  child: ServicesWidget()),
              AutoScrollTag(
                  key: ValueKey(3),
                  index: 3,
                  controller: controller,
                  child: GalleryWidget()),
              AutoScrollTag(
                  key: ValueKey(4),
                  index: 4,
                  controller: controller,
                  child: ContactUsWidget())
            ],
          ),
        ),
      ),
    );
  }

  void srollIndex(int index) async {
    await controller.scrollToIndex(
      index,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

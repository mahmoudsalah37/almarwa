import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../classes/resposive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeadHomePageWidget extends StatelessWidget {
  const HeadHomePageWidget({this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final res = Responsive(context);

    return Stack(
      key: key,
      children: [
        Container(
          height: res.getHeight(100),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment(-0.7, 0),
              fit: BoxFit.fill,
              image: AssetImage('assets/images/background.jpg'),
            ),
          ),
        ),
        AnimationConfiguration.staggeredList(
            position: 0,
            delay: Duration(milliseconds: 300),
            duration: const Duration(seconds: 2),
            child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: res.getHeight(65),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment(-0.7, 0),
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/watertank.png'),
                      ),
                    ),
                  ),
                )))),
        Positioned(
            right: res.getWidth(10),
            top: res.getHeight(res.size.width > 800 ? 15 : 60),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'شركة المروة\nلجميع أنواع الخزانات',
                  style: theme.textTheme.headline1.copyWith(
                    fontSize: res.size.width > 800 ? 70 : 40,
                    color: Colors.white,
                    // shadows: [
                    //   BoxShadow(
                    //       color: Colors.grey, spreadRadius: 1, blurRadius: 2)
                    // ],
                  ),
                ),
                Container(
                  width: res.getWidth(res.size.width > 800 ? 35 : 80),
                  child: Text(
                    "شركتنا تعمل علي مدار 24 ساعة لأنتاج أفضل الخزانات بأحدث أدوات التصنيع .",
                    style: theme.textTheme.bodyText2.copyWith(
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                            color: Colors.grey, spreadRadius: 1, blurRadius: 1)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    )),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      theme.primaryColor,
                    ),
                  ),
                  onPressed: onPressed,
                  icon: SvgPicture.asset(
                    'assets/images/boat.svg',
                    height: 25,
                    width: 25,
                    color: Colors.white,
                  ),
                  label: Text(
                    'اعرف المزيد',
                    style:
                        theme.textTheme.bodyText2.copyWith(color: Colors.white),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

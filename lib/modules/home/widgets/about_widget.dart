import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../classes/resposive.dart';

class AboutWidget extends StatefulWidget {
  AboutWidget();

  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  static final _controller = YoutubePlayerController(
    initialVideoId: 'pN7c98czZ6Y',
    params: const YoutubePlayerParams(
      playlist: ['pN7c98czZ6Y'],
      showControls: true,
      desktopMode: true,
      privacyEnhanced: true,
      useHybridComposition: true,
    ),
  )
    ..onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    }
    ..onExitFullscreen = () {
      log('Exited Fullscreen');
    };
  final player = YoutubePlayerIFrame(
    controller: _controller,
  );
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final res = Responsive(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      color: Colors.grey[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            direction: Axis.horizontal,
            children: [
              Container(
                constraints: BoxConstraints(
                    minWidth: 300,
                    minHeight: 300,
                    maxWidth: 600,
                    maxHeight: 600),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: player,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'عنا',
                      style: theme.textTheme.headline1
                          .copyWith(color: theme.accentColor),
                    ),
                    Container(
                      width: res.getWidth(
                          MediaQuery.of(context).size.width > 500 ? 35 : 80),
                      child: Text(
                        "شركة المروة لصناعة أفضل الخزانات التي يتم تصديرها داخل وخارج مصر بأفضل المعايير الصناعية التي تتفقع مع معايير الصحة العالمية ومعايير الأنتاج الصناعي نملك علامة تجارية عالمية\nبرقم 0320825 ولدينا علامة معتمدة للتوريد بالمشروعات القومية التي تقوم الهيئة بتنفيذها وماذلنا نهدف للمزيد والمزيد من أجل منتجات عالية الجودة.",
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.headline6
                            .copyWith(color: Colors.black.withOpacity(0.9)),
                        maxLines: 18,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

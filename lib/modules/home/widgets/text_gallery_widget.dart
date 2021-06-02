import 'package:flutter/material.dart';
import 'package:platform_detect/platform_detect.dart';

class TextGalleryWidget extends StatefulWidget {
  const TextGalleryWidget({@required this.title, @required this.subTitle});
  final String title, subTitle;
  @override
  _TextGalleryWidgetState createState() => _TextGalleryWidgetState();
}

class _TextGalleryWidgetState extends State<TextGalleryWidget> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: MouseRegion(
        onExit: (e) {
          setState(() {
            isHover = false;
          });
        },
        onEnter: (e) {
          setState(() {
            isHover = true;
          });
        },
        child: AnimatedOpacity(
          opacity: operatingSystem.isWindows ? (isHover ? 1 : 0) : 1,
          duration: Duration(milliseconds: 700),
          child: Stack(
            children: [
              Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title ?? '',
                      style: theme.textTheme.headline4.copyWith(
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 1,
                            spreadRadius: 1.5,
                          )
                        ],
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.subTitle ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyText2.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        shadows: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 1,
                            spreadRadius: 1.5,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

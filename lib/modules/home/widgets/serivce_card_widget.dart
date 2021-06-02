import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceCradWidget extends StatefulWidget {
  const ServiceCradWidget(
      {@required this.image, @required this.title, @required this.description});
  final String image, title, description;

  @override
  _ServiceCradWidgetState createState() => _ServiceCradWidgetState();
}

class _ServiceCradWidgetState extends State<ServiceCradWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        onHover: (v) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (v) {
          setState(() {
            isHover = false;
          });
        },
        child: Card(
          color: isHover ? Colors.blue[50] : Colors.white,
          elevation: isHover ? 9 : 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: 280,
            height: 300,
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  widget.image,
                  width: 100,
                  height: 100,
                ),
                Text(
                  widget.title ?? '',
                  style: theme.textTheme.headline2
                      .copyWith(color: theme.accentColor),
                ),
                Text(
                  widget.description ?? '',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                  style: theme.textTheme.bodyText2.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

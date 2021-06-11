import 'package:flutter/material.dart';

class ActionWidget extends StatefulWidget {
  ActionWidget(this.name, {@required this.onTap});
  final String name;
  final void Function() onTap;
  @override
  _ActionWidgetState createState() => _ActionWidgetState();
}

class _ActionWidgetState extends State<ActionWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return MouseRegion(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
        child: Center(
          child: TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: widget.onTap,
            child: Text(
              widget.name ?? '',
              textAlign: TextAlign.center,
              style: theme.headline6.copyWith(
                fontWeight: isHover ? FontWeight.w300 : FontWeight.w200,
                fontSize: isHover ? 19 : 18,
                color: Colors.white,
                decoration:
                    isHover ? TextDecoration.underline : TextDecoration.none,
                decorationThickness: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

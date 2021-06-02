import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      key: key,
      color: Colors.blue[600],
      constraints: BoxConstraints(minHeight: 400),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'حقوق الطبع والنشر © 2021 جميع الحقوق محفوظة لصالح شركةالمروة',
                  style:
                      theme.textTheme.bodyText2.copyWith(color: Colors.black),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ContactWidget(
                  title: 'العنوان:',
                  text: '34 Street Name, City Name Here, United States',
                ),
                ContactWidget(
                  title: 'الهاتف:',
                  text: '+20 1556460005',
                ),
                ContactWidget(
                  title: 'الإيميل:',
                  text: 'mahmoudsalah37@gmail.com',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'قم بزيارتنا علي مواقع التواصل الإجتماعي',
                  style:
                      theme.textTheme.bodyText2.copyWith(color: Colors.black),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SocailIconWidget(
                      icon: 'assets/images/facebook.svg',
                    ),
                    SocailIconWidget(
                      icon: 'assets/images/instagram.svg',
                    ),
                    SocailIconWidget(
                      icon: 'assets/images/linkedin.svg',
                    ),
                    SocailIconWidget(
                      icon: 'assets/images/whatsapp.svg',
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SocailIconWidget extends StatefulWidget {
  const SocailIconWidget({@required this.icon, this.colorIcon});
  final String icon;
  final Color colorIcon;

  @override
  _SocailIconWidgetState createState() => _SocailIconWidgetState();
}

class _SocailIconWidgetState extends State<SocailIconWidget>
    with TickerProviderStateMixin {
  AnimationController rotationController;
  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          rotationController.reset();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
      child: MouseRegion(
        onEnter: (e) {
          rotationController.forward();
        },
        onExit: (e) {},
        child: Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white),
          ),
          child: SvgPicture.asset(
            widget.icon,
            width: 20,
            height: 20,
            color: widget.colorIcon,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({this.title, this.text});
  final String title, text;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title ?? '',
          style: theme.textTheme.bodyText2.copyWith(color: Colors.black),
        ),
        SizedBox(height: 2),
        Text(
          text ?? '',
          style: theme.textTheme.bodyText1
              .copyWith(color: Colors.white, fontWeight: FontWeight.w200),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}

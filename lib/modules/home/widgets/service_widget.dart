import '../models/setvice_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'serivce_card_widget.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      key: key,
      // color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'خدماتنا المقدمة',
            style: theme.textTheme.headline1.copyWith(color: theme.accentColor),
          ),
          SizedBox(height: 4),
          Text(
            'نقدم لك أفضل الخدمات',
            style: theme.textTheme.bodyText2.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 20),
          Container(
            child: AnimationLimiter(
              child: Wrap(
                children: <ServiceModel>[
                  ServiceModel(
                    id: 1,
                    iamge: 'assets/images/high-quality.svg',
                    title: 'الجودة',
                    description: "لدينا أفضل الخزانات بأعلي جودة",
                  ),
                  ServiceModel(
                    id: 1,
                    iamge: 'assets/images/care.svg',
                    title: 'الصحة',
                    description:
                        "يتم تصنيع و تعقيم الخزانات بمواد ذات جودة عالمية",
                  ),
                  ServiceModel(
                    id: 1,
                    iamge: 'assets/images/money.svg',
                    title: 'أفضل الأسعار',
                    description:
                        "نمتلك الجودة والسعر المناسب الذي لا يمكن منافستة",
                  ),
                ]
                    .map(
                      (e) => AnimationConfiguration.staggeredList(
                        position: e.id,
                        delay: Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 600),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: ServiceCradWidget(
                              image: e.iamge,
                              title: e.title,
                              description: e.description,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

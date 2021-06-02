import 'package:almarwa/models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'text_gallery_widget.dart';
import '../../../extensions/list_extension.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      key: key,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(
              'منتجاتنا',
              style:
                  theme.textTheme.headline1.copyWith(color: theme.accentColor),
            ),
            SizedBox(height: 4),
            Text(
              'لدينا جميع مختلف الأحجام والمقاسات التي تناسب طلبك',
              style: theme.textTheme.bodyText2.copyWith(color: Colors.grey),
            ),
            SizedBox(height: 20),
            AnimationLimiter(
              child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <ProjectModel>[
                    ProjectModel(
                        image: 'assets/images/future_city.jpg',
                        title: '6 عمارات مدينة المستقبل',
                        subTitle: 'مدينة المصتقبل - الهايكستب'),
                    ProjectModel(
                        image: 'assets/images/buidling2.jpg',
                        title: 'مشروع 8 شقق النصر',
                        subTitle: 'مدينة نصر - شارع مصطفي النحاس'),
                    ProjectModel(
                        image: 'assets/images/building.jpg',
                        title: 'مشروغ عمارة طه حسن',
                        subTitle: 'شارغ طه حسين - مدينة النزهة'),
                    ProjectModel(
                        image: 'assets/images/building3.jpg',
                        title: 'مشروع 14 شفة السويس',
                        subTitle: 'جسر السويس - شارع جمال عبد الناصر'),
                    ProjectModel(
                        image: 'assets/images/vella.jpg',
                        title: 'مشروع فيلا الزيتون',
                        subTitle: 'مساكن حلمية الزيتون'),
                    ProjectModel(
                        image: 'assets/images/cafe.jpg',
                        title: 'مشروع جدو كافية',
                        subTitle: 'مساكن شيرتون - شارع البحر'),
                  ]
                      .mapIndexed((projectModel, index) => ProjectWidget(
                            index: index,
                            projectModel: projectModel,
                          ))
                      .toList(growable: false)),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({@required this.index, @required this.projectModel});
  final int index;
  final ProjectModel projectModel;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: index,
      duration: const Duration(milliseconds: 775),
      columnCount: 4,
      child: ScaleAnimation(
        child: FadeInAnimation(
          child: Container(
            height: 300,
            width: 270,
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(projectModel.image),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: TextGalleryWidget(
                title: projectModel.title,
                subTitle: projectModel.subTitle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

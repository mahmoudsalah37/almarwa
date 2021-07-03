import 'package:almarwa/models/project_model.dart';
import 'package:flutter/material.dart';

import 'text_gallery_widget.dart';
import '../../../extensions/list_extension.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
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
            Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <ProjectModel>[
                  ProjectModel(
                      image: 'assets/images/p1.jpg', title: '', subTitle: ''),
                  ProjectModel(
                      image: 'assets/images/p7.jpg', title: '', subTitle: ''),
                  ProjectModel(
                      image: 'assets/images/p8.jpg', title: '', subTitle: ''),
                  ProjectModel(
                      image: 'assets/images/p4.jpg', title: '', subTitle: ''),
                  ProjectModel(
                      image: 'assets/images/p5.jpg', title: '', subTitle: ''),
                  ProjectModel(
                      image: 'assets/images/p6.jpg', title: '', subTitle: ''),
                ]
                    .mapIndexed((projectModel, index) => ProjectWidget(
                          index: index,
                          projectModel: projectModel,
                        ))
                    .toList(growable: false)),
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
    return Container(
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
    );
  }
}

import 'package:flutter/material.dart';

import '../../../classes/resposive.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final res = Responsive(context);
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      color: Colors.grey[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'عنا',
            style: theme.textTheme.headline1.copyWith(color: theme.accentColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                direction: Axis.horizontal,
                children: [
                  Container(
                    constraints: BoxConstraints(minWidth: 300),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.asset(
                      'assets/images/about.gif',
                      width: res.getWidth(30),
                    ),
                  ),
                  Container(
                    width: res.getWidth(
                        MediaQuery.of(context).size.width > 500 ? 35 : 80),
                    child: Text(
                      "شركة المروة لصناعة أفضل الخزانات التي يتم تصديرها داخل وخارج مصر بأفضل المعايير الصناعية التي تتفقع مع معايير الصحة العالمية ومعايير الأنتاج الصناعي نملك علامة تجارية عالمية برقم 0320825 ولدينا علامة معتمدة للتوريد بالمشروعات القومية التي تقوم الهيئة بتنفيذها وماذلنا نهدف للمزيد والمزيد من أجل منتجات عالية الجودة.",
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headline6
                          .copyWith(color: Colors.black.withOpacity(0.9)),
                      maxLines: 18,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

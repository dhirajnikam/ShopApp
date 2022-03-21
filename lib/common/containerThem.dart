import 'package:flutter/material.dart';

import 'package:shop1/common/textThem.dart';

class ContainerThem1 extends StatelessWidget {
  Color color;
  String tag;
  String title;
  String img;
  ContainerThem1({
    Key? key,
    required this.color,
    required this.tag,
    this.title = '',
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey.shade50, blurRadius: 10),
      ], color: color, borderRadius: BorderRadius.circular(20)),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: color,
                    border: Border.all(width: 5, color: Colors.white),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(Icons.favorite),
              ),
            ),
            Container(
                height: 120,
                width: 120,
                child: Hero(tag: tag, child: Image(image: NetworkImage(img)))),
            SizedBox(
              height: 50,
            ),
            TextTheme1(text: title),
          ],
        ),
      ),
    );
  }
}

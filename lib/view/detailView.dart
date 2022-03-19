import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop1/common/textThem.dart';
import 'package:shop1/controller/listController/listController.dart';

class DetailView extends StatelessWidget {
  int Pindex;
  DetailView({
    Key? key,
    required this.Pindex,
  }) : super(key: key);
  final product = Get.put(ListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_frontBody(), _backBody()],
      ),
    );
  }

  _frontBody() {
    return Container(
      color: product.ductList[Pindex].color,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: _back()),
                  _share()
                ],
              ),
              Container(
                  height: Get.height * 0.25, width: Get.width, child: _img()),
            ],
          ),
        ),
      ),
    );
  }

  _back() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white)),
      child: Icon(
        Icons.arrow_back_ios_new,
      ),
    );
  }

  _share() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: product.ductList[Pindex].color,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white, width: 5)),
      child: Center(child: Icon(Icons.share)),
    );
  }

  _img() {
    return Hero(
        tag: "DemoTag${Pindex}",
        child: Image(image: AssetImage(product.ductList[Pindex].img)));
  }

  _backBody() {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.4,
        ),
        Container(
          height: Get.height * 0.6,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                _title(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextTheme2(
                          text: "Color ",
                        ),
                        _colorT()
                      ],
                    )
                  ],
                ),
                Container(height: Get.height * 0.4, child: _desc()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [_fav(), _buy()],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _title() {
    return TextTheme1(
      text: product.ductList[Pindex].title,
    );
  }

  _colorT() {
    return CircleAvatar(backgroundColor: product.ductList[Pindex].color);
  }

  _desc() {
    return TextTheme2(
      text: product.ductList[Pindex].desc,
    );
  }

  _fav() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: product.ductList[Pindex].color,
          border: Border.all(color: Colors.grey)),
      child: Icon(Icons.favorite),
    );
  }

  _buy() {
    return Container(
      height: 60,
      width: Get.width * 0.65,
      decoration: BoxDecoration(
          color: product.ductList[Pindex].color,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextTheme1(
            text: "Buy the Items",
          ),
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Icon(Icons.shopping_cart))
        ],
      ),
    );
  }
}

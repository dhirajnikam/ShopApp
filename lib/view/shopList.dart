import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop1/common/textThem.dart';
import 'package:shop1/controller/listController/listController.dart';
import 'package:shop1/view/detailView.dart';

class ShopList extends StatelessWidget {
  ShopList({Key? key}) : super(key: key);
  final product = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: Get.height * 0.03,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_welcomeText(), _proImg()],
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1 / 1.5,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _grid(index);
              },
              childCount: product.count,
            ),
          ),
        ],
      ),
    );
  }

  _welcomeText() {
    return Container(
        width: Get.width * 0.5,
        child: TextTheme1(
          text: "Welcome Dhiraj Nikam Let's get you started",
        ));
  }

  _proImg() {
    return CircleAvatar(
      minRadius: 30,
      backgroundImage: AssetImage("assets/pro/pic.webp"),
    );
  }

  _grid(int index) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Get.to(DetailView(
            Pindex: index,
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey.shade50, blurRadius: 10),
              ],
              color: product.ductList[index].color,
              borderRadius: BorderRadius.circular(20)),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(alignment: Alignment.topRight, child: _fav(index)),
                Container(height: 120, width: 120, child: _img(index)),
                SizedBox(
                  height: 50,
                ),
                _title(index)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _fav(int index) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: product.ductList[index].color,
          border: Border.all(width: 5, color: Colors.white),
          borderRadius: BorderRadius.circular(30)),
      child: Icon(Icons.favorite),
    );
  }

  _img(int index) {
    return Hero(
        tag: "DemoTag${index}",
        child: Image(image: AssetImage(product.ductList[index].img)));
  }

  _title(int index) {
    return TextTheme1(text: product.ductList[index].title);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop1/common/containerThem.dart';
import 'package:shop1/common/textThem.dart';
import 'package:shop1/controller/listController/listController.dart';
import 'package:shop1/view/detailView.dart';

class ShopList extends StatelessWidget {
  ShopList({Key? key}) : super(key: key);
  final product = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (product.listProduct.isEmpty) {
        return Center(child: CircularProgressIndicator(),);
      } else if (product.listProduct.length == 0) {
        return Text('Empty List');
      } else {
        return _body();
      }
    }));
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
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                      onTap: () {
                        Get.to(DetailView(
                          Pindex: index,
                        ));
                      },
                      child: ContainerThem1 (
                        color: HexColor(product.listProduct[index].color),
                        tag: "DemoTag${index}",
                        img: product.listProduct[index].img,
                        
                        title: product.listProduct[index].title,
                      )),
                );
              },
              childCount: product.listProduct.length,
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
}

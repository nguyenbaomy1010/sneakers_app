import 'package:sneakers_app/ShoppingApp/controller/homePageController.dart';
import 'package:sneakers_app/ShoppingApp/models/ItemModel.dart';
import 'package:sneakers_app/ShoppingApp/widgets/CustomButton.dart';
import 'package:sneakers_app/ShoppingApp/widgets/DotWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailPage extends StatefulWidget {
  final int itemId;

  ItemDetailPage({required this.itemId});

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  late PageController pageController;
  int active = 0;
  String image =
      "https://th.bing.com/th/id/R.4de0f89beeafe4f0b67c767b36f1adf9?rik=Wgnp5ljFhokg%2fQ&pid=ImgRaw&r=0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  Widget buildDot(int index, int num) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
            color: (num == index) ? Colors.black38 : Colors.grey[200],
            shape: BoxShape.circle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find<HomePageController>();
    ShopItemModel model = controller.getItem(widget.itemId);
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("Chi tiết sản phẩm"),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
        ),
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 280.0,
                  padding: EdgeInsets.only(top: 10.0),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        child: PageView(
                          controller: pageController,
                          onPageChanged: (index) {
                            print(index);
                            setState(() {
                              active = index;
                            });
                          },
                          children: <Widget>[
                            Image.network(
                              model.image,
                              height: 150.0,
                            ),
                            Image.network(
                              model.image,
                              height: 150.0,
                            ),
                            Image.network(
                              model.image,
                              height: 150.0,
                            ),
                            Image.network(
                              model.image,
                              height: 150.0,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          DotWidget(
                            activeIndex: active,
                            dotIndex: 0,
                          ),
                          DotWidget(
                            activeIndex: active,
                            dotIndex: 1,
                          ),
                          DotWidget(
                            activeIndex: active,
                            dotIndex: 2,
                          ),
                          DotWidget(
                            activeIndex: active,
                            dotIndex: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GetBuilder<HomePageController>(builder: (value) {
                  return Container(
                      height: 270.0,
                      alignment: Alignment(1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Column(
                          verticalDirection: VerticalDirection.down,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                controller.setToFav(model.id, !model.fav);
                                var msg = "";
                                if (model.fav) {
                                  msg = "${model.name} đã được đánh dấu vào danh sách yêu thích";
                                } else {
                                  msg = "đã xoá ${model.name} khỏi danh sách yêu thích";
                                }
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text(msg)));
                              },
                              child: model.fav
                                  ? Icon(
                                      Icons.favorite,
                                      size: 20.0,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      size: 20.0,
                                    ),
                            )
                          ],
                        ),
                      ));
                })
              ],
            ),
            Divider(
              color: Colors.grey[300],
              height: 1.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.name,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 19.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                        "Sản phẩm chính hãng 100% .Được làm từ các vật liệu chất lượng cao và có thiết kế và chế tạo tỉ mỉ. Shop xin đảm bảo chất lượng và uy tín của sản phẩm. Có thể 1 đổi 1 trong vòng 7 ngày nếu có lỗi từ nhà sản xuất" ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 18.0),
          height: 60.0,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(color: Colors.grey.shade300, width: 1.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      child: Text(
                        "Giá",
                        style: TextStyle(fontSize: 20.0, color: Colors.grey),
                      ),
                    ),
                    Text("\$${model.price.toString()}",
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              GetBuilder<HomePageController>(builder: (_) {
                bool isAdded = controller.isAlreadyInCart(model.id);
                if (isAdded) {
                  return CustomButton(
                    name: "Xóa khỏi giỏ hàng",
                    onTap: () async {
                      try {
                        controller.removeFromCart(model.id);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Xóa thành công")));
                      } catch (e) {
                        print(e);
                      }
                    },
                  );
                }
                return CustomButton(
                  name: "Thêm vào giỏ hàng",
                  onTap: controller.isLoading ? null : ()  async {
                    try {
                      var result = await controller.addToCart(model);
                      controller.getCardList();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Thêm sản phẩm vào giỏ hàng thành công")));
                    } catch (e) {
                      print(e);
                    }
                  },
                );
              })
            ],
          )),
    );
  }
}

import 'package:flutter/cupertino.dart';

var data = [
  {
    "name": "Nike Air Force 1 Premium",
    "price": 2.680,
    "fav": false,
    "rating": 4.5,
    "image":
    "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/734229e4-3a86-4194-b142-38bd0015209b/air-force-1-shoes-pK50VL.png"
  },
  {
    "name": "Bitis Hunter X - X-NITE 22 Collection DSMH10500 ",
    "price": 200.0,
    "fav": false,
    "rating": 4.5,
    "image":
    "https://product.hstatic.net/1000230642/product/nam-hunter-x-x-nite-22-collection-dsmh10500trg-trang-hzku2-color-trang_514722ce95f14721b3c5089820da3971.jpg"
  },
  {
    "name": "PUMA x LAMELO BALL MB.02 Gorangé Men's Basketball Shoes",
    "price": 2.299,
    "fav": false,
    "rating": 4.5,
    "image":
    "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_1200,h_1200/global/378288/02/sv01/fnd/PNA/fmt/png/PUMA-x-LAMELO-BALL-MB.02-Gorang%C3%A9-Men's-Basketball-Shoes"
  },
  {
    "name": "Running Shoe Brooks Highly",
    "price": 3001.0,
    "fav": false,
    "rating": 3.5,
    "image":
    "https://cdn.pixabay.com/photo/2014/06/18/18/42/running-shoe-371625_960_720.jpg"
  },
  {
    "name": "Ugly Shoe Trends 2018",
    "price": 3.325,
    "fav": false,
    "rating": 4.5,
    "image":
    "https://pixel.nymag.com/imgs/fashion/daily/2018/04/18/uglee-shoes/70-fila-disruptor.w710.h473.2x.jpg"
  },
  {
    "name": "Nordstrom",
    "price": 214.0,
    "fav": false,
    "rating": 4.0,
    "image":
    "https://th.bing.com/th/id/R.4584654e450764c9a6db536e5d4639ea?rik=ieg7IRRDK1uyzA&pid=ImgRaw&r=0"
  },
  {
    "name": "Adidas Ultraboots Light Running Shoes",
    "price": 205.0,
    "fav": false,
    "rating": 4.0,
    "image":
    "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/cfdca7c486e8482aa178aed10135f8e7_9366/Lite_Racer_Adapt_5.0_Shoes_Black_HR1800_01_standard.jpg"
  },
  {
    "name": "Shoefly black",
    "price": 200.0,
    "fav": false,
    "rating": 4.9,
    "image":
    "https://rukminim1.flixcart.com/image/612/612/j95y4cw0/shoe/d/p/8/sho-black-303-9-shoefly-black-original-imaechtbjzqbhygf.jpeg?q=70"
  }
];

class ShopItemModel {
  String name;
  double price;
  bool fav;
  double rating;
  String image;
  int id;
  int? shopId;

  ShopItemModel(
      {this.shopId,
        required this.id,
        required this.fav,
        required this.rating,
        required this.price,
        required this.image,
        required this.name});

  factory ShopItemModel.fromJson(Map<String, dynamic> json) {
    return ShopItemModel(
      id: json['id'],
      fav: json['fav'] == 1,
      rating: json['rating'],
      price: json['price'],
      image: json['image'],
      name: json['name'],
      shopId: json['shop_id'] ?? 0,
    );
  }
}

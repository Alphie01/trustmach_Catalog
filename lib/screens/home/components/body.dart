import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );*/
    return SafeArea(
      child: Stack(children: [
        ListView(
          padding: EdgeInsets.only(top: AppBar().preferredSize.height),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(margin: EdgeInsets.only(bottom: 15, left: 20),child: Text('Trustmach \nProducts',textAlign: TextAlign.start, style: TextStyle(fontSize: 24),), ),
                      ListView.builder(
                          itemCount: demoProducts.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (index % 2 == 0) {
                              return ProductCard(product: demoProducts[index], rightMargin: 10,);
                            } else {
                              return SizedBox();
                            }
                          })
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListView.builder(
                          itemCount: demoProducts.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (index % 2 == 1) {
                              return ProductCard(product: demoProducts[index], leftMargin: 10,);
                            } else {
                              return SizedBox();
                            }
                          })
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        HomeHeader(),
      ]),
    );
  }
}

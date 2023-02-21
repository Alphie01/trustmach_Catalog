import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String choice = '';
  List changableSelected = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 150),
          children: [
            ProductImages(product: widget.product),
            TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  ProductDescription(
                    product: widget.product,
                    pressOnSeeMore: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: widget.product.changebale.isNotEmpty
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  // context and builder are
                                  // required properties in this widget
                                  context: context,
                                  builder: (BuildContext context) {
                                    // we set up a container inside which
                                    // we create center column and display text

                                    // Returning SizedBox instead of a Container
                                    return Container(
                                      height: 200,
                                      margin: EdgeInsets.all(25),
                                      child: ListView.builder(
                                        itemCount:
                                            widget.product.changebale.length,
                                        itemBuilder: (context, index) {
                                          List choices = widget.product
                                              .changebale[index]['contents'];
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Select the ${widget.product.changebale[index]['name']} option:',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Container(
                                                height: 50,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: choices.length,
                                                    itemBuilder: (ctx, ind) {
                                                      return choiceButton(
                                                          changableSelections:
                                                              changableSelected,
                                                          onClickMethod: () {
                                                            bool boool = false;
                                                            int denemes = -1;
                                                            for (var i = 0;
                                                                i <
                                                                    changableSelected
                                                                        .length;
                                                                i++) {
                                                              if (changableSelected[
                                                                          i]
                                                                      ['id'] ==
                                                                  index) {
                                                                setState(() {
                                                                  boool = true;
                                                                  denemes = i;
                                                                });
                                                              }
                                                            }
                                                            setState(() {
                                                              if (boool) {
                                                                setState(() {
                                                                  changableSelected[
                                                                          denemes]
                                                                      [
                                                                      'selection'] = choices[
                                                                          ind]
                                                                      ['name'];
                                                                });
                                                              } else {
                                                                changableSelected
                                                                    .add({
                                                                  'id': index,
                                                                  'selection':
                                                                      choices[ind]
                                                                          [
                                                                          'name']
                                                                });
                                                              }
                                                              print(
                                                                  changableSelected);
                                                              choice = choice +
                                                                  choices[ind]
                                                                      ['name'] +
                                                                  ',';
                                                            });
                                                          },
                                                          choices: choices[ind]
                                                              ['name']);
                                                    }),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    choice == '' ? 'Select' : '${choice}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: FaIcon(FontAwesomeIcons.arrowUp))
                                ],
                              ),
                            ),
                            choice == ''
                                ? SizedBox()
                                : Row(
                                    children: [
                                      RoundedIconBtn(
                                        icon: Icons.remove,
                                        press: () {
                                          if (count > 0) {
                                            setState(() {
                                              count--;
                                            });
                                          }
                                        },
                                      ),
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(10)),
                                      Text(
                                        count.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(10)),
                                      RoundedIconBtn(
                                        icon: Icons.add,
                                        showShadow: true,
                                        press: () {
                                          setState(() {
                                            count++;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  // context and builder are
                                  // required properties in this widget
                                  context: context,
                                  builder: (BuildContext context) {
                                    // we set up a container inside which
                                    // we create center column and display text

                                    // Returning SizedBox instead of a Container
                                    return Container(
                                      height: 200,
                                      margin: EdgeInsets.all(25),
                                      child: ListView.builder(
                                        itemCount:
                                            widget.product.changebale.length,
                                        itemBuilder: (context, index) {
                                          List choices = widget.product
                                              .changebale[index]['contents'];
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Select the ${widget.product.changebale[index]['name']} option:',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Container(
                                                height: 50,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: choices.length,
                                                    itemBuilder: (ctx, ind) {
                                                      return choiceButton(
                                                          changableSelections:
                                                              changableSelected,
                                                          onClickMethod: () {
                                                            bool boool = false;
                                                            int denemes = -1;
                                                            for (var i = 0;
                                                                i <
                                                                    changableSelected
                                                                        .length;
                                                                i++) {
                                                              if (changableSelected[
                                                                          i]
                                                                      ['id'] ==
                                                                  index) {
                                                                setState(() {
                                                                  boool = true;
                                                                  denemes = i;
                                                                });
                                                              }
                                                            }
                                                            setState(() {
                                                              if (boool) {
                                                                setState(() {
                                                                  changableSelected[
                                                                          denemes]
                                                                      [
                                                                      'selection'] = choices[
                                                                          ind]
                                                                      ['name'];
                                                                });
                                                              } else {
                                                                changableSelected
                                                                    .add({
                                                                  'id': index,
                                                                  'selection':
                                                                      choices[ind]
                                                                          [
                                                                          'name']
                                                                });
                                                              }
                                                              print(
                                                                  changableSelected);
                                                              choice = choice +
                                                                  choices[ind]
                                                                      ['name'] +
                                                                  ',';
                                                            });
                                                          },
                                                          choices: choices[ind]
                                                              ['name']);
                                                    }),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [],
                              ),
                            ),
                            Row(
                              children: [
                                RoundedIconBtn(
                                  icon: Icons.remove,
                                  press: () {
                                    if (count > 0) {
                                      setState(() {
                                        count--;
                                      });
                                    }
                                  },
                                ),
                                SizedBox(
                                    width: getProportionateScreenWidth(10)),
                                Text(
                                  count.toString(),
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                SizedBox(
                                    width: getProportionateScreenWidth(10)),
                                RoundedIconBtn(
                                  icon: Icons.add,
                                  showShadow: true,
                                  press: () {
                                    setState(() {
                                      count++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                ),
                count > 0
                    ? Container(
                        margin: EdgeInsets.only(
                            top: 15, bottom: 5, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.cartPlus,
                                      color: Colors.white,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        demoCarts.add(Cart(
                                            product: widget.product,
                                            numOfItem: count,
                                            changableSelection:
                                                changableSelected));
                                        Navigator.pushNamed(
                                            context, CartScreen.routeName);
                                      },
                                      child: Container(
                                          child: Text(
                                        'Add to Cart',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child:
                                    Text('\$ ${count * widget.product.price}'),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class choiceButton extends StatefulWidget {
  const choiceButton(
      {Key? key,
      required this.choices,
      this.onClickMethod,
      required this.changableSelections})
      : super(key: key);
  final List changableSelections;
  final String choices;
  final Function? onClickMethod;

  @override
  State<choiceButton> createState() => _choiceButtonState();
}

class _choiceButtonState extends State<choiceButton> {
  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var map in widget.changableSelections) {
      if (map['selection'] == widget.choices) {
        setState(() {
          selected = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClickMethod!();
        setState(() {
          selected = true;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(15),
        width: 75,
        alignment: Alignment.center,
        decoration: selected
            ? BoxDecoration(border: Border.all(), color: Colors.black)
            : BoxDecoration(
                border: Border.all(),
              ),
        child: Text(
          widget.choices,
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

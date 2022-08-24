import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_by_codex/controller/cart_controller.dart';
import 'package:getx_by_codex/controller/shoping_controller.dart';

class Homepage extends StatelessWidget {
  final shoppingcontroller = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GetX<ShoppingController>(builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${controller.products[index].productname}",
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          "${controller.products[index].productDescription}"),
                                    ],
                                  ),
                                  Text("\$${controller.products[index].price}"),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: const Text("Add to Cart"),
                              ),
                              Obx(
                                (() => IconButton(
                                      onPressed: () {
                                        controller.products[index].isFavorite
                                            .toggle();
                                      },
                                      icon: controller
                                              .products[index].isFavorite.value
                                          ? Icon(Icons.check_box_rounded)
                                          : Icon(Icons
                                              .check_box_outline_blank_outlined),
                                    )),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                }),
              ),
              GetX<CartController>(builder: (controller) {
                return Text(
                  "Total amount:${controller.totalPrice}",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                );
              }),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: GetX<CartController>(builder: (controller) {
            return Text("${controller.count.toString()}");
          }),
          icon: Icon(Icons.add_shopping_cart_outlined),
          backgroundColor: Colors.amber,
        ));
  }
}

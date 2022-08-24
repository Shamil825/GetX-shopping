import 'package:get/get.dart';
import 'package:getx_by_codex/model/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productresult = [
      Product(
        id: 1,
        productname: "firstprod",
        productImage: "abcd",
        productDescription: "some description",
        price: 30,
      ),
      Product(
        id: 2,
        productname: "secondprod",
        productImage: "abcd",
        productDescription: "some description",
        price: 40,
      ),
      Product(
        id: 3,
        productname: "thirdprod",
        productImage: "abcd",
        productDescription: "some description",
        price: 50,
      )
    ];
    products.value=productresult;
  }
}

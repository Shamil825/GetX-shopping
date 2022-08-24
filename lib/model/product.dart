import 'package:get/get.dart';

class Product {
  final int id;
  final String productname;
  final String productImage;
  final String productDescription;
  final double price;

  Product({
   required this.id,
  required  this.productname,
  required  this.productImage,
   required this.productDescription,
  required  this.price, 
   } );

   final isFavorite=false.obs;
}

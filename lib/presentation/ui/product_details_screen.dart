import 'package:flutter/material.dart';
import 'package:save_cost/domain/model/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  Product myProduct;
   ProductDetailsScreen(this.myProduct,{Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.myProduct.name!),
      ),
    );
  }
}

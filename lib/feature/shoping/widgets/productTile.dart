import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  String image;
  String productName;
  String productDescription;
  String productPrice;
  bool? inCart;
  Function? addToCart;

  ProductTile(
      {super.key,
      required this.image,
      required this.productName,
      required this.productDescription,
      required this.productPrice,
       this.addToCart,
      this.inCart});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.purple.shade100,
        height: size.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: size.height * 0.2,
                width: double.maxFinite,
                // width: size.width * 0.8,
                child: Image(image: NetworkImage(image))),
            Text(productName),
            Text(productDescription),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(productPrice),
                IconButton(
                    onPressed: () {
                      addToCart!();
                    },
                    icon: Icon(inCart == true || inCart != null
                        ? Icons.shopping_cart
                        : Icons.delete))
              ],
            )
          ],
        ),
      ),
    );
  }
}

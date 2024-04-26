import 'package:e_commerce_exam_app/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/global.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            Container(
              height: height / 2.4,
              width: width,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: greyColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.arrow_back_ios,
                          color: Colors.white)),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 18),
                      height: double.infinity,
                      alignment: Alignment.centerRight,
                      child: Image.asset(productList[SelectedIndex]['img']),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.all(15),
                child: Align(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productList[SelectedIndex]['name'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star_half,
                              color: Colors.yellow, size: 27),
                          Text(
                            ' ${productList[SelectedIndex]['rate']}  |  ',
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Container(
                            height: 30,
                            width: 78,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: greyColor,
                            ),
                            child: Text(
                              '${productList[SelectedIndex]['sold']} sold',
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      horizontalLine(),
                      const SizedBox(height: 10),
                      const Text(
                        'Color Variant',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: List.generate(Colorlist.length, (index) => ColorVariant(Colorlist[index])),
                      ),
                      const SizedBox(height: 15),
                      horizontalLine(),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Prise',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),),
                          Text('${productList[SelectedIndex]['prise']}/-',
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 18),),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Model Name',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),),
                          Text('ColorFit Pulse 2',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 18),),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          bool check = false;
                          for(int i =0; i<CartList.length; i++){
                            if(CartList[i]['name'] == productList[SelectedIndex]['name']){
                              check = true;
                            }
                          }
                          if(!check){
                            CartList.add(productList[SelectedIndex]);
                            Amount = (Amount + productList[SelectedIndex]['prise']).toInt();
                          }
                        },
                        child: Container(
                          width: width,
                          height: 65,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF13005),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black87,
                                offset: Offset(6, 6),
                                blurRadius: 15,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child:const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_bag,
                                color: Colors.white,
                                size: 25,
                              ),
                              Text(
                                '   Add to Cart',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container ColorVariant(var color) {
    return Container(
      height: 40,
      width: 40,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Container horizontalLine() {
    return Container(
      height: 2,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14, top: 14),
      decoration: BoxDecoration(
        color: greyColor,
      ),
    );
  }
}

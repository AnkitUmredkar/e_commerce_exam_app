import 'package:e_commerce_exam_app/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/color.dart';
import '../utils/global.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      )),
                  const SizedBox(width: 30),
                  const Text(
                    'Your Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 32,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                child: Column(
                    children: List.generate(
                        CartList.length, (index) => CartProduct(index))),
              ),
              const Spacer(),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container CartProduct(int index) {
    return Container(
      height: 162,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 140,
            decoration: BoxDecoration(color: greyColor),
            child: Image.asset(productList[index]['img']),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productList[index]['name'],
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                '${productList[index]['prise']}/-',
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const Spacer(),
              Container(
                height: 50,
                width: 150,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count[index] > 1) {
                              count[index]--;
                              Amount = (Amount - CartList[0]['prise']).toInt();
                            }
                          });
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                    Text(
                      '${count[index]}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            count[index]++;
                            Amount = (Amount + CartList[0]['prise']).toInt();
                          });
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

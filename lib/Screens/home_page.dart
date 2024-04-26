import 'package:e_commerce_exam_app/utils/color.dart';
import 'package:flutter/material.dart';
import '../utils/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(),
                SearchBar(width),
                const Text(
                  'Shop By Category',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          categories('assets/image/category/bag.png'),
                          categories('assets/image/category/device.png'),
                          categories('assets/image/category/clothes.png'),
                          categories('assets/image/category/jewelry.png'),
                          categories('assets/image/category/kitchen.png'),
                          categories('assets/image/category/shoes.png'),
                          categories('assets/image/category/toy.png'),
                          categories('assets/image/category/watch.png'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ...List.generate(textList.length,
                              (index) => TextList(textList[index])),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                const Text(
                  'Newest Arrivals',
                  style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 1,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                ),
                Wrap(
                  children: List.generate(productList.length, (index) => GestureDetector(onTap: (){
                    SelectedIndex = index;
                    Navigator.of(context).pushNamed('/ProductPage');
                  },child: productData(width,index)),)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container productData(double width,index) {
    return Container(
      width: width / 2.4,
      height: 300,
      margin: const EdgeInsets.only(top: 20,left: 8,right:8,bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 200,
            decoration: const BoxDecoration(color: Color(0xFF161D2F)),
            child: Image.asset(productList[index]['img']),
          ),
          const SizedBox(height: 5,),
          Text(
            productList[index]['name'],
            style: const TextStyle(
                letterSpacing: 0.5,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 17.5),
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              const Icon(
                Icons.star_half,
                color: Colors.yellow,
              ),
              Text(
                ' ${productList[index]['rate']}  |  ',
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Poppins', fontSize: 15),
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
                  '${productList[index]['sold']}sold',
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              const Icon(Icons.currency_rupee, color: Colors.white),
              Text(
                '${productList[index]['prise']}/-',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container TextList(String data) => Container(
        margin: const EdgeInsets.only(right: 23),
        child: Text(
          data,
          style: const TextStyle(
              color: Colors.white, fontFamily: 'Poppins', fontSize: 15),
        ),
      );

  Container categories(String img) {
    return Container(
      height: 60,
      width: 60,
      margin: const EdgeInsets.only(right: 22),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Image.asset(img),
    );
  }

  Container SearchBar(double width) {
    return Container(
      height: 60,
      width: width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 20, bottom: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: const TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              size: 25,
            ),
            suffixIcon: Icon(
              Icons.tune,
              color: Colors.grey,
              size: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search Product...',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontFamily: 'Poppins',
            )),
      ),
    );
  }

  Row TopBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/image/me.jpeg'),
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text(
          'Ankit Umredkar \n',
          style: TextStyle(
              fontFamily: 'Poppins', color: Colors.white, fontSize: 17),
        ),
        const Spacer(),
        Stack(
          children: [
            Container(
              height: 45,
              width: 45,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed('/CartPage');
                },
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: 20,
                width: 20,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
                child: const Text(
                  '0',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

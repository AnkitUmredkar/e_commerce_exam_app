import 'package:flutter/material.dart';

List categoryList = [
  'assets/image/category/bag.png'
      'assets/image/category/clothes.png'
      'assets/image/category/device.png'
      'assets/image/category/jewelry.png'
      'assets/image/category/kitchen.png'
      'assets/image/category/shoes.png'
      'assets/image/category/toy.png'
      'assets/image/category/watch.png'
];

late int SelectedIndex ;

List<String> textList = [
  ' Clothes',
  'Shoes',
  'Electronics',
  'Bags  ',
  ' Watch',
  'Jewelry',
  'Kitchen',
  'Toys  '
];

List productList = [
  {
    'img': 'assets/image/product/watch.png',
    'name': 'Smart Watch',
    'prise': 4000,
    'sold': 8934,
    'rate': 5.8,
  },
  {
    'img': 'assets/image/product/bannerimg.png',
    'name': 'JBL HeadPhone',
    'prise': 3000,
    'sold': 6771,
    'rate': 6.0,
  },
  {
    'img': 'assets/image/product/boat.png',
    'name': 'Boat Eardopes',
    'prise': 3500,
    'sold': 6924,
    'rate': 5.9,
  },
  {
    'img': 'assets/image/product/bluetooth.png',
    'name': 'Boat Bluetooth',
    'prise': 2500,
    'sold': 8644,
    'rate': 5.3,
  },
  {
    'img': 'assets/image/product/sonyheadphone.png',
    'name': 'Sony Headphone',
    'prise': 5000,
    'sold': 10032,
    'rate': 6.2,
  },
  {
    'img': 'assets/image/product/speaker.png',
    'name': 'JBL Speaker',
    'prise': 6000,
    'sold': 9432,
    'rate': 5.7,
  },
  {
    'img': 'assets/image/product/camera2.png',
    'name': 'Canon Camera',
    'prise': 4500,
    'sold': 9054,
    'rate': 5.2,
  },
  {
    'img': 'assets/image/product/sonycamera.png',
    'name': 'Sony Camera',
    'prise': 4000,
    'sold': 8334,
    'rate': 7.2,
  },
  {
    'img': 'assets/image/product/panasonic camera.png',
    'name': 'Lumix Camera',
    'prise': 3500,
    'sold': 7992,
    'rate': 5.5,
  },
  {
    'img': 'assets/image/product/camera.png',
    'name': 'Fuji film Camera',
    'prise': 3500,
    'sold': 8534,
    'rate': 4.9,
  },
  {
    'img': 'assets/image/product/microphone.png',
    'name': 'Rod Microphone',
    'prise': 3500,
    'sold': 7644,
    'rate': 5.7,
  },
  {
    'img': 'assets/image/product/laptop.png',
    'name': 'MSI Laptop',
    'prise': 50000,
    'sold': 18347,
    'rate': 8.7,
  },
  {
    'img': 'assets/image/product/hplaptop.png',
    'name': 'HP Laptop',
    'prise': 60000,
    'sold': 18347,
    'rate': 8.6,
  },
];

List Colorlist = [
  Colors.black,
  Colors.blue,
  Colors.purple,
  Colors.brown,
  Colors.teal,
  Colors.red,
];
List count = List.generate(productList.length, (index) => 1);
List CartList = [];
int Amount = 0;
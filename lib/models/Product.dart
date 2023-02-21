import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description, size;
  final List<String> images;
  final List changebale;
  final List<Color> colors;
  final double rating, price, weight;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    required this.size,
    this.weight = 0.0,
    required this.changebale,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 420200,
    images: [
      "https://cdn.shopify.com/s/files/1/0609/3832/2096/products/420200_600x420.png?v=1644745290",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "CAP:XPR SHIELD RETAINER",
    changebale: [
      {
        'name': 'Amper',
        'contents': [
          {'name': '30', 'price': 0, 'stock': 0},
          {'name': '50', 'price': 0, 'stock': 0},
          {'name': '80', 'price': 0, 'stock': 0},
          {'name': '130', 'price': 0, 'stock': 0},
          {'name': '170', 'price': 0, 'stock': 0},
          {'name': '220', 'price': 0, 'stock': 0},
          {'name': '300', 'price': 0, 'stock': 0}
        ]
      },
      {
        'name': 'Color',
        'contents': [
          {'name': 'Red', 'price': 0},
          {'name': 'Blue', 'price': 0},
          {'name': 'Black', 'price': 0},
          {'name': 'White', 'price': 0},
        ]
      }
    ],
    size: '90 x 70 x 80',
    price: 65,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "https://cdn.shopify.com/s/files/1/0609/3832/2096/products/420365_600x420.png?v=1644746216",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    changebale: [],
    price: 50.5,
    size: '',
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "https://trucut.com.au/eshop/images/P/420200.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    changebale: [],
    price: 36.55,
    description: description,
    size: '',
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "https://cdn11.bigcommerce.com/s-u3hf7jh4/images/stencil/1280x1280/products/214529/390766/hypertherm-420225-nozzle-xpr-30-amps-mild-steel_v2__12056.1670290978.jpg?c=2",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    size: '',
    changebale: [],
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

List products = [
  {
    'id': '',
    'name': '',
    'img': [],
    'description': '',
    'size': '',
    'price': '',
  },
  {
    'id': '420228',
    'name': 'SHIELD  ASSEMBLY:XPR 30 AMPS MILD STEEL',
    'img': [],
    'description': '',
    'size': '60 x 50 x 50',
    'price': '',
  },
  {
    'id': '420365',
    'name': 'CAP:XPR NOZZLE  RETAINER',
    'img': [],
    'description': '',
    'size': '90 x 60 x 80',
    'price': '',
  },
  {
    'id': '420225',
    'name': 'NOZZLE:XPR 30 AMPS MILD STEEL',
    'img': [],
    'description': '',
    'size': '60 x 47 x 50',
    'price': '',
  },
  {
    'id': '420407',
    'name': 'SWIRL RING:XPR 30 AMPS MILD STEEL CLOCKWISE',
    'img': [],
    'description': '',
    'size': '60 x 50 x 30',
    'price': '',
  },
  {
    'id': '420222',
    'name': 'ELECTRODE:XPR 30 AMPS MILD STEEL',
    'img': [],
    'description': '',
    'size': '80 x 20 x 25',
    'price': '',
  },
  {
    'id': '420368',
    'name': 'WATER  TUBE ASSEMBLY:XPR',
    'img': [],
    'description': '',
    'size': '12 x 25 x 25',
    'price': '',
  },
];

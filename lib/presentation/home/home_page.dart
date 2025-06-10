import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garber_fruite/models/category_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    'assets/images/slider1.png',
    'assets/images/slider2.png',
    'assets/images/slider3.png',
  ];

  List<CategoryModel> categories = [
    CategoryModel(name: 'Fruits', image: 'assets/images/fruits.png'),
    CategoryModel(name: 'milk & egg', image: 'assets/images/milk.png'),
    CategoryModel(name: 'Laundry', image: 'assets/images/laundry.png'),
    CategoryModel(name: 'Beverages', image: 'assets/images/beverages.png'),
    CategoryModel(name: 'Vegetables', image: 'assets/images/vegtables.png'),
  ];

  List<ProductModel> products = [
    ProductModel(
      'Banana',
      'assets/images/banana.png',
      '2.00',
      '4.5',
      '100',
      () {},
    ),
    ProductModel(
      'Pepper',
      'assets/images/pepper.png',
      '3.00',
      '4.7',
      '150',
      () {},
    ),
    ProductModel(
      'Orange',
      'assets/images/orange.png',
      '2.50',
      '4.6',
      '120',
      () {},
    ),
  ];
  List<ProductModel> basketList = [];

  void toggleSelection(ProductModel product) {
    setState(() {
      product.isInBasket = !product.isInBasket;
      if (product.isInBasket) {
        basketList.add(product);
      } else {
        basketList.remove(product);
      }
    });
  }

  void removeFromBasket(ProductModel product) {
    setState(() {
      product.isInBasket = false;
      basketList.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox.shrink(),
          leadingWidth: 0,

          title: Row(
            children: [
              SvgPicture.asset('assets/icons/moto.svg', height: 30, width: 30),
              const SizedBox(width: 8),
              const Text(
                '61 Hopper street..',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(
                'assets/icons/arrow_down.svg',
                height: 30,
                width: 30,
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/basket.svg',
                height: 30,
                width: 30,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  scrollPhysics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  height: 200,
                  aspectRatio: 1.0,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  // onPageChanged: ,
                  scrollDirection: Axis.horizontal,
                ),
                items:
                    images.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(image, fit: BoxFit.cover),
                          );
                        },
                      );
                    }).toList(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),

                child: Row(
                  children: List.generate(categories.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,

                            backgroundImage: AssetImage(
                              categories[index].image,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            categories[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(
                                0xFF5A5555,
                              ) /* Neutrals-Neutrals700 */,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Fruits',
                      style: TextStyle(
                        color: const Color(0xFF0A0B0A) /* Base-Base-Black */,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(
                          color: const Color(0xFF0CA201) /* Primary-Primary */,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: List.generate(products.length, (index) {
                    return Column(
                      children: [
                        Card(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(products[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () => toggleSelection(products[index]),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,

                                    child: Icon(
                                      products[index].isInBasket
                                          ? Icons.check
                                          : Icons.add,
                                      color: Colors.black,

                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: Text(
                                products[index].name,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              spacing: 4,
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                Text(
                                  products[index].rate,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '(${products[index].rateCount})',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: SizedBox(
                                width: 140,
                                child: Text(
                                  '\$${products[index].price}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ),
              ),

              // Basket Bar
              if (basketList.isNotEmpty)
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0CA201),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      // Basket items
                      Expanded(
                        child: ListView.builder(
                          itemCount: basketList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final product = basketList[index];
                            return GestureDetector(
                              onTap: () => removeFromBasket(product),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        product.image,
                                        width: 30,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // View Basket section
                      GestureDetector(
                        onTap: () {
                          // Handle basket view navigation
                        },
                        child: Row(
                          children: [
                            VerticalDivider(
                              color: Colors.white,
                              thickness: 3,
                              width: 1,
                              indent: 10,
                              endIndent: 10,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'View Basket',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/icons/basket.svg',
                              height: 20,
                              width: 20,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

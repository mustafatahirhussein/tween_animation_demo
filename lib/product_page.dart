import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  List<Product> list = [
    Product(path: "assets/black.png", color: const Color(0xff000000)),
    Product(path: "assets/cream.png", color: const Color(0xfffcecd0)),
    Product(path: "assets/blue.png", color: const Color(0xffb6d7e4)),
  ];

  int currentIndex = 0;

  AnimationController? animationController;
  Animation<Offset>? hoverAnimation;

  @override
  void initState() {
    // TODO: implement initState

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700))
      ..repeat(reverse: true);
    hoverAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(0, 0.05))
            .animate(animationController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff292929),
      body: SafeArea(
        child: Column(
          children: [
            SlideTransition(
              position: hoverAnimation!,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                child: Image.asset(
                  list[currentIndex].path,
                  key: ValueKey<int>(currentIndex),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "BOAT Rockerz 450R",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 35,
                  color: Color(0xffffffff)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "bluetooth headphones".toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: const Color(0xffffffff).withOpacity(0.4)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                list.length,
                (index) => InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: list[index].color),
                  ),
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Rs. 1,599",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  letterSpacing: 1,
                  color: Colors.redAccent),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                color: Colors.red,
                child: Text(
                  "notify me".toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xffffffff),
                      fontSize: 16,
                      letterSpacing: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  String path;
  Color color;

  Product({required this.path, required this.color});
}

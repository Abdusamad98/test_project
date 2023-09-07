import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondTaskScreen extends StatelessWidget {
  const SecondTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Cashier",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset("assets/images/menu.svg"),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 0.5,
            indent: 0,
            endIndent: 0,
            color: Color(0xFFD1D1D1),
          ),
          Container(
            color: Colors.white,
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "All products",
                  style: TextStyle(fontSize: 16),
                ),
                const Icon(Icons.expand_more_rounded),
                SizedBox(width: MediaQuery.of(context).size.width / 6),
                const VerticalDivider(
                  width: 0,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Color(0xFFD1D1D1),
                ),
                SvgPicture.asset("assets/images/search.svg"),
                const VerticalDivider(
                  width: 0,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Color(0xFFD1D1D1),
                ),
                SvgPicture.asset("assets/images/bar_code.svg"),
                const VerticalDivider(
                  width: 0,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Color(0xFFD1D1D1),
                ),
                SvgPicture.asset("assets/images/list.svg"),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(24),
              crossAxisCount: 2,
              mainAxisSpacing: 23,
              crossAxisSpacing: 23,
              childAspectRatio: 0.8,
              children: [
                for (int i = 0; i < 100; i++)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          spreadRadius: 5,
                          color: Colors.grey.shade300,
                          offset: const Offset(2, 2),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              "https://www.eatingwell.com/thmb/m5xUzIOmhWSoXZnY-oZcO9SdArQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/article_291139_the-top-10-healthiest-foods-for-kids_-02-4b745e57928c4786a61b47d8ba920058.jpg"),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Salad Tuna",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "Must choose level",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xFF2A3256).withOpacity(0.5),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "\$10.99",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SvgPicture.asset("assets/images/add.svg")
                          ],
                        )
                      ],
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}

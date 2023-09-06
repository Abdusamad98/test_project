import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondTaskScreen extends StatelessWidget {
  const SecondTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
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
            thickness: 1,
            height: 1,
          ),
          Container(
            height: 56,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(
                  child: Row(
                    children: [
                      SizedBox(width: 24),
                      Text("All Products"),
                      SizedBox(width: 8),
                      Icon(Icons.expand_more_outlined),
                    ],
                  ),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const VerticalDivider(thickness: 1),
                    SvgPicture.asset("assets/images/search.svg"),
                    const VerticalDivider(thickness: 1),
                    SvgPicture.asset("assets/images/bar_code.svg"),
                    const VerticalDivider(thickness: 1),
                    SvgPicture.asset("assets/images/list.svg"),
                  ],
                ))
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: const EdgeInsets.all(16),
              children: [
                for (int i = 0; i < 100; i++)
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            "assets/images/meal.jpeg",
                            width: MediaQuery.of(context).size.width / 2,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                          child: Text(
                            "Salad Tuna",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
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

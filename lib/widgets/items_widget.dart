import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemsWidget extends StatelessWidget {
  final List<String> itemText = [
    "Blouse",
    "Gamis",
    "Rok",
    "Kemeja",
    "Kebaya",
  ];
  final List<String> priceText = [
    "Rp100.000",
    "Rp300.000",
    "Rp200.000",
    "Rp100.000",
    "Rp500.000",
  ];

  final String searchQuery;

  ItemsWidget({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    List<String> filteredItems = [];
    List<String> filteredPrices = [];
    for (int i = 0; i < itemText.length; i++) {
      if (itemText[i].toLowerCase().contains(searchQuery.toLowerCase())) {
        filteredItems.add(itemText[i]);
        filteredPrices.add(priceText[i]);
      }
    }

    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < filteredItems.length; i++)
          Container(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            margin: EdgeInsets.symmetric(vertical: 14, horizontal: 11),
            decoration: BoxDecoration(
              color: Color.fromARGB(187, 228, 228, 228),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(0),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "itemDetailPage");
                  },
                  child: Container(
                    margin: EdgeInsets.all(0),
                    width: 150,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/${itemText.indexOf(filteredItems[i]) + 1}.jpeg"), // Corrected index
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 1, top: 6, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    filteredItems[i],
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        filteredPrices[i],
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart_checkout,
                        color: Colors.black,
                        size: 17,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek/widgets/bottom_nav_bar.dart';
import 'package:projek/widgets/products_app_bar.dart';
import 'package:projek/widgets/categories_widget.dart';
import 'package:projek/widgets/items_widget.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  var selectedExplore = 2;

  TextEditingController _searchController =
      TextEditingController(); // Controller for the search field
  String _searchQuery = ''; // Variable to store the search query

  @override
  void dispose() {
    _searchController
        .dispose(); // Dispose of the controller when the widget is disposed
    super.dispose();
  }

//State class
  int _page = 2;
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ListView(
        children: [
          ProductsAppBar(),
          Container(
            margin: EdgeInsets.only(top: 0),
            height: 1250,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 243, 242, 245),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller:
                              _searchController, // Assign the controller to the TextFormField
                          onChanged: (value) {
                            // Update the search query when the user types in the search field
                            setState(() {
                              _searchQuery = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Find item...",
                            hintStyle: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFCACACA),
                              height: 150 / 100,
                            ),
                            prefixIcon: const Icon(
                              FeatherIcons.search,
                              color: Color(0xFFADACAD),
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 15, bottom: 12, left: 15),
                  child: Text(
                    "Categories",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CategoriesWidget(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 15, bottom: 0, left: 15),
                  child: Text(
                    "Designer Collection",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 13.8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ItemsWidget(
                    searchQuery:
                        _searchQuery), // Pass the search query to the ItemsWidget
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _page,
        onTap: (index) {
          setState(() {
            _page = index;
          });
          // Handle navigation based on the selected index
          switch (index) {
            case 0:
              // Navigate to Home
              Navigator.pushNamed(context, "homePage");
              break;
            case 1:
              // Navigate to Explore
              Navigator.pushNamed(context, "explorePage");
              break;
            case 2:
              // Navigate to Products
              Navigator.pushNamed(context, "productsPage");
              break;
            case 3:
              // Navigate to Profile
              Navigator.pushNamed(context, "profilePage");
              break;
          }
        },
      ),
    );
  }
}

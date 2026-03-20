import 'package:flutter/material.dart';
import 'cartscreen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  List<Map<String,dynamic>>products = [
    {"name": "Lays","price": "50", "image": "assets/jpg_images/lays.jpg","qty": 0},
    {"name": "Kinder joy","price": "40", "image": "assets/jpg_images/kinderjoy.jpg","qty": 0},
    {"name": "Pepsi","price": "30", "image": "assets/jpg_images/pepsi.jpg","qty": 0},
    {"name": "Kitkat","price": "25", "image": "assets/png_images/kitkatnestle.png","qty": 0},
  ];

  List<Map<String,dynamic>>cart = [];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zepto",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue[400],
      ),


       body: GridView.builder(
         padding: EdgeInsetsGeometry.all(12.0),
         itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12),
          itemBuilder: (context,index){
            return buildProductCard(index);
          }
        ),


      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.blue.shade400,
        currentIndex: selectedIndex,
          onTap: (current_index){
          setState(() {
            selectedIndex = current_index;
          });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home,size: 30),label: "Home"),

            BottomNavigationBarItem(
                icon: Stack(
                    children: [
                      Icon(Icons.shopping_cart_outlined,
                      size: 30,),
                      if (cart.isNotEmpty)
                        Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              constraints: BoxConstraints(
                                minHeight: 12,minWidth: 15,
                              ),
                              child: Text('${cart.length}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 8
                              ),
                                textAlign: TextAlign.center,
                              ),

                            )
                        )
          ],
      ),
            label: "cart"),

           BottomNavigationBarItem(
                icon: Icon(Icons.person,size: 30),label: "Profile"),

        ],
      ),
    );
  }

  Widget buildProductCard(int index){
    var product = products[index];
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(12) ,
        border: Border.all( color: Colors.blue.shade400 )
        ),

      child: Column(
        children: [
          Expanded(
              child: Image.asset(product["image"],fit: BoxFit.cover,),
          ),
          SizedBox(height: 6,),
          Text("${product["name"]}"),
          Text("₹${product["price"]}"),
          ElevatedButton(onPressed: (){
            setState(() {
              cart.add(product);
            });
          }, child: Text("ADD"))
        ],
      ),
    );
  }
}


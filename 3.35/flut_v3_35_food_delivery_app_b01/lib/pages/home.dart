import 'package:flut_v3_35_food_delivery_app_b01/model/category_model.dart';
import 'package:flut_v3_35_food_delivery_app_b01/model/pizza_model.dart';
import 'package:flut_v3_35_food_delivery_app_b01/service/category_data.dart';
import 'package:flut_v3_35_food_delivery_app_b01/service/pizza_data.dart';
import 'package:flut_v3_35_food_delivery_app_b01/service/widget_support.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<PizzaModel> pizzas = [];
  String track = "0";

  @override
  void initState() {
    // TODO: implement initState
    categories = getCategories();
    pizzas = getPizzas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "images/logo.png",
                      height: 50,
                      width: 110,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "Order your favorite food!",
                      style: AppWidget.SimpleTextFieldStyle(),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "images/boy.jpg",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search your favorite food...",
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.search, color: Colors.white, size: 30),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    categories[index].name!,
                    categories[index].image!,
                    index.toString(),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.72,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                  ),
                  itemCount: pizzas.length,
                  itemBuilder: (context, index) {
                    return FoodTile(
                      pizzas[index].name!,
                      pizzas[index].image!,
                      pizzas[index].price!,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CategoryTile(String name, String image, String categoryIndex) {
    return GestureDetector(
      onTap: () => {track = categoryIndex, setState(() {})},
      child: track == categoryIndex
          ? Container(
              margin: EdgeInsets.only(right: 20, bottom: 10),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        image,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Text(name, style: AppWidget.whiteTextFieldStyle()),
                    ],
                  ),
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.only(right: 20, bottom: 10),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Color(0xFFececf8),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Image.asset(image, height: 50, width: 50, fit: BoxFit.cover),
                  SizedBox(width: 10),
                  Text(name, style: AppWidget.SimpleTextFieldStyle()),
                ],
              ),
            ),
    );
  }

  Widget FoodTile(String name, String image, String price) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.only(left: 10, top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              image,
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
          ),
          Text(name, style: AppWidget.boldTextFieldStyle()),
          Text("\$$price", style: AppWidget.SimpleTextFieldStyle()),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                  color: Color(0xffef2b39),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Icon(Icons.arrow_forward, color: Colors.white, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

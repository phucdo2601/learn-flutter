import 'package:flut_v3_35_food_delivery_app_b01/model/pizza_model.dart';

List<PizzaModel> getPizzas() {
  List<PizzaModel> pizzas = [];
  PizzaModel pizzaModel = new PizzaModel();

  pizzaModel.name = "Cheese Pizza";
  pizzaModel.image = "images/pizza1.png";
  pizzaModel.price = "50";
  pizzas.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Margherita Pizza";
  pizzaModel.image = "images/pizza2.png";
  pizzaModel.price = "60";
  pizzas.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Test 3 Pizza";
  pizzaModel.image = "images/pizza3.png";
  pizzaModel.price = "70";
  pizzas.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Test 4 Pizza";
  pizzaModel.image = "images/pizza4.png";
  pizzaModel.price = "80";
  pizzas.add(pizzaModel);
  pizzaModel = new PizzaModel();

  return pizzas;
}

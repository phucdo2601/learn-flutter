import 'package:flut_v3_35_food_delivery_app_b01/model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.name = " Pizza";
  categoryModel.image = "images/pizza.png";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name = " Bugger";
  categoryModel.image = "images/burger.png";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name = " Chinese";
  categoryModel.image = "images/chinese.png";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name = " Mexican";
  categoryModel.image = "images/tacos.png";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  return categories;
}

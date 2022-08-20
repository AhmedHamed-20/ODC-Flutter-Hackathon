import 'package:la_vie/model/data_models/product_model/all_products_model.dart';
import 'package:la_vie/model/network/end_points/end_points.dart';

class AllPlants {
  static List? allPlants = AllProductsModel.allPlants;
  static String getNameOfPlants(int index) {
    return allPlants?[index]['plant']['name'];
  }

  static String getPhotoOfPlants(int index) {
    if (allPlants?[index]['plant']['imageUrl'] == '') {
      return 'https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=';
    }
    return EndPoints.baseUrl + allPlants?[index]['plant']['imageUrl'];
  }

  static int getPriceOfPlants(int index) {
    return allPlants?[index]['price'];
  }
}

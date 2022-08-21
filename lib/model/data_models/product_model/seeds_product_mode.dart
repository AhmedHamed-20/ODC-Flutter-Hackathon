import 'package:la_vie/model/data_models/product_model/all_products_model.dart';
import 'package:la_vie/model/network/end_points/end_points.dart';

class AllSeeds {
  static List? allSeeds = AllProductsModel.allSeeds;
  static String getNameOfSeed(int index) {
    return allSeeds?[index]['seed']['name'];
  }

  static String getPhotoOfSeed(int index) {
    if (allSeeds?[index]['seed']['imageUrl'] == '') {
      return 'https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=';
    }
    return EndPoints.baseUrl + allSeeds?[index]['seed']['imageUrl'];
  }

  static int getPriceOfSeed(int index) {
    return allSeeds?[index]['price'];
  }

  static String getDescriptionOfSeeds(int index) {
    return allSeeds?[index]['seed']['description'];
  }

  static String getSeedId(int index) {
    return allSeeds?[index]['seed']['seedId'];
  }

  static int getSeedsAmount(int index) {
    return allSeeds?[index]['seed']['amount'];
  }

  static void setNewValueForAmount(int newValue, int index) {
    allSeeds?[index]['seed']['amount'] = newValue;
  }
}

import 'package:la_vie/model/network/end_points/end_points.dart';

class AllProductsModel {
  static List? allProdcutsData;
  static List? allSeeds = [{}];
  static List? allPlants = [{}];

  static List? allTools = [{}];

  static String? type;
  static int? price;
  static List? productData;

  static void storeDate(Map<String, dynamic> allProductsData) {
    allProdcutsData = allProductsData['data'];
    allProdcutsData?.forEach(
      (element) {
        if (element['type'] == 'SEED') {
          allSeeds?.add({'seed': element['seed'], 'price': element['price']});
        } else if (element['type'] == 'PLANT') {
          allPlants
              ?.add({'plant': element['plant'], 'price': element['price']});
        } else {
          allTools?.add({'tool': element['tool'], 'price': element['price']});
        }
      },
    );
    allSeeds?.removeAt(0);
    allPlants?.removeAt(0);
    allTools?.removeAt(0);
  }

  static String getNameOfProduct(
    int index,
  ) {
    if (allProdcutsData?[index]['type'] == 'PLANT') {
      return allProdcutsData?[index]['plant']['name'];
    } else if (allProdcutsData?[index]['type'] == 'SEED') {
      return allProdcutsData?[index]['seed']['name'];
    } else {
      return allProdcutsData?[index]['tool']['name'];
    }
  }

  static String getDescriptionOfProduct(int index) {
    if (allProdcutsData?[index]['type'] == 'PLANT') {
      return allProdcutsData?[index]['plant']['description'];
    } else if (allProdcutsData?[index]['type'] == 'SEED') {
      return allProdcutsData?[index]['seed']['description'];
    } else {
      return allProdcutsData?[index]['tool']['description'];
    }
  }

  static String getImageUrlOfProduct(int index) {
    if (allProdcutsData?[index]['type'] == 'PLANT') {
      if (allProdcutsData?[index]['plant']['imageUrl'] == "") {
        return 'https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=';
      }
      return EndPoints.baseUrl + allProdcutsData?[index]['plant']['imageUrl'];
    } else if (allProdcutsData?[index]['type'] == 'SEED') {
      if (allProdcutsData?[index]['seed']['imageUrl'] == "") {
        return 'https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=';
      }
      return EndPoints.baseUrl + allProdcutsData?[index]['seed']['imageUrl'];
    } else {
      if (allProdcutsData?[index]['tool']['imageUrl'] == "") {
        return 'https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=';
      }
      return EndPoints.baseUrl + allProdcutsData?[index]['tool']['imageUrl'];
    }
  }

  static String getIdOfProduct(int index) {
    if (allProdcutsData?[index]['type'] == 'PLANT') {
      return allProdcutsData?[index]['plant']['plantId'];
    } else if (allProdcutsData?[index]['type'] == 'SEED') {
      return allProdcutsData?[index]['seed']['seedId'];
    } else {
      return allProdcutsData?[index]['tool']['toolId'];
    }
  }

  static int getPriceOfProduct(int index) {
    return allProdcutsData?[index]['price'];
  }

  static bool getAvailabStateOfProduct(int index) {
    return allProdcutsData?[index]['available'];
  }

  static int getWaterCapacityOfProduct(int index) {
    if (allProdcutsData?[index]['type'] == 'PLANT') {
      return allProdcutsData?[index]['plant']['waterCapacity'];
    } else if (allProdcutsData?[index]['type'] == 'SEED') {
      return allProdcutsData?[index]['seed']['waterCapacity'];
    } else {
      return allProdcutsData?[index]['tool']['waterCapacity'];
    }
  }

  static int getSunLightOfProduct(int index) {
    if (allProdcutsData?[index]['type'] == 'PLANT') {
      return allProdcutsData?[index]['plant']['sunLight'];
    } else if (allProdcutsData?[index]['type'] == 'SEED') {
      return allProdcutsData?[index]['seed']['sunLight'];
    } else {
      return allProdcutsData?[index]['tool']['sunLight'];
    }
  }

  static int getTemperatureOfProduct(int index) {
    if (allProdcutsData?[index]['type'] == 'PLANT') {
      return allProdcutsData?[index]['plant']['temperature'];
    } else if (allProdcutsData?[index]['type'] == 'SEED') {
      return allProdcutsData?[index]['seed']['temperature'];
    } else {
      return allProdcutsData?[index]['tool']['temperature'];
    }
  }
}

import 'package:la_vie/model/network/end_points/end_points.dart';

class BlogsDataModel {
  static List? plants;
  static List? seeds;
  static List? tools;
  static storeDate(Map<String, dynamic> blogsData) {
    plants = blogsData['data']['plants'];
    seeds = blogsData['data']['seeds'];
    tools = blogsData['data']['tools'];
  }

  static List? getCurrentTabList(int index) {
    if (index == 0) {
      return plants;
    } else if (index == 1) {
      return seeds;
    } else {
      return tools;
    }
  }

  static String getPlantId({required int index}) {
    return plants?[index]['plantId'];
  }

  static String getSeedId({required int index}) {
    return seeds?[index]['seedId'];
  }

  static String getToolsId({required int index}) {
    return tools?[index]['toolId'];
  }

  static String getPlantName({required int index}) {
    return plants?[index]['name'];
  }

  static String getSeedName({required int index}) {
    return seeds?[index]['name'];
  }

  static String getToolsName({required int index}) {
    return tools?[index]['name'];
  }

  static String getPlantDescription({required int index}) {
    return plants?[index]['description'];
  }

  static String getSeedDescription({required int index}) {
    return seeds?[index]['description'];
  }

  static String getToolsDescription({required int index}) {
    return tools?[index]['description'];
  }

  static String getPlantPhoto({required int index}) {
    if (plants?[index]['imageUrl'] == "") {
      return 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png';
    }
    return EndPoints.baseUrl + plants?[index]['imageUrl'];
  }

  static String getSeedPhoto({required int index}) {
    if (seeds?[index]['imageUrl'] == "") {
      return 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png';
    }
    return EndPoints.baseUrl + seeds?[index]['imageUrl'];
  }

  static String getToolsPhoto({required int index}) {
    if (tools?[index]['imageUrl'] == "") {
      return 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png';
    }
    return EndPoints.baseUrl + tools?[index]['imageUrl'];
  }
}

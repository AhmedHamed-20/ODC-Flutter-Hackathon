import 'package:la_vie/model/network/end_points/end_points.dart';

class FormusMeModel {
  static List? forumsMeData;
  static String? forumId;
  static String? forumTitle;
  static String? forumDescription;
  static String? forumUrl;
  static String? forumsUserId;
  static List? forumLikes;
  static List? forumComments;

  static void storeData(Map<String, dynamic> forumData) {
    forumsMeData = forumData['data'];
  }

  static String getForumId(int index) {
    return forumsMeData?[index]['forumId'];
  }

  static String getForumTitle(int index) {
    if (forumsMeData?[index]['title'] == '') {
      return 'temp';
    }
    return forumsMeData?[index]['title'] ?? 'temp';
  }

  static String getForumDesciption(int index) {
    if (forumsMeData?[index]['description'] == '') {
      return 'temp';
    }
    return forumsMeData?[index]['description'] ?? 'temp';
  }

  static String getForumImage(int index) {
    if (forumsMeData?[index]['imageUrl'] == null ||
        forumsMeData?[index]['imageUrl'] == '') {
      print(forumsMeData?[index]['imageUrl']);

      return 'https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=';
    } else {
      return EndPoints.baseUrl + forumsMeData?[index]['imageUrl'];
    }
  }

  static String getForumUserId(int index) {
    return forumsMeData?[index]['userId'];
  }

  static int countOfLikes(int index) {
    return forumsMeData?[index]['ForumLikes'].length ?? 0;
  }

  static int countOfComments(int index) {
    return forumsMeData?[index]['ForumComments'].length ?? 0;
  }

  static String getUserLikeId(int index) {
    return forumsMeData?[index]['ForumLikes']['userId'];
  }

  static String getUserIdOfComment(int index) {
    return forumsMeData?[index]['ForumComments']['userId'];
  }

  static String getUserComment(int index) {
    return forumsMeData?[index]['ForumComments']['comment'];
  }

  static String getUserCommentId(int index) {
    return forumsMeData?[index]['ForumComments']['forumCommentId'];
  }

  static String getCommentDate(int index) {
    return forumsMeData?[index]['ForumComments']['createdAt'];
  }

  static String getUserPhoto(int index) {
    if (forumsMeData?[index]['user']['imageUrl'] == "") {
      return 'https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=';
    } else {
      return forumsMeData?[index]['user']['imageUrl'];
    }
  }

  static String getUserName(int index) {
    return forumsMeData?[index]['user']['firstName'];
  }

  static String getUserLastName(int index) {
    return forumsMeData?[index]['user']['lastName'];
  }
}

import 'package:la_vie/model/network/end_points/end_points.dart';

class AllFormusModel {
  static List? forumsData;
  static String? forumId;
  static String? forumTitle;
  static String? forumDescription;
  static String? forumUrl;
  static String? forumsUserId;
  static List? forumLikes;
  static List? forumComments;

  static void storeData(Map<String, dynamic> forumData) {
    forumsData = forumData['data'];
  }

  static String getForumId(int index) {
    return forumsData?[index]['forumId'] ?? 'temp';
  }

  static String getForumTitle(int index) {
    if (forumsData?[index]['title'] == '') {
      return 'temp';
    }
    return forumsData?[index]['title'] ?? 'temp';
  }

  static String getForumDesciption(int index) {
    if (forumsData?[index]['description'] == '') {
      return 'temp';
    }
    return forumsData?[index]['description'] ?? 'test';
  }

  static String getForumImage(int index) {
    if (forumsData?[index]['imageUrl'] == null ||
        forumsData?[index]['imageUrl'] == '') {
      return 'https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=';
    } else {
      return EndPoints.baseUrl + forumsData?[index]['imageUrl'];
    }
  }

  static String getForumUserId(int index) {
    return forumsData?[index]['userId'] ?? 'temp';
  }

  static int countOfLikes(int index) {
    return forumsData?[index]['ForumLikes'].length ?? 1;
  }

  static int countOfComments(int index) {
    return forumsData?[index]['ForumComments'].length ?? 1;
  }

  static String getUserLikeId(int index) {
    return forumsData?[index]['ForumLikes']['userId'] ?? 'temp';
  }

  static String getUserIdOfComment(int index) {
    return forumsData?[index]['ForumComments']['userId'] ?? 'temp';
  }

  static String getUserComment(int index, int indexOfComment) {
    return forumsData?[index]['ForumComments'][indexOfComment]['comment'] ??
        'temp';
  }

  static String getUserCommentId(int index) {
    return forumsData?[index]['ForumComments']['forumCommentId'] ?? 'temp';
  }

  static String getCommentDate(int index) {
    return forumsData?[index]['ForumComments']['createdAt'] ?? 'temp';
  }
}

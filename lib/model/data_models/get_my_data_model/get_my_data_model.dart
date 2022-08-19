class GetMyDataModel {
  static String? userId;
  static String? firstName;
  static String? lastName;
  static String? email;
  static String? imageUrl;
  static List? userNotification;
  static int? userPoints;

  static void storeMyData(Map<String, dynamic> myData) {
    userId = myData['data']['userId'];
    firstName = myData['data']['firstName'];
    lastName = myData['data']['lastName'];
    email = myData['data']['email'];
    imageUrl = myData['data']['imageUrl'];
    userNotification = myData['data']['UserNotification'];
    userPoints = myData['data']['UserPoints'];
  }
}


// "userId": "67402904-4331-4d8a-84f8-a8ed64c25f3b",
    // "firstName": "ahmed",
    // "lastName": "hamed",
    // "email": "anaahmedmohamed57@gmail.com",
    // "imageUrl": "https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png",
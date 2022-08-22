class CardModel {
  static List<dynamic> cartData = [];

  static setDataToCard(dynamic data) {
    cartData.add(data);
  }

  static List getCardData() {
    if (cartData.elementAt(0) == 0) {
      cartData.removeAt(0);
    }
    return cartData;
  }

  static String getPhotoUrl(int index) {
    return cartData[index]['imageUrl'];
  }

  static String getName(int index) {
    return cartData[index]['name'];
  }

  static int getPrice(int index) {
    return cartData[index]['price'];
  }

  static String getId(int index) {
    return cartData[index]['proudctId'];
  }

  static int getAmount(int index) {
    return cartData[index]['amount'];
  }

  static void setDataToAmount(int index, int data) {
    cartData[index]['amount'] += data;
  }

  static void removeDataFromCardAtIndex(int index) {
    cartData.removeAt(index);
  }
}

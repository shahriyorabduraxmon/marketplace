extension PriceExtention on double {
  String get priceFormat {
    int price = toInt();
    String result = '';
    int count = 0;

    if (price == 0) {
      return price.toString();
    } else {
      for (int i = price.toString().length - 1; i >= 0; i--) {
        if (count == 3) {
          result = '${price.toString()[i]} $result';
          count = 0;
        } else {
          result = price.toString()[i] + result;
        }
        count++;
      }
      return result;
    }
  }
}



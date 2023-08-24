extension ListStringX on List<String> {
  String calculateMean() {
    if (isEmpty) {
      throw ArgumentError("List cannot be empty.");
    }

    double sum = 0;
    for (String strNumber in this) {
      double number = double.parse(strNumber);
      sum += number;
    }

    return (sum / length).toString();
  }
}

import 'package:mean_calc/editable_datatable.dart';

class EditableScoreTable extends EditableDataTable {
  EditableScoreTable(super.columns);

  String calculateMean() {
    double totalScore = 0;
    int totalLength = 0;

    for (var row in rowDicts) {
      String coef = row["coefficient"];
      String grade = row["grade"];
      try {
        double currentScore = double.parse(grade) * double.parse(coef);
        totalScore += currentScore;
        totalLength += 1;
      } on Exception {
        continue;
      }
    }
    return (totalScore / totalLength).toString();
  }
}

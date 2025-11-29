// final Map<DateTime, int>? datasets;
// i will pass datasets , check if current date is in datasets
// if yes check the value of current date in datasets and return
// if no return 0

int checkCurrDate(Map<DateTime, int>? datasets) {
  final DateTime currDate;
  currDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  if (datasets != null) {
    if (datasets.containsKey(currDate)) {
      return datasets[currDate] ?? 0;
    }
  }
  return 0;
}

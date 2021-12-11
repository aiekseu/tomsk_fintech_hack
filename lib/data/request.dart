class Request {
  String companyName;
  double minPayment;
  String rating;
  double rate;
  String goal;
  int softCap;
  int hardCap;
  int accumulatedSum;
  DateTime softEndDate;
  DateTime hardEndDate;

  Request(
      {required this.companyName,
      required this.minPayment,
      required this.rating,
      required this.rate,
      required this.goal,
      required this.softCap,
      required this.hardCap,
      required this.accumulatedSum,
      required this.softEndDate,
      required this.hardEndDate});
}

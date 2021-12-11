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
      { this.companyName = '',
        required this.minPayment,
        this.rating = '',
        required this.rate,
        required this.goal,
        required this.softCap,
        required this.hardCap,
        this.accumulatedSum = 0,
        required this.softEndDate,
        required this.hardEndDate});
}
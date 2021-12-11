class Request {
  double minPayment;
  double rate;
  String goal;
  int softCap;
  int hardCap;

  Request({
    required this.minPayment,
    required this.rate,
    required this.goal,
    required this.softCap,
    required this.hardCap,
  });
}

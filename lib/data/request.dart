class Request {
  int companyId;
  double minPayment;
  double rate;
  String goal;
  String repaymentSchedule;
  int softCap;
  int hardCap;
  int softEndDate;
  int hardEndDate;

  Request(
      {required this.companyId,
      required this.minPayment,
      required this.rate,
      required this.goal,
      required this.repaymentSchedule,
      required this.softCap,
      required this.hardCap,
      required this.softEndDate,
      required this.hardEndDate});
}

class RequestCashFlow{
  int id;
  int requestId;
  int sum;
  DateTime date;

  RequestCashFlow({
    required this.id,
    required this.requestId,
    required this.sum,
    required this.date,
});


  static RequestCashFlow fromJson(Map<String, dynamic> json) {
    return RequestCashFlow(
      id: json['id'],
      requestId: json['request'].cast<Map, dynamic>()['id'],
      sum: json['sum'].round(),
      date: DateTime.parse(json['date']),
    );
  }
}
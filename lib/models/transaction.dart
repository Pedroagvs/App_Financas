class Transaction {
  final String title;
  final DateTime date;
  final String? value;
  final String? typeofpayment;
  Transaction({
    required this.date,
    required this.title,
    required this.value,
    required this.typeofpayment,
  });
}

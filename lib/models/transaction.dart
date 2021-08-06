class Transaction {
  String? id;
  String? title;
  DateTime? date;
  double? value;
  String? typeofpayment;

  Transaction(
      {required this.id,
      required this.title,
      required this.date,
      required this.value,
      this.typeofpayment});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    value = json['value'];
    typeofpayment = json['typeofpayment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['value'] = this.value;
    data['typeofpayment'] = this.typeofpayment;
    return data;
  }
}

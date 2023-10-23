

class Tranx_controller {
  String? amount;
  String? type;
  String? createdDate;
  String? transactionStatus;
  String? transectionMode;

  Tranx_controller({
    required this.amount,
    required this.type,
    required this.createdDate,
    required this.transactionStatus,
    required this.transectionMode,
  });

  factory Tranx_controller.fromJson(Map<String, dynamic> json) => Tranx_controller(
    amount: json["amount"],
    type: json["type"],
    createdDate: json["created_date"],
    transactionStatus: json["transaction_status"],
    transectionMode: json["transection_mode"],
  );
}
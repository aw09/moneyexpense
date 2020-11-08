class TransactionModel {

  static String table = 'transaction';

  int idTransaction;
  String transactionName;
  int idCategory;
  String date;
  int nominal;

  TransactionModel({
    this.idTransaction,
    this.transactionName,
    this.idCategory,
    this.date,
    this.nominal,
  });


  factory TransactionModel.fromMap(Map<String, dynamic> json) => TransactionModel(
    idTransaction: json["id_transaction"],
    transactionName: json["transaction_name"],
    idCategory: json["id_category"],
    date: json["date"],
    nominal: json["nominal"],
  );

  Map<String, dynamic> toMap() => {
    "id_transaction": idTransaction,
    "transaction_name": transactionName,
    "id_category": idCategory,
    "date": date,
    "nominal": nominal,
  };
}

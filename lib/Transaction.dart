class Transaction {
  late int id;
  late String content;
  late double amount;
  late String createAt;

  Transaction(
      {required this.id,
      required this.content,
      required this.amount,
      required this.createAt});

  @override
  String toString() {
    // TODO: implement toString
    return "ID ${this.id} - Content ${this.content} - Amount ${this.amount} - CreateAt ${this.createAt}";
  }
}

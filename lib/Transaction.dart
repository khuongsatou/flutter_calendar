class Transaction {
  late int id;
  late String content;
  late double amount;

  Transaction({required this.id, required this.content, required this.amount});

  @override
  String toString() {
    // TODO: implement toString
    return "ID ${this.id} - Content ${this.content} - Amount ${this.amount}";
  }
}

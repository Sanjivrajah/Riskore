class Expenses {
  final String? image;
  final String? name;
  final String amount;
  final String? date;
  final String category;
  final String? loanAmount;

  Expenses({
    this.loanAmount,
    required this.category,
    this.image,
    this.name,
    required this.amount,
    this.date,
  });
}

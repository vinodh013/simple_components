class CustomerWithTotal {
  final int customerId;
  final String name;
  final double totalSales;
  final DateTime? date;

  CustomerWithTotal(
      {required this.customerId,
      required this.totalSales,
      required this.name,
      this.date});
}
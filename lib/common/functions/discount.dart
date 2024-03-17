double reduceAmount(double totalAmount,
    {double? reductionPercent, double? reductionAmount}) {
  // Validate parameters
  if (reductionPercent != null &&
      (reductionPercent <= 0 || reductionPercent > 100)) {
    throw ArgumentError(
        "Reduction percentage must be greater than 0 and not exceed 100.");
  }

  if (reductionAmount != null &&
      (reductionAmount < 0 || reductionAmount > totalAmount)) {
    throw ArgumentError(
        "Reduction amount must be non-negative and not exceed the total amount.");
  }

  // Calculate reduction based on either percentage or amount
  double percentReduction =
      reductionPercent != null ? (totalAmount * reductionPercent) / 100 : 0;
  double reducedAmount =
      totalAmount - (percentReduction + (reductionAmount ?? 0));

  // Ensure the reduced amount is not less than 0
  reducedAmount = reducedAmount < 0 ? 0 : reducedAmount;

  return reducedAmount;
}

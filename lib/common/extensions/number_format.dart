import 'package:intl/intl.dart';

var formatter = NumberFormat.currency(
  locale: 'HI',
);

final indianRupeesFormat = NumberFormat.currency(
  name: "INR",
  locale: 'en_IN',
  decimalDigits: 0, // change it to get decimal places
  symbol: '₹ ',
);

final numberFormatter = NumberFormat(
  "##,##,###",
  "en_US", // local US
);

extension RupeesFormatter on double {
  String inRupeesFormat() {
    return indianRupeesFormat.format(this);
  }

}


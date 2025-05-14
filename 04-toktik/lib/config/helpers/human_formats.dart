import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadableNumber(double number) {
    // if (number < 1000) return number.toString();
    // if (number < 1000000) return '${(number / 1000).toStringAsFixed(1)}K';
    // if (number < 1000000000) return '${(number / 1000000).toStringAsFixed(1)}M';
    // return '${(number / 1000000000).toStringAsFixed(1)}B';

    final formmatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);

    return formmatterNumber;
  }
}

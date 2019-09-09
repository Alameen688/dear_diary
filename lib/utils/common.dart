import 'package:intl/intl.dart';

formatDate(String date) {
  return new DateFormat.yMMMd("en_US").format(DateTime.parse(date));
}

import 'package:intl/intl.dart';

String formateDate(String unformattedDate) {
  DateTime date = DateFormat("MM/dd/yyyy").parse(unformattedDate);
  return DateFormat("MMM d'th'").format(date);
}

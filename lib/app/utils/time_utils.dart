import 'package:intl/intl.dart';

class TimeUtils {
  String dateForamt(DateTime dateString) {
    final formattedDate = DateFormat('MMMM d, y').format(dateString);
    return formattedDate;
  }
}

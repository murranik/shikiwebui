import 'package:intl/intl.dart';

DateTime formatDateString(String dateString) {
  dateString = dateString.replaceFirst(':', ' ').replaceAll('.', '-');
  var date = DateFormat("dd-MM-yyyy hh:mm").parse(dateString);
  return date;
}

class CommandCallInfo {
  String id;
  DateTime date;
  String guildName;
  int userId;
  String commandName;

  CommandCallInfo(
      {required this.id,
      required this.date,
      required this.guildName,
      required this.userId,
      required this.commandName});

  factory CommandCallInfo.fromMap(Map<String, dynamic> json) => CommandCallInfo(
      id: json['id'],
      date: formatDateString(json['date']),
      guildName: json['guildName'],
      userId: json['userId'],
      commandName: json['commandName']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'guildName': guildName,
      'userId': userId,
      'commandName': commandName,
    };
  }
}

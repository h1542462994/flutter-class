class TimeTable {
  TimeTable({this.id, this.userId, this.startDate, this.lasting, this.title});
  final int id; // id
  final String userId; // references to User
  final DateTime startDate; // startDate
  final int lasting; // lasting week
  final String title; // title
}
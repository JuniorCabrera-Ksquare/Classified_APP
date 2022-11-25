class Functions {
  timeAgoCalculator(String createdAt) {
    DateTime date = DateTime.now();
    date = DateTime.parse(createdAt);

    if (DateTime.now().difference(date).inSeconds > 0) {
      createdAt = (DateTime.now().difference(date).inSeconds).toString();
      createdAt = "$createdAt Seconds ago";
    }
    if (DateTime.now().difference(date).inMinutes > 0) {
      createdAt = (DateTime.now().difference(date).inMinutes).toString();
      createdAt = "$createdAt Minutes ago";
    }
    if (DateTime.now().difference(date).inHours > 0) {
      createdAt = (DateTime.now().difference(date).inHours).toString();
      createdAt = "$createdAt Hours ago";
    }
    if (DateTime.now().difference(date).inDays > 0) {
      createdAt = (DateTime.now().difference(date).inDays).toString();
      createdAt = "$createdAt Days ago";
    }
    return createdAt;
  }
}

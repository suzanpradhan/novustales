
// Function to calculate and display time difference
String calculateTimeDifference(String createdAt) {
  DateTime createdDateTime = DateTime.parse(createdAt);
  DateTime now = DateTime.now();

  Duration difference = now.difference(createdDateTime);

  if (difference.inDays > 0) {
    return '${difference.inDays}d ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours}h ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes}m ago';
  } else {
    return 'Just now';
  }
}


class Kwargs {
  final Map<String, dynamic> data;

  Kwargs(this.data);

  void printData() {
    data.forEach((key, value) {
      print('$key: $value');
    });
  }
}

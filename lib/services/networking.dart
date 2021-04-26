class NetworkHelper {

  String? load;
  String? from;
  String? until;

  NetworkHelper({this.load, this.from, this.until});

  String getFrom() {
    return '$from';
  }

  String getUntil() {
    return '$until';
  }

}
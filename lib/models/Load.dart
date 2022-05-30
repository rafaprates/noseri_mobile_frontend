class Load {
  late final String loadName;
  late bool isTracked;

  Load({required this.loadName, required this.isTracked});

  void setIsTracked() {
    isTracked = true;
  }

  void setIsUntracked() {
    isTracked = false;
  }

  bool isLoadTracked() {
    if (this.isTracked == true) {
      return true;
    }
    return false;
  }

  factory Load.fromJson(Map<String, dynamic> json) {
    return Load(
      loadName: json["load"],
      isTracked: json["isTracked"],
    );
  }
}

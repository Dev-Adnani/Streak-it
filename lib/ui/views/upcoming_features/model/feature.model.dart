class Feature {
  final String title;
  final String description;

  Feature({
    required this.title,
    required this.description,
  });

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }
}

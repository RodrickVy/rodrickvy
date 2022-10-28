class Experience {
  final String heading;
  final String time;
  final String description;
  List<String> skills;
  List<Map<String, String>> projects;


  Experience(
      {required this.heading, required this.time,required this.skills,required this.projects,required this.description});
}

class Biodata {
  String name;
  String email;
  DateTime birthDate;
  List<String> skills;
  List<Education> education;

  Biodata({
    this.name = '',
    this.email = '',
    DateTime? birthDate,
    List<String>? skills,
    List<Education>? education,
  }) : 
    this.birthDate = birthDate ?? DateTime.now(),
    this.skills = skills ?? [],
    this.education = education ?? [];
}


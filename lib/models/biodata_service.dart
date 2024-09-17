import 'biodata.dart';

class BiodataService {
  static final BiodataService _instance = BiodataService._internal();
  factory BiodataService() => _instance;
  BiodataService._internal();

  Biodata _biodata = Biodata();

  Future<void> saveBiodata(Biodata biodata) async {
    _biodata = biodata;
  }

  Future<Biodata> getBiodata() async {
    return _biodata;
  }

  Future<void> updateSkills(List<String> skills) async {
    _biodata.skills = skills;
  }

  Future<void> updateEducation(List<Education> education) async {
    _biodata.education = education;
  }
}
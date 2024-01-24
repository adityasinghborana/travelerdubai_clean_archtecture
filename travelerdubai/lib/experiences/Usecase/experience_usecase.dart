import 'package:travelerdubai/experiences/model/experience_response_model.dart';
import 'package:travelerdubai/experiences/repository/Experiences_repository.dart';

class GetExperiencesUseCase {
  final ExperiencesRepository repository;

  GetExperiencesUseCase(this.repository);

  Future<List<Experiences>> execute() {
    return repository.getExperiences();
  }
}

import 'package:travelerdubai/experiences/model/experience_response_model.dart';
import 'package:travelerdubai/experiences/remote/experiences_remote_service.dart';
import 'package:travelerdubai/tourdetails/model/tour_model.dart';
import 'package:travelerdubai/tourdetails/remote/tour_remote.dart';

abstract class ExperiencesRepository {
  Future<List<Experiences>> getExperiences();
}

@override
class ExperiencesRepositoryImpl implements ExperiencesRepository {
  final ExperienceRemoteService remote;

  ExperiencesRepositoryImpl(this.remote);

  @override
  Future<List<Experiences>> getExperiences() {
    return remote.getExperiences();
  }
}

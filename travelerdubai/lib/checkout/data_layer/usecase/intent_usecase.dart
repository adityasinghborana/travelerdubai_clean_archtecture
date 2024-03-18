

import 'package:travelerdubai/checkout/data_layer/model/request/intent_request.dart';
import 'package:travelerdubai/checkout/data_layer/model/response/intent_response.dart';

import '../repository/Intent_repository.dart';

class IntentUseCase{
  final StripeIntentRepository repository;

  IntentUseCase(this.repository);

  Future<IntentResponse> execute(
     IntentRequest data) {
    return repository.getIntent( data);
  }
}
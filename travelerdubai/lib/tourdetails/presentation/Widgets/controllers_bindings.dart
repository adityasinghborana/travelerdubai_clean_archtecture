import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../Cart/data_layer/repository/cart_repository.dart';
import '../../../Cart/data_layer/service/cart_remote.dart';
import '../../../Cart/data_layer/usecase/update_cart.dart';
import '../../timeslot_data_layer/repositories/timeslot_repository.dart';
import '../../timeslot_data_layer/service/timslot_remote.dart';
import '../../timeslot_data_layer/use_cases/timeslot_usecase.dart';
import '../../tourdetail_data_layer/Usecase/usecase.dart';
import '../../tourdetail_data_layer/remote/tour_remote.dart';
import '../../tourdetail_data_layer/repository/tour_repository.dart';
import '../../touroption_data_layer/remote/service/touroption_remote.dart';
import '../../touroption_data_layer/repository/tour_option_repository.dart';
import '../../touroption_data_layer/usecase/touroption_dynamic_data.dart';
import '../../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import '../tour_options_controller.dart';
import '../tours_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      TourOptionStaticDataController(
          GetTourOptionsStaticDataUseCase(
              TourOptionsRepositoryImpl(TourOptionRemoteService(Dio()))),
          GetTourOptionsDynamicDataUseCase(
            TourOptionsRepositoryImpl(
              TourOptionRemoteService(Dio()),
            ),
          ),
          GetTimeSlotUseCase(
            TimeSlotRepositoryImpl(
              TimeSlotRemoteService(Dio()),
            ),
          ),
          UpdateCartUseCase(
            CartRepositoryImpl(
              CartRemoteService(Dio()),
            ),
          )),
    );
    Get.put(
      TourController(
        GetCityTourUseCase(
          TourRepositoryImpl(
            TourRemoteService(
              Dio(),
            ),
          ),
        ),
      ),
      permanent: true,
    );
  }
}

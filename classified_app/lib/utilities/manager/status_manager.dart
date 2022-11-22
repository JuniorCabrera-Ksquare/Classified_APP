import 'package:classified_app/utilities/manager/alert_manager.dart';

class StatusManager {
  void manageStatus(context, bool? status, String? message) {
    switch (status) {
      case true:
        {
          AlertManager()
              .displaySnackbar(context, message ?? "Successfully Completed");
        }
        break;

      case false:
        {
          AlertManager()
              .displaySnackbar(context, message ?? "An Error Occurred");
        }
        break;

      default:
        {
          AlertManager().displaySnackbar(context, "Something Wrong Occurred");
        }
        break;
    }
  }
}

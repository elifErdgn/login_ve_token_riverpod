
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import '../models/taskmodel.dart';
import '../services/api_services.dart';

class HomeRiverpod extends ChangeNotifier {
  List<TaskModelDataNotComplated?> datas = [];
  final service = Service();
  bool isLoading = false;

  void getData(){
    isLoading = true;
    service.taskCall().then((value) {
      if(value != null && value.status == true){
        datas = value.data!.notComplated!;

        isLoading = false;
        notifyListeners();
      }
      else {
        isLoading = false;
        notifyListeners();
        Grock.snackBar(title: "Hata", description: "Bir sorun oluştu");
      }
    });
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';

import '../screens/home.dart';
import '../services/api_services.dart';


/// Butoona basıldıktan sonra çalışacak meetot
///
class LoginRiverpod extends ChangeNotifier {
  final service = Service();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final box = GetStorage();

  void fetch() {
    loadingPopup();
    service.loginCall(email: email.text, password: password.text).then((value) {
      if (value != null && value.status! == true) {
        box.write("token", value.token);
        print("Kaydedilen token ${box.read("token")}");
        Grock.back();
        Grock.toRemove(Home());
      } else {
        Grock.back();
        Grock.snackBar(
            title: "Hata",
            description: value?.message ?? "Bir sorun oluştu, terar deneyin");
      }
    });
  }
}

void loadingPopup() {
  Grock.dialog(builder: (_) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  });
}

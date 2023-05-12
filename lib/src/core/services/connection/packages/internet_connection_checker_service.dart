// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../../../common/viewModels/connection_view_model.dart';
import '../../../constants/enums/network_results_enums.dart';

class InternetConnectionCheckerService {
  InternetConnectionCheckerService._init();

  final _checker = InternetConnectionChecker();

  static final InternetConnectionCheckerService _instance =
  InternetConnectionCheckerService._init();

  static InternetConnectionCheckerService get instance => _instance;

  void listenConnection(BuildContext context) {
    _checker.onStatusChange.listen((event) {
      // internet çektiği halde yoksa diğer taraf bunu algılamıyor
      // ama bu taraf bunu algılayıp disconnected hatası veriyor
      if (event.name == 'disconnected') {
        Provider.of<ConnectionViewModel>(context, listen: false)
            .changeNetworkResult(NetworkResult.off);
      } else if (event.name == 'connected') {
        Provider.of<ConnectionViewModel>(context, listen: false)
            .changeNetworkResult(
          NetworkResult.on,
        );
      }
    });
  }

  Future<void> checkInternet(bool shouldConnect, BuildContext context) async {
    try {
      if (shouldConnect == true) {
        final result = await _checker.connectionStatus;
        if (result == InternetConnectionStatus.connected) {
          Provider.of<ConnectionViewModel>(context, listen: false)
              .changeNetworkResult(NetworkResult.on);
        } else {
          Provider.of<ConnectionViewModel>(context, listen: false)
              .changeNetworkResult(NetworkResult.off);
        }
      } else {
        Provider.of<ConnectionViewModel>(context, listen: false)
            .changeNetworkResult(NetworkResult.off);
      }
    } on SocketException catch (_) {
      Provider.of<ConnectionViewModel>(context, listen: false)
          .changeNetworkResult(NetworkResult.off);
    }
  }
}

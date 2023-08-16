import 'package:flutter/material.dart';
import '../ad_listener/ad_listener.dart';
import '../ad_request/ad_request.dart';

abstract class Ad {
  final String adUnitId;
  final AdRequest? request;
  final AdListener? listener;

  Ad({
    required this.adUnitId,
    this.request,
    this.listener,
  });

  Widget get widget => const SizedBox();
  void load();
  void show() {}
  void dispose();
}

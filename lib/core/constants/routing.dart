import 'package:flutter/material.dart';

navigateTo(context, page) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
removeTo(context, page) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => page), (Route) => false);
replaceto(context, page) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => page));

import 'package:flutter/material.dart';

void NavigateTo(context , widget) =>Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context)=> widget ,
    )
);
void NavigateToFinish(context ,widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
        builder: (context)=>widget),
        (route) => false);
import 'package:flutter/material.dart';

final roundGrey = BoxDecoration(
  color: Colors.grey[300],
  borderRadius: BorderRadius.circular(100),
);

final appBar = AppBar(
  title: const Text('Facebook Reactions'),
  centerTitle: true,
);

const likeButtonTextStyle = TextStyle(
  color: Colors.blueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);

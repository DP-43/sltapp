import 'package:flutter/material.dart';

class StatusColors {
  static Color getColor(String status) {
    switch (status) {
      case 'Submitted':     return const Color.fromARGB(255, 0, 208, 255);
      case 'Under Review':  return const Color.fromARGB(255, 249, 147, 74);
      case 'In Progress':   return const Color.fromARGB(255, 128, 0, 128);
      case 'Awaiting Info': return const Color.fromARGB(255, 34, 0, 255);
      case 'Resolved':      return const Color.fromARGB(255, 18, 177, 1);
      case 'Closed':        return const Color.fromARGB(255, 255, 0, 0);
      default:              return Colors.grey;
    }
  }
}

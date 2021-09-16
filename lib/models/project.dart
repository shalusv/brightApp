import 'package:flutter/cupertino.dart';

class Project {
  final String id;
  final String title;
  final Color customColor;
  final String status;
  final String workDesc;
  final String startDate;
  final String dueDate;
  final String completedDate;
  final int employeeId;
  final String tenderId;

  Project({
    this.id,
    this.title,
    this.customColor,
    this.status,
    this.workDesc,
    this.startDate,
    this.dueDate,
    this.completedDate,
    this.employeeId,
    this.tenderId,
  });
}

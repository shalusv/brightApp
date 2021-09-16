import 'package:flutter/cupertino.dart';

class Tender {
  final String name;
  final String id;
  final Color customColor;
  final String status;
  final String workDesc;
  final String tenderId;
  final double tenderValue;
  final String TenderReferenceNumber;
  final String tenderType;
  final double emd;
  final String publishedDate;
  final String bidSubmissionDateStart;
  final String bidSubmissionDateEnd;
  final String bidOpeningDate;
  final double boq;

  Tender({
    this.name,
    this.id,
    this.customColor,
    this.status,
    this.workDesc,
    this.tenderId,
    this.tenderValue,
    this.TenderReferenceNumber,
    this.tenderType,
    this.emd,
    this.publishedDate,
    this.bidSubmissionDateStart,
    this.bidSubmissionDateEnd,
    this.bidOpeningDate,
    this.boq,
  });
}

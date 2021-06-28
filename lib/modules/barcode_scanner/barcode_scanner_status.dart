import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  final bool isCameraAvaiable;
  final String error;
  final String barcode;
  final bool stopScanner;

  BarcodeScannerStatus(
      {this.isCameraAvaiable = false,
      this.error = "",
      this.barcode = "",
      this.stopScanner = false});

  factory BarcodeScannerStatus.available() =>
      BarcodeScannerStatus(isCameraAvaiable: true, stopScanner: false);

  factory BarcodeScannerStatus.error(String messageError) =>
      BarcodeScannerStatus(error: messageError, stopScanner: true);

  factory BarcodeScannerStatus.barcode(String barcode) =>
      BarcodeScannerStatus(barcode: barcode, stopScanner: true);

  bool get showCamera => isCameraAvaiable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}

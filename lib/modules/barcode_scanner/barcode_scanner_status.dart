import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  final bool isCameraAvaiable;
  final String error;
  final String barcode;

  CameraController? cameraController;

  BarcodeScannerStatus(
      {this.isCameraAvaiable = false,
      this.cameraController,
      this.error = "",
      this.barcode = ""});

  factory BarcodeScannerStatus.available(CameraController controller) =>
      BarcodeScannerStatus(
          isCameraAvaiable: true, cameraController: controller);

  factory BarcodeScannerStatus.error(String messageError) =>
      BarcodeScannerStatus(error: messageError);

  factory BarcodeScannerStatus.barcode(String barcode) =>
      BarcodeScannerStatus(barcode: barcode);

  bool get showCamera => isCameraAvaiable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}
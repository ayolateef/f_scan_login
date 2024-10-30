// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class QRScannerScreen extends StatefulWidget {
//   final Function(String) onScanned;
//
//   const QRScannerScreen({required this.onScanned, super.key});
//
//   @override
//   State<StatefulWidget> createState() => _QRScannerScreenState();
// }
//
// class _QRScannerScreenState extends State<QRScannerScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       if (scanData.code != null) {
//         widget.onScanned(scanData.code!);
//         controller.pauseCamera();
//         Navigator.of(context).pop();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Scan QR Code')),
//       body: QRView(
//         key: qrKey,
//         onQRViewCreated: _onQRViewCreated,
//       ),
//     );
//   }
// }

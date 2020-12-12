// import 'package:flutter/material.dart';
// import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
// import 'package:ywu/ui/styles/Styles.dart';
// class PdfPage extends StatelessWidget {
//
// //  PDFDocument document=PDFDocument();
//
// var title="";
// var url="";
//
//
// PdfPage({this.title,this.url});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title,style: Styles().TitleTextStyle16White,),),
//       body: Container(
//
//         child: FutureBuilder(
//
//             future: PDFDocument.fromURL('$url'),
//             builder: (bc,snapsot){
//
// return Center(
//     child: snapsot.data==null
//         ? Center(child: CircularProgressIndicator())
//         : PDFViewer(
//
// showNavigation: true,
//         document: snapsot.data));
//
//         }),
//
//       ),
//
//     );
//   }
// }

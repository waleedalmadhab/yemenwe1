import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_link_preview/flutter_link_preview.dart';
class customUrlPreview extends StatelessWidget {

  var url;
  customUrlPreview({this.url});

  @override
  Widget build(BuildContext context) {
    // return FlutterLinkPreview(
    //   url: url,
    //   builder: (info) {
    //     if (info == null) return const SizedBox();
    //     if (info is WebImageInfo) {
    //       return CachedNetworkImage(
    //         imageUrl: info.image,
    //         fit: BoxFit.contain,
    //       );
    //     }
    //
    //     final WebInfo webInfo = info;
    //     if (!WebAnalyzer.isNotEmpty(webInfo.title)) return const SizedBox();
    //     return Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         color: const Color(0xFFF0F1F2),
    //       ),
    //       padding: const EdgeInsets.all(10),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           Row(
    //             children: <Widget>[
    //               CachedNetworkImage(
    //                 imageUrl: webInfo.icon ?? "",
    //                 imageBuilder: (context, imageProvider) {
    //                   return Image(
    //                     image: imageProvider,
    //                     fit: BoxFit.contain,
    //                     width: 30,
    //                     height: 30,
    //                     errorBuilder: (context, error, stackTrace) {
    //                       return const Icon(Icons.link);
    //                     },
    //                   );
    //                 },
    //               ),
    //               const SizedBox(width: 8),
    //               Expanded(
    //                 child: Text(
    //                   webInfo.title,
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           if (WebAnalyzer.isNotEmpty(webInfo.description)) ...[
    //             const SizedBox(height: 8),
    //             Text(
    //               webInfo.description,
    //               maxLines: 5,
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //           ],
    //           if (WebAnalyzer.isNotEmpty(webInfo.image)) ...[
    //             const SizedBox(height: 8),
    //             CachedNetworkImage(
    //               imageUrl: webInfo.image,
    //               fit: BoxFit.contain,
    //             ),
    //           ]
    //         ],
    //       ),
    //     );
    //   },
    // );
  }



}

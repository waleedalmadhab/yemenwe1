import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class LoadingListShimmer extends StatelessWidget {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              enabled: _enabled,
              child: ListView.builder(
                itemBuilder: (_, __) => Container(

                  decoration: BoxDecoration(
                  //  color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1,color: Colors.grey),
                  ),
                  height: 150,
                  margin: EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all( 5.0),
                  child: Column(
                   children: <Widget>[

                     Expanded(
                       child: Row(
                         children: <Widget>[

                           Expanded(
                             child:
                             Container(
                               decoration: BoxDecoration(
                               //    color: Colors.grey[300],
                                   borderRadius: BorderRadius.circular(5)
                               ),


                               margin: EdgeInsets.symmetric(horizontal: 5),
                               height: 50,

                               child: Directionality(
                                 textDirection: TextDirection.rtl,
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: <Widget>[
                                     Container(
                                       width: double.infinity,
                                       height: 8.0,
                                       color: Colors.white,
                                     ),
                                     const Padding(
                                       padding: EdgeInsets.symmetric(vertical: 2.0),
                                     ),

                                     Container(
                                       width: w/2,
                                       height: 8.0,
                                       color: Colors.white,
                                     ),
                                     const Padding(
                                       padding: EdgeInsets.symmetric(vertical: 2.0),
                                     ),




                                   ],

                                 ),
                               ),

                             ),
                           ),
                           Container(

                             width: 40,
                             height: 50,
                             decoration: BoxDecoration(
                               color: Colors.grey[300],
                               borderRadius: BorderRadius.circular(30)
                             ),
                           )

                         ],

                       ),
                     )

,

                     Expanded(
                       flex: 2,
                       child: Container(height: 80,
                         margin: EdgeInsets.all(5),
                         decoration: BoxDecoration(
                          //   color: Colors.grey[300],
                             borderRadius: BorderRadius.circular(5)
                         ),

                         width: double.infinity,
child:                            Container(
  decoration: BoxDecoration(
    //    color: Colors.grey[300],
      borderRadius: BorderRadius.circular(5)
  ),


  margin: EdgeInsets.symmetric(horizontal: 5),
  height: 50,

  child: Directionality(
    textDirection: TextDirection.rtl,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 8.0,
          color: Colors.white,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0),
        ),

        Container(
          width: w/2,
          height: 8.0,
          color: Colors.white,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0),
        ),


        Container(
          width: w/3,
          height: 8.0,
          color: Colors.white,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0),
        ),
        Container(
          width: 40.0,
          height: 8.0,
          color: Colors.white,
        ),

      ],

    ),
  ),

),

                       ),
                     )

,
                     Expanded(
                       flex: 1,
                       child: Row(
                         children: <Widget>[

Spacer(),
                           Container(

                             width: 40,
                             height: 40,
                             decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(20)
                             ),
                           ),
                           Spacer(),

                           Container(

                             width: 40,
                             height: 40,
                             decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(20)
                             ),
                           ),
                           Spacer(),

                           Container(

                             width: 40,
                             height: 40,
                             decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(20)
                             ),
                           ),
                           Spacer(),




                         ],

                       ),
                     )


                   ],
                  ),
                ),
                itemCount: 6,
              ),
            ),


      ),])
    );
  }
}

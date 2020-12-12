import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/store/FilterProducts.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/noInternetConnection.dart';
import 'package:yemenwe/utils/internetConnection.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  var type="cat";
dynamic selected;

geturl(String type){

  switch(type){

    case "cat":
      return urls.storeAllCats;
      break;
    case "seller":
      return urls.get_seller;
      break;
    case "gov":
      return urls.get_gov;
      break;

  }
}
getname(String type){

  switch(type){

    case "cat":
      return 'name';
      break;
    case "seller":
      return 'sale_name';
      break;
    case "gov":
      return 'name_ar';
      break;

  }
}



  @override
  Widget build(BuildContext context) {
    var url="";
    return Scaffold(
    body: FutureBuilder(

        initialData: false,
        future: InternetConnection.instance.isConnected(),
        builder: (bc,connected){


          return   connected.data!=null &&connected.data? SingleChildScrollView(child: Column(


        children: <Widget>[

          Container(height: 100,),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              RaisedButton(
                  color:type=="cat"? colors.primary:colors.white,
                  child: Text("الفئة ",style: Styles().consualtionStatisc(fsize: 12,mcolor: type=="cat"? colors.white:colors.primary),)
                  ,
                  onPressed: (){
                    setState(() {
                      selected=null;
                      type="cat";
                    });


                  }),
              RaisedButton(
                  color: type=="seller"? colors.primary :colors.white,

                  child: Text("البائع ",style: Styles().consualtionStatisc(fsize: 12,mcolor: type=="seller"? colors.white:colors.primary),)
                  ,
                  onPressed: (){
                    setState(() {
                      selected=null;

                      type="seller";
                    });


                  }),
              RaisedButton(
                  color: type=="gov"? colors.primary:colors.white,

                  child: Text("المحافظة ",style: Styles().consualtionStatisc(fsize: 12,mcolor: type=="gov"? colors.white:colors.primary),)
                  ,
                  onPressed: (){
                    setState(() {
                      selected=null;

                      type="gov";
                    });


                  }),


            ],),

          FutureBuilder(

              future: getResponseData().getData(url: geturl(type),),

              builder: (bc,snapshot){

                if(snapshot.data!=null) {

                  try {

                    var data = json.decode(snapshot.data.toString());

                    var d = data['data'] as List;
//print(d);
                    if(selected==null) {
                      selected = d[0]['id'];
                    }



                    return  d!=null?  DropdownButton(

                        value:selected ,



                        items: d.map((e) {

//print(e);

                          return DropdownMenuItem(

                              value: e['id'],

                              child: Text( e[getname(type)].toString()));



                        }).toList(), onChanged: (val){



                      setState(() {

                        selected=val;


                      });



                    }):Container();



                  } catch (e) {}

                }



                else return Container(

                    width: 50,
                    height: 50,
                    child: SpinKitSquareCircle(color: colors.primary,));



              })
          ,

          GestureDetector(
            onTap: (){

              if(type=="cat"){
                Get.to(FilterProducts(type: {"categories":selected},));
              }
              else if(type=="gov"){
                Get.to(FilterProducts(type: {"govs":selected},));

              }
              else if(type=="seller"){
                Get.to(FilterProducts(type: {"seller_id":selected},));

              }


//             getResponseData().getData(url: urls().get_product_by_categories,data: {"categories":selected}).then((value) {
//
// //var j=json.decode(value.data.toString());
// var d=value.data['data'] as List;
// print(d.length);
//               print(value.data['data']);
//             });


            },

            child: Card(
              child: Container(
                //   width: 200,
                //   height: 40,
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),

                child: Text("بحث",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.primary),),
              ),
            ),
          )


        ],
      ),):Center(
            child: noInternetConnection(),
          );

    })

    );
  }
}

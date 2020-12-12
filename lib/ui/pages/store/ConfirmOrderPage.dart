import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/providers/CartProvider.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/widgets/textForm.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/Toast.dart';
class ConfirmOrderPage extends StatefulWidget {
  @override
  _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {

  dynamic selectedGov;
  dynamic selectedDistic;

  List<dynamic> govs=[];
  List<dynamic> distinicts=[];

getGovs()async{

  getResponseData().getData(url: urls.get_gov).then((value) {

   // var data = json.decode(value.data.toString());

    var d = value.data['data'] as List;
  //  print(d);
govs.clear();
d.forEach((element) {

  govs.add({"id":element['id'],"name":element['name_ar']});

});
setState(() {
  selectedGov=govs[0]['id'];
  getDis();
});
print("govs length=${govs.length}");
  });

}
getDis()async{

  getResponseData().getData(url: urls.get_district,data: {"gov_id":selectedGov}).then((value) {

   // var data = json.decode(value.data.toString());

    var d = value.data['data'] as List;
  //  print(d);
distinicts.clear();
d.forEach((element) {

  distinicts.add({"id":element['id'],"name":element['name_ar']});

});
setState(() {
  selectedDistic=distinicts[0]['id'];
});
print("govs length=${distinicts.length}");
  });

}

TextEditingController moreinfotextEditingController=TextEditingController();
TextEditingController nametextEditingController=TextEditingController();
TextEditingController phonetextEditingController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGovs();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(appBar: AppBar(),
      body: SingleChildScrollView(
        child: Wrap(
          children: <Widget>[

textForm(title: "اسم المستلم",icon: Icons.person_outline,controller: nametextEditingController,),
textForm(title: "رقم هاتف المستلم",isnumber: true,icon: Icons.call,controller: phonetextEditingController,),

Row(children: <Widget>[
  Expanded(child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Text("المحافظة:",textAlign: TextAlign.right,))),

  Expanded(

    flex: 2,
    child:      govs.length!=null&&govs.length>0?     DropdownButton(
      isExpanded: true,
  //  isExpanded: true,

        value:selectedGov ,



        items: govs.map((e) {

          //      print(e);

          return DropdownMenuItem(

              value: e['id'],

              child: Text( e['name'].toString(),overflow: TextOverflow.ellipsis,));



        }).toList(), onChanged: (val){



      setState(() {

        selectedGov=val;
        getDis();
      });



  }):Container(),
  ),


],),

Row(children: <Widget>[

  Expanded(
    child:
    Container(
        margin: EdgeInsets.symmetric(horizontal: 10),

        child: Text("المديرية:",textAlign: TextAlign.right,)),
  ),

  Expanded(
    flex: 2,
    child:        distinicts.length!=null&&distinicts.length>0?     DropdownButton(
      isExpanded: true,

      value:selectedDistic ,



      items: distinicts.map((e) {

        //      print(e);

        return DropdownMenuItem(

            value: e['id'],

            child: Text( e['name'].toString(),overflow: TextOverflow.ellipsis,),);



      }).toList(), onChanged: (val){



    setState(() {

      selectedDistic=val;
    });



  }):Container(),
      ),

],)

,

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  Container(
                      width: MQSize.width,
                      child: Text("تفاصيل العنوان:",textAlign: TextAlign.right,)),


                  TextFormField(
                    controller: moreinfotextEditingController,
                    maxLines: null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1,color: colors.primary)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1,color: colors.primary)),
                      border: InputBorder.none,


                      hintText: "تفاصيل العنوان مثلا - العزلة - الشارع",contentPadding: EdgeInsets.symmetric(horizontal: 10)
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: MQSize.width,
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: RaisedButton(
                textColor: colors.white,
                color: colors.primary,
                onPressed: (){
                  if(moreinfotextEditingController.text.length>3) {
                    print(selectedGov);
                    print(selectedDistic);
                    print(moreinfotextEditingController.text);
                    getResponseData().getDataWithToken(url: urls.confirm_order,token: TokenProvider.token,data: {"gov_id":selectedGov,"district_id":selectedDistic,"more_address_info":moreinfotextEditingController.text,"customer_name":nametextEditingController.text,"phone":phonetextEditingController.text}).then((value) {

                      print(value.data);
                   //   var j=json.decode(value.data.toString());
                      if(value.data['data']!=null) {
                        var d = value.data['data'];

if(d!=null){

  moreinfotextEditingController.clear();
  nametextEditingController.clear();
  phonetextEditingController.clear();
  Provider.of<CartProvider>(context,listen: false).update();

}
                      }
                      mToast().show(context,msg: value.data['msg']);
                    });
                  }else{

                    mToast().show(context,msg: "يجب إدخال عنوان صحيح");
                  }
                },

              child: Text("تأكيد"),
              ),
            )






          ],


        ),
      ),
      ),
    );
  }
}

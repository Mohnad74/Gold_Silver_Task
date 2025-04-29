import 'package:flutter/material.dart';
import 'package:gold_silver_task/network/api_service.dart';

class Mainscreen extends StatefulWidget  {
  const Mainscreen ({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGoldPrice();
    getSilverPrice();
  }

  @override
  Widget build(BuildContext context) {
    getGoldPrice();
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('TODAY',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  shadows: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2, 2),
                        blurRadius: 5
                    )
                  ]
              )),
              SizedBox(width: 5),
              Text('PRICE',
                style: TextStyle(
                    color: Colors.orange[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    shadows: [
                      BoxShadow(
                          color: Colors.yellow[600]!,
                          offset: Offset(1, 2),
                          blurRadius: 5
                      )
                    ]
                ),
              )
            ],
          ),
        ),

      ),

      body: Container(
        padding: const EdgeInsets.only(top: 50, right: 10, left: 10, bottom: 10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset('assets/images/gold.png',
                height: MediaQuery.of(context).size.height/6,
                width: MediaQuery.of(context).size.width/2.5,),

                SizedBox(height: 20,),

                Text('GOLD',
                style: TextStyle(
                  color: Colors.orange[700],
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width/8,
                  shadows: [
                    BoxShadow(
                      color: Colors.yellow[600]!,
                      offset: Offset(1, 2),
                      blurRadius: 5
                    )
                  ]
                ),),

                SizedBox(height: 10,),

                Text('$gold_I💲',style: TextStyle(
                    color: Colors.orange[700],
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width/16,
                ),),
              ],
            ),

            Column(
              children: [
                Image.asset('assets/images/silver.png',
                  height: MediaQuery.of(context).size.height/6,
                  width: MediaQuery.of(context).size.width/2.5,),

                SizedBox(height: 20,),

                Text('SILVER',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width/8,
                      shadows: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 5
                        )
                      ]
                  ),),

                SizedBox(height: 10,),

                Text('$silver_I💲',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width/16,
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double? gold_D;
  int? gold_I;

  double? silver_D;
  int? silver_I;

  getGoldPrice(){
    DioHelper.getData('XAU/USD/').then((value){
      setState(() {
        gold_D = value.data['price'];
        gold_I = gold_D!.round();
      });
    }).catchError((error){
      print(error.toString());
    });

  }

  getSilverPrice(){
    DioHelper.getData('XAG/USD/').then((value){
      setState(() {
        silver_D = value.data['price'];
        silver_I = silver_D!.round();
      });
    }).catchError((error){
      print(error.toString());
    });

  }
}

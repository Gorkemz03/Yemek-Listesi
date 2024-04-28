import 'package:flutter/material.dart';
import 'package:yemek_menusu/Yemekler.dart';

class detay extends StatefulWidget {

  late Yemekler yemek;

  detay({required this.yemek});


  @override
  State<detay> createState() => _detayState();
}

class _detayState extends State<detay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(widget.yemek.yemek_adi),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.yemek.yemek_resim}"),

            Text("${widget.yemek.yemek_fiyat} \u{20BA}",style:TextStyle(fontSize: 20,color: Colors.indigoAccent),),

            SizedBox(
              width: 150,
              height: 200,
              child: SizedBox(
                height: 100,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    print("${widget.yemek.yemek_adi} sipariş verildi.");
                  },
                  child: Text("Sipariş Ver", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),

            )
          ],
        ),
      )

    );
  }
}


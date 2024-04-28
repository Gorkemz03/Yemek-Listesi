import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemek_menusu/detay.dart';

import 'Yemekler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Yemekler>> yemekleriGetir() async {
    var yemekListesi = <Yemekler>[];

    var y1 = Yemekler(1, "Hamburger", "hamburger.jpeg", 19.99);
    var y2 = Yemekler(2, "Pizza", "pizza.jpeg", 25.99);
    var y3 = Yemekler(3, "Döner", "doner.jpeg", 10.99);
    var y4 = Yemekler(4, "Kebap", "kebap.jpeg", 15.99);
    var y5 = Yemekler(5, "Kuru Fasulye", "kuru.jpg", 9.99);
    var y6 = Yemekler(6, "Mercimek Çorbası", "mercimek.jpg", 3.99);
    var y7 = Yemekler(7, "Kola", "kola.jpeg", 1.99);
    var y8 = Yemekler(8, "Ayran", "ayran.jpeg", 0.99);
    var y9 = Yemekler(9, "Baklava", "baklava.jpg", 30.99);
    var y10 = Yemekler(10, "Sütlaç", "sutlac.jpg", 25.99);

    for (var yemek in [y1, y2, y3, y4, y5, y6, y7, y8, y9, y10]) {
      yemekListesi.add(yemek);
    }
    return yemekListesi;

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("Yemek Menüsü"),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var yemekListesi = snapshot.data;

            return ListView.builder(
                itemCount: yemekListesi?.length,
                itemBuilder: (context,indeks){
                  var yemek = yemekListesi?[indeks];

                  return Card(
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(
                            width: 120,
                            height: 150,
                            child: Image.asset("resimler/${yemek?.yemek_resim}"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(yemek!.yemek_adi,style:TextStyle(fontSize: 25) ,),
                            SizedBox(height: 50,),
                            Text("${yemek.yemek_fiyat} \u{20BA}",style:TextStyle(fontSize: 20,color: Colors.indigoAccent),),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => detay(yemek: yemek)));
                            },
                            child: Icon(Icons.arrow_forward_ios_sharp))
                      ],
                    ),
                  );
                }
            );

          }else{
            return Center();
          }
        },
      ),

    );
  }
}

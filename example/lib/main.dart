import 'package:fitted_gridview/fitted_gridview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fitted GridView',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            separatorBuilder: (context, index) => const SizedBox(height: 14,),
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                ),
                child: FittedGridView(
                  maxItemDisplay: 4,
                  itemCount: index+1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  remainingItemsOverlay: (remaining) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        color: Colors.grey.withOpacity(0.7),
                        alignment: Alignment.center,
                        child: Text("+$remaining",style: const TextStyle(color: Colors.white),),
                      ),
                    );
                  },

                ),
              );
            },
          ),
        )
    );
  }
}

final List<String> images = [
  "https://cdn.pixabay.com/photo/2018/01/20/22/53/war-3095526_1280.png",
  "https://randomwordgenerator.com/img/picture-generator/57e1d1434954aa14f1dc8460962e33791c3ad6e04e50744172297ed29348c6_640.jpg",
  "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://randomwordgenerator.com/img/picture-generator/54e7d043435ba914f1dc8460962e33791c3ad6e04e507441722872d5934dc2_640.jpg",

  "https://cdn.pixabay.com/photo/2018/01/20/22/53/war-3095526_1280.png",
  "https://randomwordgenerator.com/img/picture-generator/57e1d1434954aa14f1dc8460962e33791c3ad6e04e50744172297ed29348c6_640.jpg",
  "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://randomwordgenerator.com/img/picture-generator/54e7d043435ba914f1dc8460962e33791c3ad6e04e507441722872d5934dc2_640.jpg",
];
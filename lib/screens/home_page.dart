import 'package:favorite_app/provider/favorite_provider.dart';
import 'package:favorite_app/screens/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const FavoritePage()));
          }, icon: const Icon(Icons.favorite))
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context,index){
          return  Consumer<FavoriteItemProvider>(builder: (key,value,child){
            return ListTile(
              onTap:(){
                if(value.selectedItem.contains(index)){
                  value.removeFavorite(index);
                }else{
                  value.addFovorite(index);
                }
              } ,
              title: Text('Item ${index+1}'),
              trailing: value.selectedItem.contains(index) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border_outlined),
            );
          });
        },
      )
    );
  }
}

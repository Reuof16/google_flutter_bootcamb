import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CatModel.dart';

class FavoriteScreen extends StatefulWidget {


  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  bool isEmpty=false;

  List<CatModel> favorites=[];
  @override
  Widget build(BuildContext context) {
    return  Builder(
        builder: (context) {
          favorites.clear();
          catList.forEach((element)
          {
            if(element.isFavorite == true)
            {
              favorites.add(element);
            }
          });
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children:
              [
                if(favorites.length > 0)
                  Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index){
                          return favoriteItem(favorites[index]);
                        },
                        separatorBuilder: (context,index)=>SizedBox(height: 10,),
                        itemCount: favorites.length),
                  ),

                if(favorites.length == 0)
                  Center(
                    child: Text(
                      'There is no cat in favorite!',
                      style: TextStyle(
                        fontFamily: 'Kalam',
                        fontSize: 20,
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
    );
  }

  Widget favoriteItem(CatModel model)=>Dismissible(
    key: Key(model.catIndex.toString()),
    onDismissed: (direction)
    {

      catList[model.catIndex].isFavorite=!catList[model.catIndex].isFavorite;
    },
    child: Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(8),
      child: Row(
        children:
        [
          Image(
            image: AssetImage(model.imgPath),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              '${model.catName}',
              style: TextStyle(
                fontSize: 20,
                height: 1.1,
                fontFamily: 'Kalam',
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

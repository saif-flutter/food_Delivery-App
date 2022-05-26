

import 'package:task/Model/item_model.dart';

class DataController{
  static List <ItemModel> getAllMenu()
  {
    var menus = <ItemModel>[];
    var data1= ItemModel(image: 'assets/foodImages/offer.png', title: 'offers');
    var data2= ItemModel(image: 'assets/foodImages/sarilankan.png', title: "Sri Lankan");
    var data3= ItemModel(image: 'assets/foodImages/italian.png', title: 'italian');
    var data4= ItemModel(image: 'assets/foodImages/indian.png', title: 'indian');
    menus.add(data1);
    menus.add(data2);
    menus.add(data3);
    menus.add(data4);


      return menus;

  }

  static List <ItemModel> getMostPopular()
  {
    var mostPopular = <ItemModel>[];
    var data5= ItemModel(image:  'assets/foodImages/dish1.png', title: 'Minute by tuk tuk',);
     var data6= ItemModel(image: 'assets/foodImages/dish2.png', title: "Café de Noir");
     var data7= ItemModel(image: 'assets/foodImages/dish3.png', title: 'Bakes by Tella');

    mostPopular.add(data5);
     mostPopular.add(data6);
     mostPopular.add(data7);



    return mostPopular;

  }





static List <ItemModel> getPopular()
{
var popular= <ItemModel> [];

var data8= ItemModel(image: "assets/foodImages/pizza.png", title: 'Café De Bambaa');
var data9= ItemModel(image: 'assets/foodImages/burger.png', title: "Burger by Bella");
popular.add(data8);
popular.add(data9);

return popular;

}



  static List <ItemModel> getRecent()
  {
    var recentItem= <ItemModel> [];

    var recent1= ItemModel(image: 'assets/foodImages/westernFood.png', title: 'Mulberry Pizza by Josh');
    var recent2= ItemModel(image: 'assets/foodImages/chye.png', title: "Barita");
    var recent3= ItemModel(image: 'assets/foodImages/italianFood.png', title: 'Pizza Rush Hour');

    recentItem.add(recent1);
    recentItem.add(recent2);
    recentItem.add(recent3);
    return recentItem;
  }

}


import 'package:ecommerce/CustomWidgets/CustomTextField.dart';
import 'package:ecommerce/CustomWidgets/customSearchField.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          CustomSearchField(),
          SizedBox(height: 20,),
          Image.asset("assets/images/shopping.jpg",),
          SizedBox(height: 20,),

          Text("Popular categories",style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal),)
          ,SizedBox(height: 15,),
          SizedBox(
            height: 65,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context,index){
                  return CircleAvatar(
                    backgroundColor: AppColors.kPrimaryColor,
                    foregroundColor: AppColors.kWhiteColor,
                    child: Icon(categories[index].icon),
                  );
                },
                ),
          )

        ]),
    );
  }
}
List<category> categories=[
  category(icon: Icons.sports, text: "sports")
  ,category(icon: Icons.tv, text: "elctronices")
  ,category(icon: Icons.collections, text: "collections")
  ,category(icon: Icons.book, text: "books")
  ,category(icon: Icons.games, text: "games")
];

class category{
  final IconData icon;
  final String text;

  category({required this.icon, required this.text});

}

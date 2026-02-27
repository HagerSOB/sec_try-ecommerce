import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(7),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kWhiteColor,
                  child: Icon(size: 40,categories[index].icon),
                ), Text(categories[index].text),

              ],
            ),
          );
        },
      ),
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

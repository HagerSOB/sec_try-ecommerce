import 'package:ecommerce/CustomWidgets/custom-evaButton.dart';
import 'package:ecommerce/CustomWidgets/custom_cached_image.dart';
import 'package:ecommerce/constains.dart';
import 'package:ecommerce/core/product_card.dart';
import 'package:ecommerce/core/products-list.dart';
import 'package:ecommerce/views/auth/modles/getUserDataModle.dart';
import 'package:ecommerce/views/home/widgets/categoriesList.dart';
import 'package:ecommerce/CustomWidgets/customSearchField.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState(){
    PaymentData.initialize(
      apiKey: Cons.PayAPIK, // Required: Found under Dashboard -> Settings -> Account Info -> API Key
      iframeId: Cons.IFrameId, // Required: Found under Developers -> iframes
      integrationCardId: Cons.IntegrationCardId, // Required: Found under Developers -> Payment Integrations -> Online Card ID
      integrationMobileWalletId: Cons.IntegrationMobileWalletId, // Required: Found under Developers -> Payment Integrations -> Mobile Wallet ID

      // Optional User Data
      userData: UserData(
        email: widget.userModel.email!, // Optional: Defaults to 'NA'
        name: widget.userModel.name!, // Optional: Defaults to 'NA'
      ),

      // Optional Style Customizations
      style: Style(
        primaryColor: Colors.blue, // Default: Colors.blue
        scaffoldColor: Colors.white, // Default: Colors.white
        appBarBackgroundColor: Colors.blue, // Default: Colors.blue
        appBarForegroundColor: Colors.white, // Default: Colors.white
        textStyle: TextStyle(), // Default: TextStyle()
        buttonStyle: ElevatedButton.styleFrom(), // Default: ElevatedButton.styleFrom()
        circleProgressColor: Colors.blue, // Default: Colors.blue
        unselectedColor: Colors.grey, // Default: Colors.grey
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
          children: [
SizedBox(height: 15),
        const CustomSearchField(),
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          "assets/images/shopping.jpg",
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Popular categories",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 15,
        ),
        const CategoriesList(),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Recently Products",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
        ),
        ProductList()
      ]),
    );
  }
}



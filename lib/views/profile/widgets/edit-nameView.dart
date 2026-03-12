import 'package:ecommerce/CustomWidgets/CustomTextField.dart';
import 'package:ecommerce/CustomWidgets/custom-evaButton.dart';
import 'package:ecommerce/CustomWidgets/custom-icon.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/core/Methods/custom-appBar.dart';
import 'package:flutter/material.dart';

class EditNameview extends StatelessWidget {
  const EditNameview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, "Edit Name"),
      body: Column(children: [
        SizedBox(height: 20,),
        CustomTextField(hintText: 'Edit Name', onChanged: (String) {},),
        SizedBox(height: 20,),
        CustomEvaButton(Lable: 'Edit',)
      ],),
    );
  }

}

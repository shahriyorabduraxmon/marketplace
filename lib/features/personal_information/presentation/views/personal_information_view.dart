import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/core/services/local_storage/storage_keys.dart';
import 'package:marketplace/core/services/local_storage/storage_repository.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/core/utils/space.dart';
import 'package:marketplace/features/common/show_message/show_mesasge.dart';
import 'package:marketplace/features/common/widgets/custom_button.dart';
import 'package:marketplace/features/common/widgets/custom_text_field.dart';
import 'package:marketplace/features/order_history/presentation/widgets/order_history_card.dart';

class PersonalInformationView extends StatefulWidget {
  const PersonalInformationView({super.key});

  @override
  State<PersonalInformationView> createState() => _PersonalInformationViewState();
}

class _PersonalInformationViewState extends State<PersonalInformationView> {

  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: StorageRepository.getString(StorageKeys.firstName, defValue: ''));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        toolbarHeight: he(56),
        backgroundColor: AppColors.cardColor,
        centerTitle: true,
        title: Text(
          "Personal Information",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColors.textColor,
              fontWeight: FontWeight.w800,
              fontSize: 18),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(
              left: wi(12),
              right: wi(12),
              top: MediaQuery.paddingOf(context).top,
              bottom: he(100)),
        child: Column(
          children: [
            verticalSpace(24),
            CustomTextField(
              controller: controller,
              hint: "Enter your name",
              label: "Your name",
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: wi(12),
          right: wi(12),
          top: he(16),
          bottom: he(16),
        ),
        child: CustomButton(
          onTap: (){
            if(controller.text.isNotEmpty){
              StorageRepository.putString(StorageKeys.firstName, controller.text);
              context.pop(controller.text);
            }else{
              ShowMessage.showErrorMessage(context, "You have not entered your name.");
            }
          },
          text: 'Ordering',
        ),
      ),
    );
  }
}

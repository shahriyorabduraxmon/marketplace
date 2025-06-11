import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/core/navigation/routs_contact.dart';
import 'package:marketplace/core/services/local_storage/storage_keys.dart';
import 'package:marketplace/core/services/local_storage/storage_repository.dart';
import 'package:marketplace/core/services/theme_service/theme_service.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/core/utils/space.dart';
import 'package:marketplace/features/common/show_message/show_mesasge.dart';
import 'package:marketplace/features/common/widgets/custom_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final ValueNotifier<String> nameCtr;

  @override
  void initState() {
    nameCtr = ValueNotifier(StorageRepository.getString(StorageKeys.firstName, defValue: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: EdgeInsets.only(
            left: wi(16),
            right: wi(16),
            top: MediaQuery.paddingOf(context).top + he(16),
            bottom: he(100)
        ),
        child: Column(
          children: [
            SizedBox(
              height: he(240),
              child: Center(
                child: ValueListenableBuilder(
                  valueListenable: nameCtr,
                  builder: (context, name, _){
                    return Text(
                      name.isNotEmpty ? "Welcome\n$name" : "You have not entered a name yet.",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomButton(
                    onTap: (){
                      context.pushNamed(RoutsContact.personalInformation).then((value){
                        if(value != null){
                          ShowMessage.showSuccessMessage(context, "Your name has been successfully saved.");
                          nameCtr.value = value as String;
                        }
                      });
                    },
                    text: 'Personal Information',
                    color: AppColors.cardColor,
                    textColor: AppColors.textColor,
                  ),
                  verticalSpace(16),
                  CustomButton(
                    onTap: (){
                      context.pushNamed(RoutsContact.orderHistory);
                    },
                    text: 'Order history',
                    color: AppColors.cardColor,
                    textColor: AppColors.textColor,
                  ),
                  verticalSpace(16),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(wi(12)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Dark Mode',
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16
                              ),
                            ),
                          ),
                          CupertinoSwitch(
                            value: AppColors.isDarkMode,
                            onChanged: (value){
                              context.read<ThemeProvider>().setTheme(value ? AppThemeMode.dark : AppThemeMode.light);
                            },
                            activeTrackColor: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

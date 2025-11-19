import 'package:flutter/material.dart';
import 'package:khsomati/business_logic/cubit/localization/localization_cubit.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:khsomati/constants/app_size.dart';
import 'package:khsomati/constants/app_colors.dart';
import 'package:khsomati/constants/translation/app_translation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutTheApp extends StatefulWidget {
  const AboutTheApp({super.key});

  @override
  State<AboutTheApp> createState() => _AboutTheAppState();
}

class _AboutTheAppState extends State<AboutTheApp> {
  String appVersion = '';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    // استخدام نظام الترجمة عبر LocalizationCubit
    final t = context.read<LocalizationCubit>().translate;

    return Scaffold(
      appBar: AppBar(
        title: Text(t(AppTranslation.aboutAppTitle)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F7F7), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            shadowColor: Colors.teal.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      t(AppTranslation.aboutAppTitle),
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: AppSize.width * 0.07,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    t(AppTranslation.aboutAppDescription),
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: AppSize.width * 0.045,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    t(AppTranslation.appFeatures),
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: AppSize.width * 0.055,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "• ${t(AppTranslation.featureDailyDiscounts)}",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: AppSize.width * 0.045,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "• ${t(AppTranslation.featureNewOffers)}",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: AppSize.width * 0.045,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "• ${t(AppTranslation.featureNotifications)}",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: AppSize.width * 0.045,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    t(AppTranslation.appGoal),
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: AppSize.width * 0.045,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (appVersion.isNotEmpty)
                    Center(
                      child: Text(
                        "${t(AppTranslation.aboutAppTitle)}: $appVersion",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: AppSize.width * 0.04,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

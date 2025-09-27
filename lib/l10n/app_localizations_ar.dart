// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get pleaseFillData => 'برجاء ادخال البيانات';

  @override
  String get userName => 'اسم المستخدم';

  @override
  String get password => 'باسورد';

  @override
  String get login => 'تسجيل دخول';

  @override
  String get register => 'تسحيل';

  @override
  String get forgetYourPassword => 'نسيت كلمة المرور الخاصه بك';

  @override
  String get forgetPassword => 'نسيت كلمة المرور';

  @override
  String get doYouHaveAccount => 'هل لديك ايميل';

  @override
  String get categories => 'الفئات';

  @override
  String get home => 'الرئيسية';

  @override
  String get description => 'الوصف';

  @override
  String get cart => 'السلة';

  @override
  String get noData => 'لا يوجد بيانات';

  @override
  String get totalPrice => 'السعر الكامل';

  @override
  String get addToCart => 'اضافة الي السلة';

  @override
  String get searchProduct => 'البحث عن منتج ';

  @override
  String get allProducts => 'كل المنتجات';

  @override
  String get retry => 'اعادة المحاولة';

  @override
  String get send => 'ارسال';
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double defaultScreenWidth = 400;
double defaultScreenHeight = 810;
double screenWidth = defaultScreenWidth;
double screenHeight = defaultScreenHeight;
double defaultSizeIcon = 24;
int defaultTimer = 30;

class AppSizes {
  static double appScreenWidth = screenWidth;
  static double appScreenHeight = screenHeight;

  static bool initialized = false;

  static double getSize(double value) => initialized ? ScreenUtil().setWidth(value).toDouble() : value;

  static double get s0 => getSize(0);

  static double get s1 => getSize(1);

  static double get s2 => getSize(2);

  static double get s3 => getSize(3);

  static double get s4 => getSize(4);

  static double get s5 => getSize(5);

  static double get s6 => getSize(6);

  static double get s8 => getSize(8);

  static double get s9 => getSize(9);

  static double get s10 => getSize(10);

  static double get s11 => getSize(11);

  static double get s12 => getSize(12);

  static double get s14 => getSize(14);

  static double get s15 => getSize(15);

  static double get s16 => getSize(16);

  static double get s18 => getSize(18);

  static double get s20 => getSize(20);

  static double get s25 => getSize(25);

  static double get s30 => getSize(30);

  static double get s35 => getSize(35);

  static double get s40 => getSize(40);

  static double get s45 => getSize(45);

  static double get s50 => getSize(50);

  static double get s55 => getSize(55);

  static double get s60 => getSize(60);

  static double get s70 => getSize(70);

  static double get s80 => getSize(80);

  static double get s90 => getSize(90);

  static double get s100 => getSize(100);

  static double get s120 => getSize(120);

  static double get s150 => getSize(150);

  static double get s165 => getSize(165);

  static double get s200 => getSize(200);

  static double get s300 => getSize(300);

  static EdgeInsets get defaultSpace => EdgeInsets.all(AppSizes.s8);

  static EdgeInsets get smallSpace => EdgeInsets.all(AppSizes.s10);

  static EdgeInsets get extraSmallSpace => EdgeInsets.all(AppSizes.s5);

  static EdgeInsets get mediumSpace => EdgeInsets.all(AppSizes.s15);

  static EdgeInsets get largeSpace => EdgeInsets.all(AppSizes.s20);

  static void initScreenAwareSizes(BuildContext context) {
    if (initialized) {
      return;
    }
    initialized = true;

    screenWidth = context.size?.width ?? 0;
    screenHeight = context.size?.height ?? 0;

    if (screenWidth > 300 && screenWidth < 500) {
      defaultScreenWidth = 450;
      defaultScreenHeight = defaultScreenWidth * screenHeight / screenWidth;
    } else if (screenWidth > 500 && screenWidth < 600) {
      defaultScreenWidth = 500;
      defaultScreenHeight = defaultScreenWidth * screenHeight / screenWidth;
    } else if (screenWidth > 600 && screenWidth < 700) {
      defaultScreenWidth = 550;
      defaultScreenHeight = defaultScreenWidth * screenHeight / screenWidth;
    } else if (screenWidth > 700 && screenWidth < 1050) {
      defaultScreenWidth = 800;
      defaultScreenHeight = defaultScreenWidth * screenHeight / screenWidth;
    } else {
      defaultScreenWidth = screenWidth;
      defaultScreenHeight = screenHeight;
    }

    FontSizes.initScreenAwareFontSize();

  }
  double get s1000 => AppSizes.getSize(1000);
}

class FontSizes {
  static bool initialized = false;

  static double getSp(double value) => initialized ? ScreenUtil().setSp(value).toDouble() : value;

  static double get s5 => getSp(5);

  static double get s6 => getSp(7);

  static double get s7 => getSp(7);

  static double get s8 => getSp(8);

  static double get s9 => getSp(9);

  static double get s10 => getSp(10);

  static double get s11 => getSp(11);

  static double get s12 => getSp(12);

  static double get s13 => getSp(13);

  static double get s14 => getSp(14);

  static double get s15 => getSp(15);

  static double get s16 => getSp(16);

  static double get s17 => getSp(17);

  static double get s18 => getSp(18);

  static double get s19 => getSp(19);

  static double get s20 => getSp(20);

  static double get s21 => getSp(21);

  static double get s22 => getSp(22);

  static double get s23 => getSp(23);

  static double get s24 => getSp(24);

  static double get s25 => getSp(25);

  static double get s26 => getSp(26);

  static double get s27 => getSp(27);

  static double get s28 => getSp(28);

  static double get s29 => getSp(29);

  static double get s30 => getSp(30);

  static double get s36 => getSp(36);

  static void initScreenAwareFontSize() {
    if (initialized) {
      return;
    }
    initialized = true;
  }

  double get s1000 => AppSizes.getSize(1000);
}
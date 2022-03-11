import '../commons/app_images.dart';

class Utils {
  static String getBackground({String? hour , String? currentHour}){
    if(hour != currentHour){
      hour = currentHour;
      switch(hour) {
        case "5" : {
          return AppImages.sunny1;
        }
        case "6" : {
          return AppImages.sunny2;
        }
        case "7" : {
          return AppImages.street2;
        }
        case "12" : {
          return AppImages.street1;
        }
        case "14" : {
          return AppImages.after1;
        }
        case "15" : {
          return AppImages.after2;
        }
        case "16" : {
          return AppImages.after3;
        }
        case "17" : {
          return AppImages.after4;
        }
        case "18" : {
          return AppImages.night1;
        }
        case "21" : {
          return AppImages.night2;
        }
      }
    }
    return AppImages.after2;
  }
}
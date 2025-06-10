
class AppImages {
  static final String appLogo = linkPng("logo");
  static final String onboarding = linkPng("on_baording1");

  static final String onboarding1 = linkJpg("on_boarding");
  

  static String linkPng(String name) => "assets/images/$name.png";
  static String linkJpg(String name) => "assets/images/$name.jpg";

}

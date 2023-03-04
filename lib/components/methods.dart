import 'barrel_file.dart';
const avatarSize = 48.0;
void navigateFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,MaterialPageRoute(builder: (context) => widget),
      (route) => false,);

void navigate(context,widget)=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=> widget));

void navigateReplace(context, widget) => Navigator.pushReplacement(
      context,MaterialPageRoute(builder: (context) => widget),);

void snackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));}

////////////////////agora////////////////
Widget remoteVideo() {
    if (remoteUId != null) {
      return AgoraVideoView(
          controller: VideoViewController.remote(
              rtcEngine: engine,
              canvas: VideoCanvas(uid: remoteUId),
              connection: const RtcConnection(channelId: channelName)));
    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  primaryColorDark: const Color(0xFF0097A7),
  primaryColorLight: const Color(0xFFB2EBF2),
  primaryColor: const Color(0xFF00BCD4),
  colorScheme: const ColorScheme.light(secondary: Color(0xFF009688)),
  scaffoldBackgroundColor: const Color(0xFFE0F2F1),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
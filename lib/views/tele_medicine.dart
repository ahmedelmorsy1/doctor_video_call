import '../components/barrel_file.dart';
class TeleMedicine extends StatelessWidget {
  const TeleMedicine({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(child: Center(
        child: CustomFlatButton(text: 'TeleMedicine',
        onPressed:()=>Navigator.push(context,
        MaterialPageRoute(builder: (context)=>const WelcomeView()))),
      ),
    );
  }
}
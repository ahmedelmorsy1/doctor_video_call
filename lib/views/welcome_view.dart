// import '../bloc/auth_bloc.dart';
import '../components/barrel_file.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomText(fontSize: 14,
          text: "lorem ipsum lorem ipsum lorem  ipsum lorem ipsum lorem ipsum"),
          CustomButton(text: 'Payment',onPressed: ()=> navigate(context, const PaymentScreen()),
          color: Colors.greenAccent,backColor: Colors.white,),
          CustomButton(text: 'Video call my doctor',
          onPressed: ()=> navigate(context, const VideoCall())
          ,backColor: Colors.greenAccent,),
          //CustomButton(text: 'Sign Out',onPressed: (){context.read<AuthBloc>().add(SignOutRequested());}),
          // CustomFlatButton( text:'urgent',onPressed: ()=>navigate(context, const VideoCall())),
        ],
    ));
  }
}
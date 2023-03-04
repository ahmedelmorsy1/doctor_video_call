// import 'package:doctor2/components/barrel_file.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../bloc/auth_bloc.dart';

// class Dashboard extends StatelessWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Getting the user from the FirebaseAuth Instance
//     final user = FirebaseAuth.instance.currentUser!;
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dashboard'),),
//       body: BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is UnAuthenticated) {// Navigate to the sign in screen when the user Signs Out
//             navigateFinish(context, const SignIn());}
//             },
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomText(text: 'Email: \n ${user.email}',fontSize: 24,tAlign: TextAlign.center,),
//               user.photoURL != null
//                   ? Image.network("${user.photoURL}")
//                   : Container(),
//               user.displayName != null
//                   ? Text("${user.displayName}")
//                   : Container(),
//               const SizedBox(height: 16),
//               const CustomText(text: "Go to Application"),
//               CustomButton(text: "Go",onPressed:()=> navigateReplace(context, const WelcomeView()),),
//               CustomButton(text: 'Sign Out',onPressed: (){context.read<AuthBloc>().add(SignOutRequested());}),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
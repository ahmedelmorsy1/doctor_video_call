// import '../bloc/auth_bloc.dart';
// import '../components/barrel_file.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
// final formKey = GlobalKey<FormState>();
// final emailController = TextEditingController();
// final passwordController = TextEditingController();
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("SignUp"),
//       ),
//       body: BlocConsumer<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is Authenticated) {// Navigating to the dashboard screen if the user is authenticated
//            navigateReplace(context, const Dashboard());}
//           if (state is AuthError) {// Displaying the error message if the user is not authenticated
//             snackBar(context, state.error);}
//         },
//         builder: (context, state) {
//           if (state is Loading) {
//             // Displaying the loading indicator while the user is signing up
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (state is UnAuthenticated) {
//             // Displaying the sign up form if the user is not authenticated
//             return Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: SingleChildScrollView(
//                   reverse: true,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const CustomText(text: "Sign Up",fWeight: FontWeight.bold,fontSize: 38,),
//                       Center(child: Form(
//                           key: formKey,
//                           child: Column(
//                             children: [
//                               getEmailTextFormField(),
//                               getPassTextFormField(),
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width * 0.7,
//                                 child:CustomButton(text: "Sign Up",
//                                 onPressed: ()=>createAccountWithEmailAndPassword(context),) 
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       const Text("Already have an account?"),
//                       getOutlinedButton(()=>navigateReplace(context, const SignIn()), "sign in"),
//                       // const Text("Or"),
//                       // googleIcon(() => authenticateWithGoogle(context),),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
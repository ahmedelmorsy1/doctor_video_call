// import '../components/barrel_file.dart';
// import '../bloc/auth_bloc.dart';

// class SignIn extends StatefulWidget {
// const SignIn({Key? key}) : super(key: key);

// @override
// State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   final formKey = GlobalKey<FormState>();
// final emailController = TextEditingController();
// final passwordController = TextEditingController();

// @override
// void dispose() {
// emailController.dispose();
// passwordController.dispose();
// super.dispose();
// }

// @override
// Widget build(BuildContext context) {
// return Scaffold(
//   appBar: AppBar(title: const Text("SignIn"),),
//   body: BlocListener<AuthBloc, AuthState>(
//     listener: (context, state) {
//       // Navigating to the dashboard screen if the user is authenticated
//       if (state is Authenticated) ()=>navigateReplace(context, const Dashboard());
//       // Showing the error message if the user has entered invalid credentials
//       if (state is AuthError) ()=> snackBar(context, state.error);
//     },
//     child: BlocBuilder<AuthBloc, AuthState>(
//       builder: (context, state) {
//         if (state is Loading) {
//           // Showing the loading indicator while the user is signing in
//           return const Center(child: CircularProgressIndicator(),);
//         }
//         if (state is UnAuthenticated) {
//           // Showing the sign in form if the user is not authenticated
//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: SingleChildScrollView(
//                 reverse: true,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const CustomText(text:'Sign In', fontSize: 38,fWeight: FontWeight.bold),
//                     Center(
//                       child: Form(key: formKey,
//                         child: Column(
//                           children: [
//                             getEmailTextFormField(),
//                             getPassTextFormField(),
//                       SizedBox(width:MediaQuery.of(context).size.width * 0.7,
//                         child:CustomButton(text: 'Sign In',
//                         onPressed: (){authenticateWithEmailAndPassword(context);}) ,
//                         )],),),),
//                     // googleIcon(()=>authenticateWithGoogle(context)),
//                     const Text("Don't have an account?"),
//                     getOutlinedButton(()=> navigateReplace(context, const SignUp()), "Sign Up"),
//                    ],),
//               ),
//             ),);
//         }
//         return Container();
//       },
// ),),
// );
// }}
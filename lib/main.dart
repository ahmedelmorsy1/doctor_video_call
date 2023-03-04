
import '../components/barrel_file.dart';
import 'app/bloc_observer.dart';
// import 'bloc/auth_bloc.dart';
/*SHA1: B7:10:CB:A8:1E:62:9E:86:5E:3A:21:9B:FE:D4:4A:39:C8:C2:FF:98
SHA-256: EC:02:69:86:B2:4D:C7:32:4B:19:DC:EF:90:EB:F6:38:74:A2:E1:4C:C2:7E:FA:AB:09:11:3B:59:8A:96:63:54*/
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();

  final authRepository = AuthRepository();
  await authRepository.user.first;

  runApp(App(authRepository: authRepository));
}

  
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider(
//       create: (context) => AuthRepository(),
//       child: BlocProvider(
//         create: (context) => AuthBloc(
//           authRepository: RepositoryProvider.of<AuthRepository>(context),
//         ),
//         child: const MaterialApp(
//           home: SignIn()
//         ),
//       ),
//         );
//   }
// }
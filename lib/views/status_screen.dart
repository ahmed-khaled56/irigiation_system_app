// import 'package:flutter/material.dart';
// import 'package:irrigiation_app/cubits/get_status_cubit/get_status_cubit.dart';
// import 'package:irrigiation_app/cubits/get_status_cubit/get_status_states.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:irrigiation_app/models/status_model.dart';
// import 'package:irrigiation_app/widgets/no_status_body.dart';
// import 'package:irrigiation_app/widgets/status_body.dart';

// class StatusScreen extends StatelessWidget {
//   const StatusScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => GetStatusCubit(),
//       child: Builder(
//         builder: (context) {
//           return BlocBuilder<GetStatusCubit, StatusStates>(
//             builder: (context, state) {
//               return Scaffold(
//                 appBar: AppBar(
//                   backgroundColor: Colors.orange.withOpacity(0.2),
//                   title: Text('Check Overall Status'),
//                 ),
//                 body: Stack(
//                   children: <Widget>[
//                     // Background image
//                     Positioned.fill(
//                       child: Image.asset(
//                         'lib/assets/images/check3.jpg',
//                         fit: BoxFit.cover,
//                       ),
//                     ),

//                     Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 20),
//                           ElevatedButton(
//                             onPressed: () async {
//                               StatusResponseModel getStatusCubit =
//                                   BlocProvider.of<GetStatusCubit>(
//                                     context,
//                                   ).getStatus();
//                             },
//                             child: Text('Check Now'),
//                           ),
//                           BlocBuilder<GetStatusCubit, StatusStates>(
//                             builder: (context, state) {
//                               if (state is NoStatusState) {
//                                 return const NoStatusBody();
//                               } else if (state
//                                   is StatusLoadedSuccessfullSatate) {
//                                 return StatusBody(status: getStatusCubit);
//                               } else {
//                                 return const Center(
//                                   child: Text(
//                                     'Opps there is an error please try later !!',
//                                     style: TextStyle(fontSize: 18),
//                                   ),
//                                 );
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irrigiation_app/cubits/get_status_cubit/get_status_cubit.dart';
import 'package:irrigiation_app/cubits/get_status_cubit/get_status_states.dart';
import 'package:irrigiation_app/models/status_model.dart';
import 'package:irrigiation_app/widgets/no_status_body.dart';
import 'package:irrigiation_app/widgets/status_body.dart';

class StatusScreen extends StatefulWidget {
  StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  bool isPressd = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetStatusCubit(),
      child: Builder(
        builder: (context) {
          final getStatusCubit = context.read<GetStatusCubit>();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange.withOpacity(0.2),
              title: const Text('Check Overall Status'),
            ),
            body: Stack(
              children: <Widget>[
                // خلفية الصورة
                Positioned.fill(
                  child: Image.asset(
                    'lib/assets/images/check3.jpg',
                    fit: BoxFit.cover,
                  ),
                ),

                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          getStatusCubit.getStatus();
                          // setState(() {
                          //   isPressd = true;
                          // });
                        },
                        child: const Text('Check Now'),
                      ),
                      const SizedBox(height: 20),

                      BlocBuilder<GetStatusCubit, StatusStates>(
                        builder: (context, state) {
                          if (state is NoStatusState) {
                            return const Text('Start checking now 🔍');
                          } else if (state is StatusFailureSatate) {
                            return Text(state.errMessage);
                          } else if (state is StatusLoadedSuccessfullSatate) {
                            return StreamBuilder<StatusResponseModel>(
                              stream:
                                  context.read<GetStatusCubit>().statusStream,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Text('No data found.');
                                }

                                final status = snapshot.data!;
                                return StatusBody(status: status);
                              },
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:irrigiation_app/cubits/get_status_cubit/get_status_cubit.dart';
import 'package:irrigiation_app/models/status_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irrigiation_app/widgets/infoRow.dart';

// class StatusBody extends StatelessWidget {
//   const StatusBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<StatusResponseModel> statusList = [];

//     statusList = BlocProvider.of<GetStatusCubit>(context).getStatus();

//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               const Spacer(flex: 1),
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       const Text(
//                         'Temperture:',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Text(
//                         statusList[0]..toString(),
//                         style: const TextStyle(
//                           fontSize: 15,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       const Text(
//                         'Humidty:',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Text(
//                         statusList[0].Humdity.toString(),
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       const Text(
//                         'Soil Temperture:',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Text(
//                         statusList[0].SoilTemp.toString(),
//                         style: const TextStyle(
//                           fontSize: 15,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(width: 10),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class StatusBody extends StatelessWidget {
//   const StatusBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final statusStream = BlocProvider.of<GetStatusCubit>(context).statusStream;

//     return StreamBuilder<Map<String, StatusResponseModel>>(
//       stream: statusStream,
//       builder: (context, snapshot) {
//         final statusMap = snapshot.data!;

//         final firstEntry = statusMap.entries.first.value;
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text("Error: ${snapshot.error}"));
//         } else if (snapshot.data!.isEmpty) {
//           return const Center(child: Text("No data available."));
//         }

//         return Container(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               InfoRow(label: "Temperature", value: firstEntry.data.temperature),
//               InfoRow(label: "Humidity", value: firstEntry.data.soilMoisture),
//               InfoRow(
//                 label: "Soil Temperature",
//                 value: firstEntry.data.soilTemperature,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
class StatusBody extends StatelessWidget {
  final StatusResponseModel status;

  const StatusBody({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoRow(label: "Temperature", value: status.data.temperature),
          InfoRow(label: "Humidity", value: status.data.soilMoisture),
          InfoRow(
            label: "Soil Temperature",
            value: status.data.soilTemperature,
          ),
        ],
      ),
    );
  }
}

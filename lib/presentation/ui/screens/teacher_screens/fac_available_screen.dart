import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_available_controller.dart';

class FacAvailableScreen extends StatefulWidget {
  const FacAvailableScreen({super.key});

  @override
  State<FacAvailableScreen> createState() => _FacAvailableScreenState();
}

class _FacAvailableScreenState extends State<FacAvailableScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<FacAvailableController>().facAvailable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculties'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<FacAvailableController>(
          builder: (facAvailableController) {
            return Column(
              children: [_facAvailableMethod(facAvailableController)],
            );
          },
        ),
      ),
    );
  }

  Expanded _facAvailableMethod(FacAvailableController facAvailableController) {
    return Expanded(
      child: ListView.separated(
        itemCount: facAvailableController.facAvailableModel.data?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.grey.shade200,
            title: Text(
              facAvailableController.facAvailableModel.data?[index].fullName
                      .toString() ??
                  'Unknown',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(
                  facAvailableController
                          .facAvailableModel.data?[index].designation
                          .toString() ??
                      'Unknown',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Department of ${facAvailableController.facAvailableModel.data?[index].department.toString() ?? 'Unknown'}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  facAvailableController.facAvailableModel.data?[index].email
                          .toString() ??
                      'Unknown',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '(${facAvailableController.facAvailableModel.data?[index].shortWords.toString() ?? 'Unknown'})',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18),
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.black54,
            thickness: 2,
            height: 10,
          );
        },
      ),
    );
  }
}

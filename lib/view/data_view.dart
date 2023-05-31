import 'package:depinflutter/di/di.dart';
import 'package:depinflutter/repo/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/user.dart';

class DataView extends StatefulWidget {
  const DataView({Key? key}) : super(key: key);

  @override
  State<DataView> createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final birthTimeController = TextEditingController();
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Add User", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 16.0),
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Id',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date of Birth',
              ),
              controller: dobController,
              readOnly: true,
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate!,
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2050),
                );

                if (newDate != null) {
                  setState(
                    () {
                      String formattedDate =
                          "${newDate.year.toString().padLeft(4, '0')}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";
                      dobController.text = formattedDate;
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: birthTimeController,
              readOnly: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Birth Time',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: selectedTime ?? TimeOfDay.now(),
                    );

                    if (pickedTime != null) {
                      setState(() {
                        selectedTime = pickedTime;
                        birthTimeController.text = pickedTime.format(context);
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                User user = User(
                  id: int.parse(idController.text.trim()),
                  name: nameController.text.trim(),
                  dob: dobController.text.trim(),
                  dobTime: birthTimeController.text.trim(),
                );
                getIt<UserRepository>().addUser(user);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('added'),
                  ),
                );
              },
              child: const Text('Add User'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/output');
              },
              child: const Text('Display User'),
            ),
          ],
        ),
      ),
    );
  }
}

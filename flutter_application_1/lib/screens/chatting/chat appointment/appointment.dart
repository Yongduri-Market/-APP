// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';

class Chatmainpage extends StatefulWidget {
  const Chatmainpage({super.key});

  @override
  State<Chatmainpage> createState() => _ChatmainpageState();
}

class _ChatmainpageState extends State<Chatmainpage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedLocation = '인성관';
  String selectedReminder = '30분 전';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 224, 247),
      appBar: AppBar(
        title: const Center(
          child: Text(
            '용가리님과 약속',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Color.fromARGB(255, 175, 217, 240),
            height: 2.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  '날짜',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                const Spacer(),
                Text(
                  "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일",
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today, color: Colors.white),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 175, 217, 240),
              height: 20,
              thickness: 1.0,
            ),
            Row(
              children: [
                const Text(
                  '시간',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                const Spacer(),
                Text(
                  "${selectedTime.format(context)}",
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
                IconButton(
                  icon: const Icon(Icons.access_time, color: Colors.white),
                  onPressed: () => _selectTime(context),
                ),
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 175, 217, 240),
              height: 20,
              thickness: 1.0,
            ),
            Row(
              children: [
                const Text(
                  '장소',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                const Spacer(),
                DropdownButton<String>(
                  value: selectedLocation,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLocation = newValue!;
                    });
                  },
                  items: <String>[
                    '인성관',
                    '문예대',
                    '체과대',
                    '종합체육관',
                    '도서관',
                    '에융대',
                    '보1',
                    '보2',
                    '무도대',
                    '대운동장'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 175, 217, 240),
              height: 20,
              thickness: 1.0,
            ),
            Row(
              children: [
                const Text(
                  '약속 전 나에게 알림',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                const Spacer(),
                DropdownButton<String>(
                  value: selectedReminder,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedReminder = newValue!;
                    });
                  },
                  items: <String>[
                    '1일 전',
                    '3시간 전',
                    '2시간 전',
                    '1시간 전',
                    '30분 전',
                    '10분 전',
                    '5분 전'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: Chatmainpage()));
}

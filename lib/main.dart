import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_wed/controller/global_controller.dart';
import 'package:test_wed/model/api_res.model.dart';

void main() {
  Get.put<GlobalController>(GlobalController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _globalController = GlobalController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sandeep Task (Wednesday Solution)'),
        ),
        body: Obx(() {
          if (_globalController.isLoading()) {
            return const Center(child: CircularProgressIndicator());
          } else if (_globalController.listData.isEmpty) {
            return const Center(child: Text('No Data'));
          } else {
            return ListView.builder(
              itemCount: _globalController.listData.length,
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) => itemList(data: _globalController.listData[index]),
            );
          }
        }));
  }

  Widget itemList({required ApiDataModel data}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        title: Text(data.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(data.body),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ID: ${data.id}',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                Text(
                  'User ID:${data.userId}',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

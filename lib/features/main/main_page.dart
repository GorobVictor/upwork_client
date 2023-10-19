import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upwork_client/core/core.dart';
import 'package:upwork_client/core/providers/jobs_repository.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
      body: FutureBuilder(
        future: JobsRepository().getJobs(0, 30),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final result = snapshot.data! as List<JobDto>;

            return ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Column(children: [
                    Text(result[index].title),
                    Text(result[index].upWorkId),
                    Text(result[index].country),
                  ],),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

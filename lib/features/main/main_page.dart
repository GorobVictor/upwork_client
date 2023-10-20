import 'package:flutter/material.dart';
import 'package:upwork_client/core/core.dart';
import 'package:upwork_client/core/providers/jobs_repository.dart';
import 'package:upwork_client/features/full_card/full_card.dart';
import 'package:upwork_client/features/pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final signalR = SignalRRepository();

  final Future<List<JobDto>?> func = JobsRepository().getJobs(0, 30);
  final List<JobDto> listJobs = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    func.then((value) {
      try {
        setState(() {
          listJobs.addAll(value!);
        });
        signalR.addOn(_handle);
      } catch (e) {}
    });
    _scrollController.addListener(() async {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        final result = await JobsRepository().getJobs(listJobs.length, 30);
        setState(() {
          listJobs.addAll(result!);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
      body: listJobs.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              itemCount: listJobs.length,
              itemBuilder: (context, index) {
                return UpWorkCard(job: listJobs[index]);
              },
            ),
    );
  }

  void _handle(List<dynamic>? parameters) {
    final list = (parameters!.first as List)
        .map((e) => e as Map<String, dynamic>)
        .map(JobDto.fromJson)
        .toList();

    setState(() {
      listJobs.insertAll(0, list);
      print(list);
    });
  }
}

class UpWorkCard extends StatelessWidget {
  const UpWorkCard({required this.job, super.key});

  final JobDto job;

  @override
  Widget build(BuildContext context) {
    const top = 8.0;
    const rightLeft = 8.0;
    const radius = Radius.circular(10);

    return Padding(
      padding: const EdgeInsets.only(
        top: top,
        right: rightLeft,
        left: rightLeft,
      ),
      child: GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FullCard(job: job)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: job.isPriority ?? false
                ? const Color.fromRGBO(202, 229, 207, 1)
                : Colors.white,
            borderRadius: const BorderRadius.all(radius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Wrap(
                  children: [
                    StandardText(
                      text: job.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        StandardText(
                          text: job.getBudget(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: StandardText(
                            text: job.engagement?.value,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    StandardText(
                      text: '${job.category?.value ?? ''}, ',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: StandardText(
                        text: job.getContractorTier(),
                      ),
                    ),
                  ],
                ),
                StandardText(
                  text: job.country,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

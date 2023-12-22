import 'package:flutter/material.dart';
import 'package:upwork_client/core/core.dart';
import 'package:upwork_client/core/providers/jobs_repository.dart';
import 'package:upwork_client/features/pages.dart';
import 'package:upwork_client/utils/styles/colors/app_colors.dart';

class JobsListScreen extends StatefulWidget {
  const JobsListScreen({required this.updateScreenIndexToBrowser, super.key});

  final void Function(String) updateScreenIndexToBrowser;

  @override
  State<JobsListScreen> createState() => _JobsListScreenState();
}

class _JobsListScreenState extends State<JobsListScreen> {
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
        await uploadMoreCards();
      }
    });
  }

  Future<void> uploadMoreCards() async {
    final result = await JobsRepository().getJobs(listJobs.length, 30);
    setState(() {
      listJobs.addAll(result!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final listFilterJobs = getJobsByFilter();

    if (listFilterJobs != null && listFilterJobs.length < 8) {
      uploadMoreCards();
    }
    return listJobs.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Row(
                children: scores
                    .map(
                      (e) => FilterButton(
                        onPressed: () {
                          setState(() {
                            if (activeScore == e) {
                              activeScore = null;
                            } else {
                              activeScore = e;
                            }
                          });
                        },
                        score: e,
                        isActive: activeScore == e,
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.738,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: listFilterJobs.length,
                  itemBuilder: (context, index) {
                    return UpWorkCard(
                      job: listFilterJobs[index],
                      openCard: openCard,
                    );
                  },
                ),
              ),
            ],
          );
  }

  List<int> scores = [5, 4, 3, 2, 1];
  int? activeScore;

  List<JobDto> getJobsByFilter() {
    if (listJobs == null || listJobs.isEmpty) return listJobs;

    if (activeScore == null) {
      return listJobs;
    }

    return listJobs.where((e) => e.wttScore == activeScore).toList();
  }

  void _handle(List<dynamic>? parameters) {
    try {
      final list = (parameters!.first as List)
          .map((e) => e as Map<String, dynamic>)
          .map(JobDto.fromJson)
          .toList();

      list?.forEach((element) {
        element.isNew = true;
      });
      listJobs.insertAll(0, list);
      print(list);

      var i = 0;
      while (i < 5) {
        try {
          setState(() {});
          break;
        } catch (e) {
          i++;
          print('$i => $e');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> openCard(JobDto job) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FullCard(
          job: job,
          updateScreenIndexToBrowser: widget.updateScreenIndexToBrowser,
        ),
      ),
    );
    setState(() {
      job.isNew = false;
    });
  }
}

class UpWorkCard extends StatelessWidget {
  const UpWorkCard({required this.job, required this.openCard, super.key});

  final Function(JobDto) openCard;
  final JobDto job;

  @override
  Widget build(BuildContext context) {
    const vertical = 2.0;
    const horizontal = 8.0;
    const radius = Radius.circular(10);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      child: GestureDetector(
        onTap: () async {
          await openCard(job);
        },
        child: Container(
          decoration: BoxDecoration(
            color: job.isPriority ?? false
                ? AppColors.greenD5
                // ? AppColors.getColor(job.wttScore)
                : AppColors.white,
            borderRadius: const BorderRadius.all(radius),
            /*boxShadow: [
              BoxShadow(
                color: AppColors.black70.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],*/
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Wrap(
                  children: [
                    Row(
                      children: [
                        if (job.isNew)
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.green00,
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: StandardText(
                            text: job.wttScore?.toInt().toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Expanded(
                          child: StandardText(
                            text: job.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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

class FilterButton extends StatelessWidget {
  FilterButton(
      {required this.score,
      required this.onPressed,
      required this.isActive,
      super.key});

  int score;
  Function() onPressed;
  bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: isActive
          ? ElevatedButton(
              onPressed: onPressed,
              child: Text(score.toString()),
            )
          : OutlinedButton(
              onPressed: onPressed,
              child: Text(score.toString()),
            ),
    );
  }
}

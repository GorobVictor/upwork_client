import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:upwork_client/app/view/app.dart';
import 'package:upwork_client/core/core.dart';
import 'package:upwork_client/features/home_page/home_page_widget.dart';
import 'package:upwork_client/features/pages.dart';
import 'package:upwork_client/utils/styles/colors/app_colors.dart';

class FullCard extends StatefulWidget {
  const FullCard({
    required this.job,
    required this.updateScreenIndexToBrowser,
    super.key,
  });

  final JobDto job;
  final void Function(String) updateScreenIndexToBrowser;

  @override
  State<FullCard> createState() => _FullCardState();
}

class _FullCardState extends State<FullCard> {
  bool isGptEnabled = true;

  @override
  Widget build(BuildContext context) {
    final job = widget.job;
    const radius = Radius.circular(30);
    const smallRadius = Radius.circular(20);
    const padding = 15.0;
    final size = MediaQuery.of(context).size;
    final updateScreenIndexToBrowser = widget.updateScreenIndexToBrowser;

    return UpworkScaffold(
      appBar: const UpworkAppBar(
        title: 'Job details',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: padding / 2,
          bottom: padding,
          left: padding,
          right: padding,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: job.isPriority ?? false ? AppColors.greenD5 : Colors.white,
            borderRadius: const BorderRadius.all(radius),
            boxShadow: [
              /*BoxShadow(
                color: AppColors.green00.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),*/
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(padding / 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(padding / 2),
                  child: Column(
                    children: [
                      StandardText(
                        text: job.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      StandardText(
                        text: '${job.category?.value}, ${job.country}',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      StandardText(
                        text: job.getBudget(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      StandardText(
                        text:
                            '${job.engagement?.value}, ${job.getContractorTier()}',
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      StandardText(
                        text: job.createdOn == null
                            ? ''
                            : '${DateFormat.yMMMMEEEEd().format(job.createdOn!)} ${DateFormat.jm().format(job.createdOn!)}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const StandardText(
                        text: 'Client:',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      StandardText(
                        text:
                            'Score: ${job.clientScore}, Feedback: ${job.clientCountFeedback}, Open Jobs: ${job.clientOpenJobs}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      StandardText(
                        text: job.skills?.map((e) => e.getName)?.join(', '),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: padding),
                        child: Container(
                          height: size.height * 0.4,
                          decoration: BoxDecoration(
                            color: job.isPriority ?? false
                                ? AppColors.white
                                : AppColors.greenD5,
                            borderRadius: const BorderRadius.all(smallRadius),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                  0,
                                  3,
                                ), // changes position of shadow
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 20,
                              ),
                              child: StandardText(
                                text: job.description,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: padding,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: isGptEnabled
                                  ? () async {
                                      setState(() {
                                        isGptEnabled = false;
                                      });

                                      final repo = ButtonsRepository();

                                      final result =
                                          await repo.getGptAnswer(job.id!);

                                      try {
                                        setState(() {
                                          isGptEnabled = true;
                                        });
                                      } catch (ex) {}
                                      if (result == null || result.isEmpty) {
                                        ScaffoldMessenger.of(App.navigatorKey
                                                .currentState!.context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Gpt returns error',
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            duration: Duration(seconds: 10),
                                          ),
                                        );
                                      } else {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: App.navigatorKey
                                              .currentState!.context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: radius,
                                              topLeft: radius,
                                            ),
                                          ),
                                          builder: (BuildContext context) {
                                            return AnswerGptWindow(
                                              title: job.title!,
                                              text: result,
                                            );
                                          },
                                        );
                                      }
                                    }
                                  : null,
                              child: const Text('get Gpt vers'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: padding,
                              ),
                              child: Align(
                                child: OutlinedButton(
                                  onPressed: job.link != null
                                      ? () {
                                          updateScreenIndexToBrowser(job.link!);
                                          Navigator.pop(context);
                                        }
                                      : null,
                                  /*  () async {
                                    _openInBrowser();
                                    final uri = Uri.parse(job.link!);
                                    if (!await launchUrl(uri)) {
                                      throw 'Could not launch $job.link';
                                    }
                                  },*/
                                  child: Text(
                                    'open in browser'.toUpperCase(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnswerGptWindow extends StatelessWidget {
  const AnswerGptWindow({required this.title, required this.text, super.key});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onLongPress: () async {
                          await Clipboard.setData(ClipboardData(text: text));
                        },
                        onDoubleTap: () async {
                          await Clipboard.setData(ClipboardData(text: text));
                        },
                        child: Text(text),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

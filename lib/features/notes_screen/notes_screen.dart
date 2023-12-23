import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upwork_client/constant.dart';
import 'package:upwork_client/core/core.dart';
import 'package:upwork_client/features/pages.dart';
import 'package:upwork_client/utils/styles/colors/app_colors.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final List<NoteDto> listNotes = [];
  final Future<List<NoteDto>?> func = NoteRepository().getNotes(0, 30);
  final ScrollController _scrollController = ScrollController();
  bool isEnabledButton = true;

  @override
  void initState() {
    super.initState();

    func.then((value) {
      try {
        setState(() {
          listNotes.addAll(value!);
        });
      } catch (e) {}
    }).catchError(print);
    _scrollController.addListener(() async {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        await uploadMoreNotes();
      }
    });
  }

  Future<void> uploadMoreNotes() async {
    final result = await NoteRepository().getNotes(listNotes.length, 30);
    setState(() {
      listNotes.addAll(result!);
    });
  }

  Future<void> onDismissed(NoteDto note) async {
    try {
      final response = await NoteRepository().deleteNote(note.id!);

      if (response) {
        listNotes.removeWhere((e) => e.id == note.id);
      }
    } catch (e) {
      Constant.showError(e);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomNotesHistory(
          notes: listNotes,
          controller: _scrollController,
          onDismissed: onDismissed,
        ),
        CustomTextInput(
          isEnabled: isEnabledButton,
          onTap: (value) async {
            setState(() {
              isEnabledButton = false;
            });
            final response = await NoteRepository().sendNote(value);
            if (response != null) {
              listNotes.insert(0, response);
            }
            setState(() {
              isEnabledButton = true;
            });
          },
        ),
      ],
    );
  }
}

class CustomNotesHistory extends StatelessWidget {
  CustomNotesHistory({
    required this.notes,
    required this.controller,
    required this.onDismissed,
    super.key,
  });

  List<NoteDto> notes;
  ScrollController controller;
  Function(NoteDto) onDismissed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 65),
      child: ListView.builder(
        controller: controller,
        itemCount: notes.length,
        shrinkWrap: true,
        reverse: true,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        itemBuilder: (context, index) {
          final note = notes[index];
          final noteText = note.text ?? '';
          return Dismissible(
            key: Key(note.id.toString()),
            onDismissed: (direction) {
              onDismissed(note);
            },
            child: Container(
              padding: const EdgeInsets.only(
                  left: 14, right: 14, top: 10, bottom: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onDoubleTap: () async {
                      await Clipboard.setData(
                        ClipboardData(text: noteText),
                      );
                    },
                    onLongPress: () async {
                      await Clipboard.setData(
                        ClipboardData(text: noteText),
                      );
                    },
                    child: Text(noteText),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

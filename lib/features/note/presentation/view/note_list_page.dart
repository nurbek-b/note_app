import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:note_app/features/note/domain/model/note.dart';
import 'package:note_app/features/note/domain/model/note_list.dart';
import 'package:note_app/features/note/presentation/view/note_form_page.dart';
import 'package:note_app/features/note/presentation/view_model/note_list/note_list_viewmodel.dart';

import '../../../../core/theme/app_theme.dart';

class NoteListPage extends ConsumerWidget {
  final _filteredNoteListProvider = filteredNoteListProvider;

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          InkWell(
            onTap: () {
              ref.read(appThemeProvider.notifier).toggleTheme();
            },
            child: CircleAvatar(
              child: Icon(
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Divider(height: 2, color: Colors.grey),
          Consumer(
            builder: (context, ref, _) {
              return ref.watch(_filteredNoteListProvider).maybeWhen(
                    success: (content) =>
                        _buildNoteListContainerWidget(ref, content),
                    error: (_) => _buildErrorWidget(),
                    orElse: () => const Expanded(
                        child: Center(child: CircularProgressIndicator())),
                  );
            },
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildNoteListContainerWidget(WidgetRef ref, final NoteList noteList) {
    return Expanded(child: _buildNoteListWidget(ref, noteList));
  }

  Widget _buildNoteListWidget(final WidgetRef ref, final NoteList noteList) {
    if (noteList.length == 0) {
      return const Center(child: Text('No Note'));
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: noteList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (final BuildContext context, final int index) {
          return _buildNoteItemCardWidget(context, ref, noteList[index]);
        },
      );
    }
  }

  Widget _buildNoteItemCardWidget(
      final BuildContext context, final WidgetRef ref, final Note note) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      style: Theme.of(context).textTheme.headline6,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      DateFormat('yyyy/MM/dd').format(note.created),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      note.content.isEmpty ? 'No Content' : note.content,
                      style: Theme.of(context).textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => NoteFormPage(note),
          )),
    );
  }

  Widget _buildFloatingActionButton(final BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const NoteFormPage(null),
        ),
      ),
      child: const Icon(Icons.add),
    );
  }

  Widget _buildErrorWidget() {
    return const Center(child: Text('An error has occurred!'));
  }
}

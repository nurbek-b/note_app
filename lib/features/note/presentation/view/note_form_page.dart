import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/note/domain/model/note.dart';
import 'package:note_app/features/note/presentation/view_model/note_form/todo_form_viewmodel.dart';

class NoteFormPage extends ConsumerStatefulWidget {
  final Note? _note;

  const NoteFormPage(this._note);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoteFormPageState();
}

class _NoteFormPageState extends ConsumerState<NoteFormPage> {
  late final NoteFormViewModel _viewModel;
  final _formKey = GlobalKey<FormState>();
  final _dueDateFormFocusNode = _DisabledFocusNode();

  _NoteFormPageState();

  @override
  void initState() {
    super.initState();

    _viewModel = ref.read(noteFormViewModelProvider(widget._note));
  }

  @override
  void dispose() {
    _dueDateFormFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_viewModel.appBarTitle()),
        actions: [
          if (_viewModel.shouldShowDeleteNoteIcon())
            _buildDeleteNoteIconWidget(),
        ],
      ),
      body: _buildBodyWidget(),
    );
  }

  Widget _buildBodyWidget() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFormWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSaveButtonWidget(),
              _buildCancelButtonWidget(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButtonWidget() {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () {
          final currentState = _formKey.currentState;
          if (currentState != null && currentState.validate()) {
            _viewModel.createOrUpdateNote();
            Navigator.pop(context);
          }
        },
        child: const Text('Save'),
      ),
    );
  }

  Widget _buildCancelButtonWidget() {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Cancel'),
      ),
    );
  }

  Widget _buildFormWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTitleFormWidget(),
          const SizedBox(height: 16),
          _buildContentFormWidget(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTitleFormWidget() {
    return TextFormField(
      initialValue: _viewModel.initialTitleValue(),
      maxLength: 20,
      onChanged: (value) => _viewModel.setTitle(value),
      validator: (_) => _viewModel.validateTitle(),
      decoration: const InputDecoration(
        icon: Icon(Icons.edit),
        labelText: 'Title',
        helperText: 'Required',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildContentFormWidget() {
    return TextFormField(
      initialValue: _viewModel.initialContentValue(),
      maxLength: 150,
      onChanged: (value) => _viewModel.setContent(value),
      validator: (_) => _viewModel.validateContent(),
      decoration: const InputDecoration(
        icon: Icon(Icons.view_headline),
        labelText: 'Content',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDeleteNoteIconWidget() {
    return IconButton(
      onPressed: () => _showConfirmDeleteNoteDialog(),
      icon: const Icon(Icons.delete),
    );
  }

  _showConfirmDeleteNoteDialog() async {
    final bool result = await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: const Text('Delete Note?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('DELETE'),
            ),
          ],
        );
      },
    );
    if (result) {
      _viewModel.deleteNote();

      if (mounted) {
        Navigator.pop(context);
      }
    }
  }
}

class _DisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

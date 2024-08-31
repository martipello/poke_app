import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../api/models/api_response.dart';
import '../../api/models/error_response.dart';
import '../../api/models/user_score.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/error_widget.dart' as ew;
import '../shared_widgets/rounded_button.dart';
import '../shared_widgets/three_d_text.dart';
import 'view_models/score_view_model.dart';

class SubmitScoreDialogView extends StatefulWidget {
  const SubmitScoreDialogView({super.key, required this.userScore});

  final UserScore userScore;

  @override
  State<SubmitScoreDialogView> createState() => _SubmitScoreDialogViewState();
}

class _SubmitScoreDialogViewState extends State<SubmitScoreDialogView> {
  final textController = TextEditingController();
  final scoreViewModel = GetIt.instance.get<ScoreViewModel>();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    scoreViewModel.setUserScore(widget.userScore);
    textController.addListener(() {
      scoreViewModel.updateScoreName(textController.text);
    });
    scoreViewModel.submitScoreState.listen((response) {
      if (response.status == Status.COMPLETED && mounted) {
        context.pop(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse>(
      stream: scoreViewModel.submitScoreState,
      builder: (context, snapshot) {
        final _hasError = snapshot.data?.status == Status.ERROR;
        if (_hasError) return _buildErrorWidget(snapshot.data?.error);
        return _buildBody(context, isLoading: snapshot.data?.status == Status.LOADING);
      },
    );
  }

  Widget _buildBody(BuildContext context, {bool isLoading = false}) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          24,
          16,
          MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(context),
            const SizedBox(height: 16),
            _buildTextForm(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: _buildSubmitButton(),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildThreeDText('Submit your score'),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.pop();
          },
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return RoundedButton(
      label: 'Submit',
      fillColor: Colors.yellow,
      textStyle: PokeAppText.pokeFontBody1.copyWith(
        color: Colors.blue.shade700,
      ),
      outlineColor: Colors.blue.shade700,
      isLoading: false,
      usePokeballLoading: true,
      onPressed: () {
        if (formKey.currentState?.validate() == true) {
          scoreViewModel.submitScore();
        }
      },
    );
  }

  Widget _buildTextForm() {
    return TextFormField(
      controller: textController,
      style: PokeAppText.pokeFontBody1.copyWith(
        color: Colors.blue.shade700,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: 'Name',
        fillColor: Colors.yellow.withOpacity(0.7),
        hintStyle: TextStyle(
          color: Colors.blue.shade700,
        ),
        labelStyle: TextStyle(
          color: Colors.blue.shade700,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade700,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade700,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade700,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade700,
            width: 2,
          ),
        ),
      ),
      validator: (value) {
        if (value?.isNotEmpty != true) {
          return 'Please enter a name';
        }
        if (value!.length < 3) {
          return 'Name must be at least 3 characters';
        }
        if (widget.userScore.correctScore < 20) {
          return 'You need at least 20 correct answers to submit your score';
        }
        return null;
      },
    );
  }

  Widget _buildThreeDText(String text) {
    return ThreeDText(
      text: text,
      textAlign: TextAlign.center,
      strokeColor: Colors.blue.shade700,
      style: PokeAppText.pokeFontSubtitle1.copyWith(
        color: Colors.yellow,
      ),
      backgroundStyle: PokeAppText.pokeFontSubtitle1.copyWith(
        color: Colors.blue.shade900,
      ),
    );
  }

  Widget _buildErrorWidget(ErrorResponse? error) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        24,
        16,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(context),
          const SizedBox(height: 16),
          ew.ErrorWidget(
            errorMessage: 'Something went wrong...',
            showImage: false,
            error: ApiResponse.error(
              error?.message ?? '',
              error: error,
            ),
            onTryAgain: scoreViewModel.submitScore,
          ),
        ],
      ),
    );
  }
}

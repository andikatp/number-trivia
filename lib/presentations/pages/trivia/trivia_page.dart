import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/presentations/pages/trivia/cubit/trivia_cubit.dart';
import 'package:number_trivia/presentations/pages/trivia/widgets/custom_error.dart';
import 'package:number_trivia/presentations/pages/trivia/widgets/custom_textfield.dart';
import 'package:number_trivia/presentations/pages/trivia/widgets/custom_trivia.dart';

class TriviaPageWrapperProvider extends StatelessWidget {
  const TriviaPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TriviaCubit(),
      child: const TriviaPage(),
    );
  }
}

class TriviaPage extends StatefulWidget {
  const TriviaPage({super.key});

  @override
  State<TriviaPage> createState() => _TriviaPageState();
}

class _TriviaPageState extends State<TriviaPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivia Number Generator'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: BlocBuilder<TriviaCubit, TriviaState>(
              builder: (ctx, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (state is TriviaInitial)
                      const CustomTrivia(
                          trivia: 'Your Trivia is Waiting for you!'),
                    if (state is TriviaLoadingState)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    if (state is TriviaLoadedState)
                      CustomTrivia(trivia: state.trivia),
                    if (state is TriviaErrorState)
                      CustomError(message: state.message),
                    const SizedBox(height: 100),
                    CustomTextfield(controller: _controller),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_controller.text.isEmpty) {
                          return;
                        }
                        context
                            .read<TriviaCubit>()
                            .onGetTriviaButtonPressedEvent(
                                int.parse(_controller.text));
                        _controller.clear();
                      },
                      child: const Text('Get Trivia!'),
                    ),
                    const SizedBox(height: 5),
                    const Center(child: Text('Or')),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () => context
                          .read<TriviaCubit>()
                          .onGetTriviaRandomButtonPressedEvent(),
                      child: const Text('Get Random Trivia'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

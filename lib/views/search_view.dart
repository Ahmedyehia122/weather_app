import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_wheather/get_wheather_cubit.dart';
import 'package:weather_app/widgets/custom_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller = TextEditingController();
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Form(
        key: formState,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: controller,
                  formState: formState,
                  validator: (p0) {
                    if (p0 == '') {
                      return 'Can\'t be empty';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    if (formState.currentState!.validate()) {
                      BlocProvider.of<GetWheatherCubit>(context)
                          .getWheather(cityName: value);
                      Navigator.of(context).pop();
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

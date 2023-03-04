import 'barrel_file.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;
  final bool invisible;
  final TextInputType? keyboard;
  final TextEditingController? controller;
  final int? maxLines;
  final AutovalidateMode? autoValMode;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.onSave,
    this.validator,
    this.invisible = false,
    this.keyboard,
    this.maxLines = 1,
    this.autoValMode = AutovalidateMode.onUserInteraction,
    this.hint = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      const SizedBox(height:10),
       TextFormField(
        controller: controller,
        onSaved: onSave,
        validator: validator,
        autovalidateMode: autoValMode,
        obscureText: invisible,
        keyboardType: keyboard,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(),
          hintStyle: TextStyle(color: Colors.grey.shade500),
          fillColor: Colors.white,
        ),
      ),
      const SizedBox(height:10),
      ],
    );
  }
}

/*        TextFormField(
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              decoration: const InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return value != null && value.length < 6
                                    ? "Enter min. 6 characters"
                                    : null;},
                            ),
                      const SizedBox(height: 12,), */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/common/universal_provider.dart';

class InputWidget extends StatelessWidget {
  final String labelText, hintText;
  final bool isPass;
  final ValueChanged onChange;
  const InputWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.onChange,
    this.isPass = false,
  });

  @override
  Widget build(BuildContext context) {
    final _univProvider = UniversalProvider();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.purple.withOpacity(.53)),
        ),
        const SizedBox(height: 13),
        isPass
            ? Consumer<UniversalProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return TextFormField(
                    obscureText: value.isVisible,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.purple,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.purple,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.purple,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        hintText: hintText,
                        suffixIcon: IconButton(
                          onPressed: () {
                            value.setVisibility();
                          },
                          icon: Icon(
                            value.isVisible ?
                            Icons.visibility_off_outlined :
                            Icons.visibility_outlined,
                          ),
                        )),
                    onChanged: onChange,
                  );
                },
              )
            : TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.purple,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.purple,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.purple,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  hintText: hintText,
                ),
                onChanged: onChange,
              )
      ],
    );
  }
}

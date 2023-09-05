
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Cunstom_text_fild extends StatefulWidget {
  final IconData icon;
  final String label;
  final List<TextInputFormatter>? inputFormatters;
  final bool IsSecret;

  const Cunstom_text_fild(
    
    {
    super.key,
    this.inputFormatters,
    this.IsSecret = false,
    required this.icon,
    required this.label,
  }
  );

  @override
  State<Cunstom_text_fild> createState() => _Cunstom_text_fildState();
}

class _Cunstom_text_fildState extends State<Cunstom_text_fild> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    isObscure = widget.IsSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.IsSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.green,
                  ),
                )
              : null,
          isDense: true,
          labelText: widget.label,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18))),
        ),
      ),
    );
  }
}

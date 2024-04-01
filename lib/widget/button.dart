import 'package:ehealthapp/util/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String? text;
  final Function()? onTap;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool? loading;
  final Color color;
  final bool enabled;
  final IconData? icon;

  const Button({
    super.key,
    this.text,
    this.onTap,
    this.padding,
    this.width,
    this.height,
    this.fontSize,
    this.loading,
    this.icon,
    Color? color,
    this.enabled = true,
  }) : this.color = color ?? AppColors.primaryColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding == null
          ? const EdgeInsets.only(left: 16.0, right: 16, top: 0)
          : padding!,
      child: InkWell(
        onTap: enabled ? onTap! : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          child: Center(
            child: loading == null
                ? icon == null
                    ? _getText()
                    : _getTextIcon()
                : loading!
                    ? _getLoading()
                    : _getText(),
          ),
        ),
      ),
    );
  }

  Widget _getTextIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text!,
          style: TextStyle(
            color: color == Colors.transparent ? Colors.black : Colors.white,
            fontSize: fontSize,
          ),
        ),
        Visibility(
          visible: icon != null,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getText() {
    return Text(
      text!,
      style: TextStyle(
        color: color == Colors.transparent ? Colors.black : Colors.white,
        fontSize: fontSize,
      ),
    );
  }

  Widget _getLoading() {
    return const SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ),
    );
  }
}

class ButtonImage extends StatelessWidget {
  final String? text;
  final String image;
  final Function()? onTap;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool? loading;
  final Color color;
  final bool enabled;

  const ButtonImage({
    super.key,
    this.text,
    required this.image,
    this.onTap,
    this.padding,
    this.width,
    this.height,
    this.fontSize,
    this.loading,
    Color? color,
    this.enabled = true,
  }) : this.color = color ?? AppColors.primaryColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding == null
          ? const EdgeInsets.only(left: 32.0, right: 32, top: 0)
          : padding!,
      child: InkWell(
        onTap: enabled ? onTap! : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Center(
            child: loading == null
                ? _getTextImage()
                : loading!
                    ? _getLoading()
                    : _getTextImage(),
          ),
        ),
      ),
    );
  }

  Widget _getTextImage() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Image.asset(image),
        ),
        Flexible(
          flex: 3,
          child: Center(
            child: Text(
              text!,
              style: TextStyle(
                  color: color == Colors.transparent
                      ? AppColors.primaryColor
                      : Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getLoading() {
    return const SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ),
    );
  }
}

import 'package:barbar_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class WButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String text;
  final Color? color;
  final Color? disabledColor;
  final Color? loadingColor;
  final bool isLoading;
  final bool isDisabled;
  final double? width;
  final double height;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final BorderRadius borderRadius;

  const WButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.disabledColor,
    this.loadingColor,
    this.isLoading = false,
    this.isDisabled = false,
    this.width,
    this.height = 60,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.textStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
  });

  @override
  State<WButton> createState() => _WButtonState();
}

class _WButtonState extends State<WButton> with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.95,
      upperBound: 1.0,
      vsync: this,
    )..addListener(() {
      setState(() => _scale = _controller.value);
    });
    _controller.value = 1.0;
  }

  void _onTapDown(_) {
    if (!widget.isDisabled && !widget.isLoading) {
      _controller.reverse();
    }
  }

  void _onTapUp(_) {
    if (!widget.isDisabled && !widget.isLoading) {
      _controller.forward();
    }
  }

  void _onTapCancel() {
    if (!widget.isDisabled && !widget.isLoading) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isInteractive = !widget.isDisabled && !widget.isLoading;

    return GestureDetector(
      onTap: isInteractive ? widget.onTap : null,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: Transform.scale(
        scale: _scale,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: widget.width ?? double.infinity,
          ),
          child: Container(
            width: widget.width,
            height: widget.height,
            padding: widget.padding,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.colors.primaryColor1,
                  context.colors.primaryColor2,
                ],
              ),
              color:
                  widget.isDisabled
                      ? widget.disabledColor ?? Colors.grey.shade400
                      : widget.color ?? context.colors.primaryColor1,
              borderRadius: widget.borderRadius,
            ),
            child:
                widget.isLoading
                    ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        strokeCap: StrokeCap.round,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          widget.loadingColor ?? Colors.black,
                        ),
                      ),
                    )
                    : Text(
                      widget.text,
                      style:
                          widget.textStyle ??
                          const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: "AtypTextSemiBold",
                          ),
                      textAlign: TextAlign.center,
                    ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

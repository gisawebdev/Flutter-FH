import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes,
          iconData: Icons.favorite_outline_outlined,
        ),
        const SizedBox(height: 20),
        _CustomIconButton(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(height: 20),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: _CustomIconButton(
            value: 0,
            iconData: Icons.play_circle_outline,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatefulWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<_CustomIconButton> {
  bool _isFavorite = false; // Estado para controlar si es favorito

  @override
  Widget build(BuildContext context) {
    // Determina el ícono y color según el estado
    IconData currentIcon =
        widget.iconData == Icons.favorite_outline_outlined
            ? (_isFavorite ? Icons.favorite : Icons.favorite_outline_outlined)
            : widget.iconData;
    Color iconColor =
        widget.iconData == Icons.favorite_outline_outlined
            ? (_isFavorite ? Colors.red : widget.color ?? Colors.white)
            : widget.color ?? Colors.white;

    return Column(
      children: [
        IconButton(
          onPressed: () {
            // Cambia el estado solo si es el botón de favorito
            if (widget.iconData == Icons.favorite_outline_outlined) {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            }
          },
          icon: Icon(currentIcon, color: iconColor, size: 30),
        ),

        if (widget.value > 0)
          Text(HumanFormats.humanReadableNumber(widget.value.toDouble())),
      ],
    );
  }
}

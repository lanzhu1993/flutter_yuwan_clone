import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

class SVGASampleScreen extends StatefulWidget {
  final String image;

  const SVGASampleScreen({Key key, @required this.image})
      : assert(image != null),
        super(key: key);

  @override
  _SVGASampleScreenState createState() => _SVGASampleScreenState();
}

class _SVGASampleScreenState extends State<SVGASampleScreen>
    with SingleTickerProviderStateMixin {
  SVGAAnimationController animationController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    this.animationController = SVGAAnimationController(vsync: this);
    this._loadAnimation();
  }

  @override
  void dispose() {
    this.animationController.videoItem = null;
    this.animationController.dispose();
    super.dispose();
  }

  void _loadAnimation() async {
    // FIXME: may throw error on loading
    final videoItem = await _loadVideoItem(widget.image);
    if (mounted)
      setState(() {
        this.isLoading = false;
        this.animationController.videoItem = videoItem;
        _playAnimation();
      });
  }

  void _playAnimation() {
    animationController
        .repeat()
        .whenComplete(() => animationController.videoItem = null);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? CircularProgressIndicator()
          : SVGAImage(this.animationController),
    );
  }
}

Future _loadVideoItem(String image) {
  Future Function(String) decoder;
  if (image.startsWith(RegExp(r'https?://'))) {
    decoder = SVGAParser.shared.decodeFromURL;
  } else {
    decoder = SVGAParser.shared.decodeFromAssets;
  }
  return decoder(image);
}

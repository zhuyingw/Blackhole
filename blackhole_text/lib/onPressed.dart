void onPressed(){
  setState(() {
    AnimatedOpacity(
      // If the widget is visible, animate to 0.0 (invisible).
      // If the widget is hidden, animate to 1.0 (fully visible).
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 1000),
      // The green box must be a child of the AnimatedOpacity widget.
      child: Container(
            text,
      ),
    );

  });
}

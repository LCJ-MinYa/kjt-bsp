import 'package:flutter/material.dart';

/*
 * 左右进场动画
 */
class SlideAnimationWidget extends AnimatedWidget {
    SlideAnimationWidget({
        Key key,
        @required Animation<Offset> position,
        this.transformHitTests = true,
        this.child,
    }) : assert(position != null),
    super(key: key, listenable: position);

    Animation<Offset> get position => listenable;
    final bool transformHitTests;
    final Widget child;

    @override
    Widget build(BuildContext context) {
        Offset offset=position.value;
        //动画反向执行时，调整x偏移，实现“从左边滑出隐藏”
        if (position.status == AnimationStatus.reverse) {
                offset = Offset(-offset.dx, offset.dy);
        }
        return FractionalTranslation(
            translation: offset,
            transformHitTests: transformHitTests,
            child: child,
        );
    }
}
# flutter_simple_animations

Flutter package that provides easy to use widgets for some of the most used simple animations. Simply wrap the widgets you want to have animated in one of the animation widgets and they will be animated on render.

---

## 👻 Fade Animation

Uses a fade-in animation to display the wrapped widget on render.

```dart
return FadeAnimation(
    duration: const Duration(seconds: 1),
    delay: const Duration(seconds: 1),
    reverse: false,
    child: ...
);
```

![fade animation example](images/fade_animation.gif?raw=true "fade animation example")

---

## 🎚 Fade Slide Animation

Uses a fade-in animation combined with a slide-animation to display the wrapped widget on render. Direction can be customized.

```dart
return FadeSlideAnimation(
    startingPosition: const Offset(0, 0.3),
    duration: const Duration(seconds: 1),
    delay: const Duration(seconds: 1),
    reverse: false,
    child: ...
);
```

![fade animation example](images/fade_slide_animation.gif?raw=true "fade animation example")

---

## ⬇️ Bounce Down Animation

Combines a forward and a backward animation to create a bounce down animation.

```dart
return BounceDownAnimation(
    child: ...
);
```

![fade animation example](images/bounce_down_animation.gif?raw=true "fade animation example")

---

## 🔃 Rotating Text

Cycles through the provided strings an animates the transition similarly to the default _FadeSlideAnimation_ widgets fade in animation.

```dart
return RotatingText(
    ["Developer", "Student", "Learner"],
    style: Theme.of(context).textTheme.headlineLarge,
);
```

![fade animation example](images/rotating_text.gif?raw=true "fade animation example")

---

## TODOs for this package

- [x] add README.md
- [ ] improve code documentation
- [ ] extend APIs of widgets to provide better customizability
- [ ] add more useful simple to use animation widgets

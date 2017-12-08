# bs-css-core

Statically typed DSL for writing CSS in ReasonML.

This is a fork of [bs-css](https://github.com/SentiaAnalytics/bs-css) that
extracts the Css module, so that it can be used by variuos CSS-in-JS bindings.

## Installation

```sh
yarn add bs-css-core
```

In your `bsconfig.json`, include `"bs-css-core"` in the `bs-dependencies`.

## Usage

```reason
module Theme = {
  open Css;
  let textColor = hex("333");
  let basePadding = px(15);
};

let styles = Css.({
  "card": style([
    backgroundColor(white),
    boxShadow(~y=3, ~blur=5, rgba(0, 0, 0, 0.3)),
    padding(Theme.basePadding)
  ]),
  "title": style([
    fontSize(rem(1.5)),
    color(Theme.textColor),
    marginBottom(Theme.basePadding)
  ])
});
```

**Keyframes**

Define animation keyframes;

```reason
let bounce = Css.keyframes([
  ("0%", [ transform( scale(0.1, 0.1) ),  opacity(0.0) ]),
  ("60%", [ transform( scale(1.2, 1.2) ),  opacity(1.0) ]),
  ("100%", [ transform( scale(1.0,1.0) ), opacity(1.0) ])
]);

let styles = css([
  animationName(bounce),
  animationDuration(2000),
  width(px(50)),
  height(px(50)),
  backgroundColor(rgb(255, 0, 0))
]);
```

## Development

```sh
yarn start
```

## Where is the documentation?

Its on its way! Until then you can check out [css.rei](./src/Css.rei).

## Thanks

Thanks to [bs-css](https://github.com/SentiaAnalytics/bs-css) that introduced
the DSL. Thanks to [bs-glamor](https://github.com/poeschko/bs-glamor) which
bs-css was forked from. Thanks to
[elm-css](https://github.com/rtfeldman/elm-css) for DSL design inspiration.


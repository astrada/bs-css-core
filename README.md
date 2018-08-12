# bs-css-core

Statically typed DSL for writing CSS in ReasonML.

This is a fork of [bs-css](https://github.com/SentiaAnalytics/bs-css) that
extracts the Css module, so that it can be used by various CSS-in-JS bindings.
See [bs-react-fela-examples](https://github.com/astrada/bs-react-fela-examples)
and
[bs-styletron-react-examples](https://github.com/astrada/bs-styletron-react-examples)
for practical examples of usage.

## Installation

```sh
yarn add @astrada/bs-css-core
```

In your `bsconfig.json`, include `"@astrada/bs-css-core"` in the
`bs-dependencies`.

## Usage

```reason
type theme = {
  textColor: Css.color,
  basePadding: Css.length
};

let makeStyle = (theme) =>
  Css.(
    style([
      backgroundColor(white),
      boxShadows([boxShadow(~y=px(3), ~blur=px(5), rgba(0, 0, 0, 0.3))]),
      padding(theme.basePadding),
      fontSize(rem(1.5)),
      color(theme.textColor),
      marginBottom(px(10))
    ])
  );
```

**Keyframes**

Define animation keyframes;

```reason
let bounce =
  Css.(
    keyframes([
      ("0%", [transform(scale(0.1, 0.1)), opacity(0.0)]),
      ("60%", [transform(scale(1.2, 1.2)), opacity(1.0)]),
      ("100%", [transform(scale(1.0, 1.0)), opacity(1.0)])
    ])
  );

let makeStyle = (_theme) =>
  Css.(
    style([
      animationName(bounce),
      animationDuration(2000),
      width(px(50)),
      height(px(50)),
      backgroundColor(rgb(255, 0, 0))
    ])
  );
```

## Development

```sh
yarn start
```

## Where is the documentation?

Check out [Css.rei](./src/Css.rei).

## Thanks

Thanks to [bs-css](https://github.com/SentiaAnalytics/bs-css) that introduced
the DSL. Thanks to [bs-glamor](https://github.com/poeschko/bs-glamor) which
bs-css was forked from. Thanks to
[elm-css](https://github.com/rtfeldman/elm-css) for DSL design inspiration.

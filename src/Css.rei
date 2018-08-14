/*
 * Based on https://github.com/SentiaAnalytics/bs-css/blob/master/src/Css.rei
 * bs-css v7.0.1
 * commit 30d0a296
 */

/**
 * # bs-css-core
 *
 * Statically typed DSL for writing CSS in ReasonML.
 *
 * ## Usage
 *
 * ```re
 * type theme = {
 *   textColor: Css.color,
 *   basePadding: Css.length
 * };
 *
 * let makeStyle = (theme) =>
 *   Css.(
 *     style([
 *       backgroundColor(white),
 *       boxShadows([boxShadow(~y=px(3), ~blur=px(5), rgba(0, 0, 0, 0.3))]),
 *       padding(theme.basePadding),
 *       fontSize(rem(1.5)),
 *       color(theme.textColor)
 *     ])
 *   );
 * ```
 */;

/**
 * A CSS rule. It can be a simple property/value pair (e.g.: `{ color: white }`),
 * or a CSS ruleset (e.g.:
 * ```css
 * :hover {
 *   color: orange;
 * }
 * ```
 */
type rule;

/** Empty CSS ruleset */
let empty: list(rule);
/** Flattens a list of CSS rulesets */
let merge: list(list(rule)) => list(rule);
/**
 * Builds a style object from a list of rules.
 * E.g.:
 * ```re
 * Css.(style([
 *   backgroundColor(white),
 *   padding(px(15))
 * ]))
 * ```
 * returns a generic JS object (whose Reason type is abstract) that collects
 * CSS declarations/rules:
 * ```js
 * {
 *   backgroundColor: "white",
 *   padding: "15px"
 * }
 * ```
 */
let style: list(rule) => 'style;

/**
 * Marks a rule as important. E.g.:
 * ```css
 * { color: red !important }
 * ```
 * https://www.w3.org/TR/css3-cascade/#importance
 */
let important: rule => rule;
let label: string => rule;

/********************************************************
 ************************ VALUES ************************
 ********************************************************/
/**
 * A CSS angle. E.g.: `90deg`, `100grad`, `1rad`, `0.25turn`.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/angle
 */
type angle;

/**
 * Returns an angle in degrees.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/angle#deg
 */
let deg: int => angle;
/**
 * Returns an angle in radians.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/angle#rad
 */
let rad: float => angle;
/**
 * Returns an angle in gradians.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/angle#grad
 */
let grad: float => angle;
/**
 * Returns an angle in number of turns.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/angle#turn
 */
let turn: float => angle;

/**
 * A CSS color value. E.g.: `white`, `black`, `#fafafa`, `rgb(255, 255, 128)`,
 * `rgba(117, 190, 218, 0.0)`.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value
 */
type color = [
  | `rgb(int, int, int)
  | `rgba(int, int, int, float)
  | `hsl(int, int, int)
  | `hsla(int, int, int, float)
  | `transparent
  | `hex(string)
  | `currentColor
];

/**
 * Returns a color from its red, green, and blue components.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb()
 */
let rgb: (int, int, int) => [> | color ];
/**
 * Returns a color from its red, green, blue, and alpha (transparency) components.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgba()
 */
let rgba: (int, int, int, float) => [> | color ];
/**
 * Returns a color from its hue, saturation, and lightness components.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#hsl()
 */
let hsl: (int, int, int) => [> | color ];
/**
 * Returns a color from its hue, saturation, lightness, and alpha components.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#hsla()
 */
let hsla: (int, int, int, float) => [> | color ];
/**
 * Returns a color from its hexadecimal notation.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#Syntax
 */
let hex: string => [> | color ];
/**
 * The `transparent` keyword represents a fully transparent color.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#transparent
 */
let transparent: [> | color ];
/**
 * The `currentColor` keyword represents the value of an element's color property.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#currentColor
 */
let currentColor: [> | color ];

/**
 * The `<gradient>` CSS data type is a special type of `<image>` that consists of a progressive
 * transition between two or more colors.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/gradient
 */
type gradient = [
  | `linearGradient(angle, list((int, color)))
  | `repeatingLinearGradient(angle, list((int, color)))
  | `radialGradient(list((int, color)))
  | `repeatingRadialGradient(list((int, color)))
];

/**
 * The `linear-gradient()` CSS function creates an image consisting of a progressive
 * transition between two or more colors along a straight line.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient
 */
let linearGradient: (angle, list((int, color))) => [> | gradient ];
/**
 * The `repeating-linear-gradient()` CSS function creates an image consisting of repeating linear gradients.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/repeating-linear-gradient
 */
let repeatingLinearGradient: (angle, list((int, color))) => [> | gradient ];
/**
 * The `radial-gradient()` CSS function creates an image consisting of a progressive
 * transition between two or more colors that radiate from an origin.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/radial-gradient
 */
let radialGradient: list((int, color)) => [> | gradient ];
/**
 * The `repeating-radial-gradient()` CSS function creates an image consisting of repeating gradients that radiate from an origin.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/repeating-radial-gradient
 */
let repeatingRadialGradient: list((int, color)) => [> | gradient ];

let aliceblue: [> | color ];
let antiquewhite: [> | color ];
let aqua: [> | color ];
let aquamarine: [> | color ];
let azure: [> | color ];
let beige: [> | color ];
let bisque: [> | color ];
let black: [> | color ];
let blanchedalmond: [> | color ];
let blue: [> | color ];
let blueviolet: [> | color ];
let brown: [> | color ];
let burlywood: [> | color ];
let cadetblue: [> | color ];
let chartreuse: [> | color ];
let chocolate: [> | color ];
let coral: [> | color ];
let cornflowerblue: [> | color ];
let cornsilk: [> | color ];
let crimson: [> | color ];
let cyan: [> | color ];
let darkblue: [> | color ];
let darkcyan: [> | color ];
let darkgoldenrod: [> | color ];
let darkgray: [> | color ];
let darkgrey: [> | color ];
let darkgreen: [> | color ];
let darkkhaki: [> | color ];
let darkmagenta: [> | color ];
let darkolivegreen: [> | color ];
let darkorange: [> | color ];
let darkorchid: [> | color ];
let darkred: [> | color ];
let darksalmon: [> | color ];
let darkseagreen: [> | color ];
let darkslateblue: [> | color ];
let darkslategray: [> | color ];
let darkslategrey: [> | color ];
let darkturquoise: [> | color ];
let darkviolet: [> | color ];
let deeppink: [> | color ];
let deepskyblue: [> | color ];
let dimgray: [> | color ];
let dimgrey: [> | color ];
let dodgerblue: [> | color ];
let firebrick: [> | color ];
let floralwhite: [> | color ];
let forestgreen: [> | color ];
let fuchsia: [> | color ];
let gainsboro: [> | color ];
let ghostwhite: [> | color ];
let gold: [> | color ];
let goldenrod: [> | color ];
let gray: [> | color ];
let grey: [> | color ];
let green: [> | color ];
let greenyellow: [> | color ];
let honeydew: [> | color ];
let hotpink: [> | color ];
let indianred: [> | color ];
let indigo: [> | color ];
let ivory: [> | color ];
let khaki: [> | color ];
let lavender: [> | color ];
let lavenderblush: [> | color ];
let lawngreen: [> | color ];
let lemonchiffon: [> | color ];
let lightblue: [> | color ];
let lightcoral: [> | color ];
let lightcyan: [> | color ];
let lightgoldenrodyellow: [> | color ];
let lightgray: [> | color ];
let lightgrey: [> | color ];
let lightgreen: [> | color ];
let lightpink: [> | color ];
let lightsalmon: [> | color ];
let lightseagreen: [> | color ];
let lightskyblue: [> | color ];
let lightslategray: [> | color ];
let lightslategrey: [> | color ];
let lightsteelblue: [> | color ];
let lightyellow: [> | color ];
let lime: [> | color ];
let limegreen: [> | color ];
let linen: [> | color ];
let magenta: [> | color ];
let maroon: [> | color ];
let mediumaquamarine: [> | color ];
let mediumblue: [> | color ];
let mediumorchid: [> | color ];
let mediumpurple: [> | color ];
let mediumseagreen: [> | color ];
let mediumslateblue: [> | color ];
let mediumspringgreen: [> | color ];
let mediumturquoise: [> | color ];
let mediumvioletred: [> | color ];
let midnightblue: [> | color ];
let mintcream: [> | color ];
let mistyrose: [> | color ];
let moccasin: [> | color ];
let navajowhite: [> | color ];
let navy: [> | color ];
let oldlace: [> | color ];
let olive: [> | color ];
let olivedrab: [> | color ];
let orange: [> | color ];
let orangered: [> | color ];
let orchid: [> | color ];
let palegoldenrod: [> | color ];
let palegreen: [> | color ];
let paleturquoise: [> | color ];
let palevioletred: [> | color ];
let papayawhip: [> | color ];
let peachpuff: [> | color ];
let peru: [> | color ];
let pink: [> | color ];
let plum: [> | color ];
let powderblue: [> | color ];
let purple: [> | color ];
let rebeccapurple: [> | color ];
let red: [> | color ];
let rosybrown: [> | color ];
let royalblue: [> | color ];
let saddlebrown: [> | color ];
let salmon: [> | color ];
let sandybrown: [> | color ];
let seagreen: [> | color ];
let seashell: [> | color ];
let sienna: [> | color ];
let silver: [> | color ];
let skyblue: [> | color ];
let slateblue: [> | color ];
let slategray: [> | color ];
let slategrey: [> | color ];
let snow: [> | color ];
let springgreen: [> | color ];
let steelblue: [> | color ];
let tan: [> | color ];
let teal: [> | color ];
let thistle: [> | color ];
let tomato: [> | color ];
let turquoise: [> | color ];
let violet: [> | color ];
let wheat: [> | color ];
let white: [> | color ];
let whitesmoke: [> | color ];
let yellow: [> | color ];
let yellowgreen: [> | color ];

/**
 * A CSS length. E.g. `10px`, `1rem`, `5em`.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length
 */
type length = [
  | `calc([ | `add | `sub], length, length)
  | `ch(float)
  | `cm(float)
  | `em(float)
  | `ex(float)
  | `mm(float)
  | `percent(float)
  | `pt(int)
  | `px(int)
  | `rem(float)
  | `vh(float)
  | `vmin(float)
  | `vmax(float)
  | `vw(float)
  | `zero
];

type gridLength = [ length | `fr(float)];

/**
 * Returns a length in `ch` units (width, or more precisely the advance measure, of the glyph "0").
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#ex
 */
let ch: float => [> | length ];
/**
 * Returns a length in centimeters.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#cm
 */
let cm: float => [> | length ];
/**
 * Returns a length in `em` units (calculated font-size of the element).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#em
 */
let em: float => [> | length ];
/**
 * Returns a length in `ex` units (x-height of the element's font).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#ex
 */
let ex: float => [> | length ];
/**
 * Returns a length in `flex` units (a flexible length within a grid container).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#ex
 */
let fr: float => gridLength;
/**
 * Returns a length in millimeters.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#mm
 */
let mm: float => [> | length ];
/**
 * Returns a length in percentual.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/percentage
 */
let pct: float => [> | length ];
/**
 * Returns a length in point units (`1pt` = 1/72nd of `1in`).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#rem
 */
let pt: int => [> | length ];
/**
 * Returns a length in pixels.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#px
 */
let px: int => [> | length];
/**
 * Returns a length in `rem` units (font-size of the root element).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#rem
 */
let rem: float => [> | length ];
/**
 * Returns a length in `vh` units (1% of the height of the viewport's initial containing block).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#vh
 */
let vh: float => [> | length ];
/**
 * Returns a length in `vw`/`vh` (whichever is larger) unit.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmax
 */
let vmax: float => [> | length ];
/**
 * Returns a length in `vw`/`vh` (whichever is smaller) unit.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmin
 */
let vmin: float => [> | length ];
/**
 * Returns a length in `vw` units (1% of the width of the viewport's initial containing block).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#vw
 */
let vw: float => [> | length ];
/** Returns a length of zero. */
let zero: [> | length];

/**
 * The `calc()` CSS function lets you perform calculations when specifying CSS property values.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/calc
 */
module Calc: {
  let (-): (length, length) => [> length];
  let (+): (length, length) => [> length];
};

/**
 * Returns the size of a 2D element (width and height).
 */
let size: (length, length) => [> | `size(length, length)];

/**
 * Returns a solid border style.
 */
let solid: [> | `solid];
/**
 * Returns a dotted border style.
 */
let dotted: [> | `dotted];
/**
 * Returns a dashed border style.
 */
let dashed: [> | `dashed];

/**
 * Specifies the name of a locally-installed font face using the `local()`
 * function, which uniquely identifies a single font face within a larger
 * family. The name can optionally be enclosed in quotes.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/@font-face/src#local()
 */
let localUrl: string => [> | `localUrl(string)];
/**
 * The `<url>` data type is specified using the `url()` functional notation.
 * (The `<url>` CSS data type denotes a pointer to a resource, such as an
 * image or a font.)
 * https://developer.mozilla.org/en-US/docs/Web/CSS/url#The_url()_functional_notation
 */
let url: string => [> | `url(string)];

let none: [> | `none];
let auto: [> | `auto];
let hidden: [> | `hidden];
let visible: [> | `visible];
let local: [> | `local];
let scroll: [> | `scroll];

let paddingBox: [> | `paddingBox];
let borderBox: [> | `borderBox];
let contentBox: [> | `contentBox];

let noRepeat: [> | `noRepeat];
let repeat: [> | `repeat];
let repeatX: [> | `repeatX];
let repeatY: [> | `repeatY];
let contain: [> | `contain];
let cover: [> | `cover];

let row: [> | `row];
let rowReverse: [> | `rowReverse];
let column: [> | `column];
let columnReverse: [> | `columnReverse];
let wrap: [> | `wrap];
let nowrap: [> | `nowrap];
let wrapReverse: [> | `wrapReverse];

let flexBox: [> | `flex];
let grid: [> | `grid];
let inlineGrid: [> | `inlineGrid];
let block: [> | `block];
let inline: [> | `inline];
let inlineBlock: [> | `inlineBlock];
let inlineFlex: [> | `inlineFlex];

let absolute: [> | `absolute];
let relative: [> | `relative];
let static: [> | `static];
let fixed: [> | `fixed];
let sticky: [> | `sticky];

let flexStart: [> | `flexStart];
let flexEnd: [> | `flexEnd];
let center: [> | `center];
let stretch: [> | `stretch];
let spaceBetween: [> | `spaceBetween];
let spaceAround: [> | `spaceAround];
let baseline: [> | `baseline];

let forwards: [> | `forwards];
let backwards: [> | `backwards];
let both: [> | `both];
let infinite: [> | `infinite];
let count: int => [> | `count(int)];
let paused: [> | `paused];
let running: [> | `running];

let inside: [> | `inside];
let outside: [> | `outside];

/**
 * The `translate()` CSS function repositions an element in the horizontal and/or vertical directions.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translate
 */
let translate: (length, length) => [> | `translate(length, length)];
/**
 * The `translate3d()` CSS function repositions an element in 3D space.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translate3d
 */
let translate3d:
  (length, length, length) => [> | `translate3d(length, length, length)];
/**
 * The `translateX()` CSS function repositions an element horizontally on the 2D plane.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translateX
 */
let translateX: length => [> | `translateX(length)];
/**
 * The `translateY()` CSS function repositions an element vertically on the 2D plane.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translateY
 */
let translateY: length => [> | `translateY(length)];
/**
 * The `translateZ()` CSS function repositions an element along the z-axis in 3D space.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translateZ
 */
let translateZ: length => [> | `translateZ(length)];
/**
 * The `scale()` CSS function defines a transformation that resizes an element on the 2D plane.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scale
 */
let scale: (float, float) => [> | `scale(float, float)];
/**
 * The `scale3d()` CSS function defines a transformation that resizes an element in 3D space.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scale3d
 */
let scale3d: (float, float, float) => [> | `scale3d(float, float, float)];
/**
 * The `scaleX()` CSS function defines a transformation that resizes an element along the x-axis (horizontally).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scaleX
 */
let scaleX: float => [> | `scaleX(float)];
/**
 * The `scaleY()` CSS function defines a transformation that resizes an element along the y-axis (vertically).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scaleY
 */
let scaleY: float => [> | `scaleY(float)];
/**
 * The `scaleZ()` CSS function defines a transformation that resizes an element along the z-axis.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scaleZ
 */
let scaleZ: float => [> | `scaleZ(float)];
/**
 * The `rotate()` CSS function defines a transformation that rotates an element around a fixed point on the 2D plane, without deforming it.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotate
 */
let rotate: angle => [> | `rotate(angle)];
/**
 * The `rotate3d()` CSS function defines a transformation that rotates an element around fixed axis in 3D space, without deforming it.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotate3d
 */
let rotate3d:
  (float, float, float, angle) => [> | `rotate3d(float, float, float, angle)];
/**
 * The `rotateX()` CSS function defines a transformation that rotates an element around the abscissa (horizontal axis) without deforming it.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotateX
 */
let rotateX: angle => [> | `rotateX(angle)];
/**
 * The `rotateY()` CSS function defines a transformation that rotates an element around the ordinate (vertical axis) without deforming it.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotateY
 */
let rotateY: angle => [> | `rotateY(angle)];
/**
 * The `rotateZ()` CSS function defines a transformation that rotates an element around the z-axis without deforming it.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotateZ
 */
let rotateZ: angle => [> | `rotateZ(angle)];
/**
 * The `skew()` CSS function defines a transformation that skews an element on the 2D plane.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/skew
 */
let skew: (angle, angle) => [> | `skew(angle, angle)];
/**
 * The `skewX()` CSS function defines a transformation that skews an element in the horizontal direction on the 2D plane.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/skewX
 */
let skewX: angle => [> | `skewX(angle)];
/**
 * The `skewY()` CSS function defines a transformation that skews an element in the vertical direction on the 2D plane.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/skewY
 */
let skewY: angle => [> | `skewY(angle)];

let italic: [> | `italic];
let oblique: [> | `oblique];

let underline: [> | `underline];
let overline: [> | `overline];
let lineThrough: [> | `lineThough];

let clip: [> | `clip];
let ellipsis: [> | `ellipsis];

let wavy: [> | `wavy];
let double: [> | `double];

let uppercase: [> | `uppercase];
let lowercase: [> | `lowercase];
let capitalize: [> | `capitalize];

let sub: [> | `sub];
let super: [> | `super];
let textTop: [> | `textTop];
let textBottom: [> | `textBottom];
let middle: [> | `middle];

let normal: [> | `normal];

let breakAll: [> | `breakAll];
let keepAll: [> | `keepAll];
let breakWord: [> | `breakWord];

let reverse: [> | `reverse];
let alternate: [> | `alternate];
let alternateReverse: [> | `alternateReverse];

let fill: [> | `fill];
let content: [> | `content];
let maxContent: [> | `maxContent];
let minContent: [> | `minContent];
let fitContent: [> | `fitContent];

let all: [> | `all];
let text: [> | `text];

let linear: [> | `linear];
let ease: [> | `ease];
let easeIn: [> | `easeIn];
let easeOut: [> | `easeOut];
let easeInOut: [> | `easeInOut];
let stepStart: [> | `stepStart];
let stepEnd: [> | `stepEnd];
let steps:
  (int, [ | `start | `end_]) => [> | `steps(int, [ | `start | `end_])];
let cubicBesier:
  (float, float, float, float) =>
  [> | `cubicBezier(float, float, float, float)];

let round: [> | `round];
let miter: [> | `miter];
let bevel: [> | `bevel];
let butt: [> | `butt];
let square: [> | `square];

/********************************************************
 ******************** PROPERTIES ************************
 ********************************************************/

/** Builds a rule from a property/value string pair. */
let unsafe: (string, string) => rule;

/*
 * Layout
 */

/**
 * The display CSS property specifies the type of rendering box used for an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/display
 */
let display:
  [
    | `flex
    | `block
    | `inline
    | `inlineBlock
    | `none
    | `inlineFlex
    | `grid
    | `inlineGrid
  ] =>
  rule;
let position: [ | `absolute | `relative | `static | `fixed | `sticky] => rule;

/**
 * The `top` CSS property participates in specifying the vertical position of
 * a positioned element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/top
 */
let top: [ length] => rule;
/**
 * The `bottom` CSS property participates in specifying the vertical position of
 * a positioned element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/bottom
 */
let bottom: [ length] => rule;
/**
 * The `left` CSS property participates in specifying the horizontal position
 * of a positioned element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/left
 */
let left: [ length] => rule;
/**
 * The `right` CSS property participates in specifying the horizontal position
 * of a positioned element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/right
 */
let right: [ length] => rule;

/**
 * The `flex` CSS property specifies how a flex item will grow or shrink so as to fit the space available
 * in its flex container.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/flex
 */
let flex: int => rule;
/**
 * The `flex-grow` CSS property specifies the flex grow factor of a flex item.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/flex-grow
 */
let flexGrow: int => rule;
/**
 * The `flex-shrink` CSS property specifies the flex shrink factor of a flex item.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/flex-shrink
 */
let flexShrink: int => rule;
/**
 * The `flex-basis` CSS property specifies the initial main size of a flex item.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/flex-basis
 */
let flexBasis:
  [
    length
    | `auto
    | `fill
    | `content
    | `maxContent
    | `minContent
    | `fitContent
  ] =>
  rule;

/**
 * The `flex-direction` CSS property specifies how flex items are placed in the flex
 * container defining the main axis and the direction (normal or reversed).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction
 */
let flexDirection: [ | `row | `column | `rowReverse | `columnReverse] => rule;
/**
 * The CSS `flex-wrap` property specifies whether flex items are forced into a single
 * line or can be wrapped onto multiple lines.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap
 */
let flexWrap: [ | `wrap | `nowrap | `wrapReverse] => rule;
/**
 * The `order` CSS property specifies the order used to lay out a flex item in its flex container.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/order
 */
let order: int => rule;

/**
 * The `grid-template-columns` CSS property defines the line names and track sizing functions of the grid columns.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template-columns
 */
let gridTemplateColumns: list([ gridLength | `auto]) => rule;
/**
 * The `grid-template-rows` CSS property defines the line names and track sizing functions of the grid rows.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template-rows
 */
let gridTemplateRows: list([ gridLength | `auto]) => rule;
/**
 * The `grid-auto-rows` CSS property specifies the size of an implicitly-created grid row track.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-auto-rows
 */
let gridAutoRows: [ length | `auto] => rule;
/**
 * The `grid-column` CSS property is a shorthand property for `grid-column-start` and `grid-column-end`.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column
 */
let gridColumn: (int, int) => rule;
/**
 * The `grid-row` CSS property is a shorthand property for `grid-row-start` and `grid-row-end`.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-row
 */
let gridRow: (int, int) => rule;
/**
 * The `grid-column-start` CSS property specifies a grid item’s start position within the grid column.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column-start
 */
let gridColumnStart: int => rule;
/**
 * The `grid-column-end` CSS property specifies a grid item’s end position within the grid column.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column-end
 */
let gridColumnEnd: int => rule;
/**
 * The `grid-row-start` CSS property specifies a grid item’s start position within the grid row.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-row-start
 */
let gridRowStart: int => rule;
/**
 * The `grid-row-end` CSS property specifies a grid item’s end position within the grid row.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-row-end
 */
let gridRowEnd: int => rule;
/**
 * The `grid-column-gap` CSS property specifies the gutter between grid columns.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column-gap
 */
let gridColumnGap: length => rule;
/**
 * The `grid-row-gap` CSS property specifies the gutter between grid rows.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-row-gap
 */
let gridRowGap: length => rule;
/**
 * The `gap` CSS property specifies the gaps (gutters) between rows and columns. It is a shorthand for row-gap and column-gap.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/gap
 */
let gridGap: length => rule;

/**
 * The `width` property specifies the width of an element. By default, the property defines
 * the width of the content area.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/width
 */
let width: [ length | `auto] => rule;
/**
 * The `min-width` CSS property sets the minimum width of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/min-width
 */
let minWidth: [ length | `auto] => rule;
/**
 * The `max-width` CSS property sets the maximum width of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/max-width
 */
let maxWidth: [ length | `auto] => rule;
/**
 * The `height` CSS property specifies the height of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/height
 */
let height: [ length | `auto] => rule;
/**
 * The `min-height` CSS property sets the minimum height of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/min-height
 */
let minHeight: [ length | `auto] => rule;
/**
 * The `max-height` CSS property sets the maximum height of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/max-height
 */
let maxHeight: [ length | `auto] => rule;

/**
 * The `margin` CSS property sets the margin area on all four sides of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/margin
 */
let margin: [ length | `auto] => rule;
/**
 * Returns a margin from its vertical and horizontal components.
 */
let margin2: (~v: [ length | `auto], ~h: [ length | `auto]) => rule;
/**
 * Returns a margin from its top, horizontal, and bottom components.
 */
let margin3:
  (
    ~top: [ length | `auto],
    ~h: [ length | `auto],
    ~bottom: [ length | `auto]
  ) =>
  rule;
/**
 * Returns a margin from its top, right, bottom, and left components.
 */
let margin4:
  (
    ~top: [ length | `auto],
    ~right: [ length | `auto],
    ~bottom: [ length | `auto],
    ~left: [ length | `auto]
  ) =>
  rule;
/**
 * The `margin-left` CSS property sets the margin area on the left side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/margin-left
 */
let marginLeft: [ length | `auto] => rule;
/**
 * The `margin-right` CSS property sets the margin area on the right side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/margin-right
 */
let marginRight: [ length | `auto] => rule;
/**
 * The `margin-top` CSS property sets the margin area on the top side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/margin-top
 */
let marginTop: [ length | `auto] => rule;
/**
 * The `margin-bottom` CSS property sets the margin area on the bottom side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/margin-bottom
 */
let marginBottom: [ length | `auto] => rule;

/**
 * The `padding` CSS property sets the padding area on all four sides of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/padding
 */
let padding: length => rule;
/**
 * Returns a padding from its vertical and horizontal components.
 */
let padding2: (~v: length, ~h: length) => rule;
/**
 * Returns a padding from its top, horizontal, and bottom components.
 */
let padding3: (~top: length, ~h: length, ~bottom: length) => rule;
/**
 * Returns a padding from its top, right, bottom, and left components.
 */
let padding4:
  (~top: length, ~right: length, ~bottom: length, ~left: length) => rule;
/**
 * The `padding-left` CSS property sets the width of the padding area on the left side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/padding-left
 */
let paddingLeft: length => rule;
/**
 * The `padding-right` CSS property sets the width of the padding area on the right side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/padding-right
 */
let paddingRight: length => rule;
/**
 * The `padding-top` CSS property sets the width of the padding area on the top side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/padding-top
 */
let paddingTop: length => rule;
/**
 * The `padding-bottom` CSS property sets the width of the padding area on the bottom side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/padding-bottom
 */
let paddingBottom: length => rule;

/**
 * The CSS `align-content` property defines how the browser distributes space between
 * and around content items along the cross-axis of their container.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/align-content
 */
let alignContent:
  [
    | `stretch
    | `flexStart
    | `center
    | `flexEnd
    | `spaceBetween
    | `spaceAround
  ] =>
  rule;
/**
 * The CSS `align-items` property defines how the browser distributes space between
 * and around flex items along the cross-axis of their container.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/align-items
 */
let alignItems:
  [ | `stretch | `flexStart | `center | `flexEnd | `baseline] => rule;
/**
 * The `align-self` CSS property aligns flex items of the current flex line overriding
 * the `align-items` value.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/align-self
 */
let alignSelf:
  [ | `stretch | `flexStart | `center | `flexEnd | `baseline | `auto] => rule;
/**
 * The CSS `justify-content` property defines how the browser distributes space between
 * and around content items along the main axis of their container.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/justify-content
 */
let justifyContent:
  [ | `flexStart | `center | `flexEnd | `spaceBetween | `spaceAround] => rule;

/**
 * The CSS `box-sizing` property is used to alter the default CSS box model used to calculate
 * width and height of the elements.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing
 */
let boxSizing: [ | `borderBox | `contentBox] => rule;

let float: [ | `left | `right | `none] => rule;
let clear: [ | `left | `right | `both] => rule;

/**
 * The `overflow` CSS property is shorthand for the overflow-x and overflow-y properties.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/overflow
 */
let overflow: [ | `hidden | `visible | `scroll | `auto] => rule;
/**
 * The `overflow-x` property specifies whether to clip content, render a scroll bar, or
 * display overflow content of a block-level element, when it overflows at the left and
 * right edges.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-x
 */
let overflowX: [ | `hidden | `visible | `scroll | `auto] => rule;
/**
 * The `overflow-y` property specifies whether to clip content, render a scroll bar, or
 * display overflow content of a block-level element, when it overflows at the top and
 * bottom edges.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-y
 */
let overflowY: [ | `hidden | `visible | `scroll | `auto] => rule;

/**
 * The `z-index` CSS property specifies the z-order of a positioned element and its descendants.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/z-index
 */
let zIndex: int => rule;

/**
 * Style
 */
let backfaceVisibility: [ | `visible | `hidden] => rule;
/**
 * The `visibility` CSS property can show or hide an element without affecting the layout of a document.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/visibility
 */
let visibility: [ | `visible | `hidden] => rule;

/**
 * The `border` CSS property is a shorthand property for setting all individual
 * border property values at once.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border
 */
let border:
  (length, [ | `solid | `dashed | `dotted | `none], [ color]) => rule;
/**
 * The `border-width` property is a shorthand property for setting the widths on all four
 * sides of an element's border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-width
 */
let borderWidth: length => rule;
/**
 * The `border-style` CSS property is a shorthand property that sets the line style for all
 * four sides of an element's border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-style
 */
let borderStyle: [ | `solid | `dashed | `dotted | `none] => rule;
/**
 * The `border-color` CSS property is a shorthand property for setting the color of the four
 * sides of an element's border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-color
 */
let borderColor: color => rule;

/**
 * The `border-top` CSS property is a shorthand that sets the values of the top border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-top
 */
let borderTop:
  (length, [ | `solid | `dashed | `dotted | `none], [ color]) => rule;
/**
 * The `border-top-width` CSS property sets the width of the top border of a box.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width
 */
let borderTopWidth: length => rule;
/**
 * The `border-top-style` CSS property sets the line style of an element's top border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-style
 */
let borderTopStyle: [ | `solid | `dashed | `dotted | `none] => rule;
/**
 * The `border-top-color` CSS property sets the color of an element's top border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-color
 */
let borderTopColor: color => rule;
/**
 * The `border-bottom` CSS property is a shorthand that sets the values of the bottom border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom
 */
let borderBottom:
  (length, [ | `solid | `dashed | `dotted | `none], [ color]) => rule;
/**
 * The `border-bottom-width` CSS property sets the width of the bottom border of a box.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-width
 */
let borderBottomWidth: length => rule;
/**
 * The `border-bottom-style` CSS property sets the line style of an element's bottom border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-style
 */
let borderBottomStyle: [ | `solid | `dashed | `dotted | `none] => rule;
/**
 * The `border-bottom-color` CSS property sets the color of an element's bottom border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-color
 */
let borderBottomColor: color => rule;
/**
 * The `border-left` CSS property is a shorthand that sets the values of the left border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-left
 */
let borderLeft:
  (length, [ | `solid | `dashed | `dotted | `none], [ color]) => rule;
/**
 * The `border-left-width` CSS property sets the width of the left border of a box.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-width
 */
let borderLeftWidth: length => rule;
/**
 * The `border-left-style` CSS property sets the line style of an element's left border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-style
 */
let borderLeftStyle: [ | `solid | `dashed | `dotted | `none] => rule;
/**
 * The `border-left-color` CSS property sets the color of an element's left border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-color
 */
let borderLeftColor: color => rule;
/**
 * The `border-right` CSS property is a shorthand that sets the values of the right border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-right
 */
let borderRight: (length, [ | `solid | `dashed | `dotted], [ color]) => rule;
/**
 * The `border-right-width` CSS property sets the width of the right border of a box.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-width
 */
let borderRightWidth: length => rule;
/**
 * The `border-right-style` CSS property sets the line style of an element's right border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-style
 */
let borderRightStyle: [ | `solid | `dashed | `dotted | `none] => rule;
/**
 * The `border-right-color` CSS property sets the color of an element's right border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-color
 */
let borderRightColor: color => rule;

/**
 * The `border-radius` CSS property allows Web authors to define how rounded border corners are.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius
 */
let borderRadius: length => rule;
/**
 * The `border-top-left-radius` CSS property sets the rounding of the top-left corner of the element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius
 */
let borderTopLeftRadius: length => rule;
/**
 * The `border-top-right-radius` CSS property sets the rounding of the top-right corner of the element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius
 */
let borderTopRightRadius: length => rule;
/**
 * The `border-bottom-left-radius` CSS property sets the rounding of the bottom-left corner of the element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius
 */
let borderBottomLeftRadius: length => rule;
/**
 * The `border-bottom-right-radius` CSS property sets the rounding of the bottom-right corner of the element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius
 */
let borderBottomRightRadius: length => rule;

let tableLayout: [ | `auto | `fixed] => rule;
let borderCollapse: [ | `separate | `collapse] => rule;
let borderSpacing: length => rule;

/**
 * The `box-shadow` CSS property is used to add shadow effects around an element's frame.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow
 */
let boxShadow:
  (
    ~x: length=?,
    ~y: length=?,
    ~blur: length=?,
    ~spread: length=?,
    ~inset: bool=?,
    color
  ) =>
  [> | `shadow(string)];
/**
 * Builds multiple box shadows.
 */
let boxShadows: list([ | `shadow(string)]) => rule;

/**
 * The CSS `background` shorthand property lets you adjust all of the available background
 * style options at once.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/background
 */
let background: [ color | `url(string) | gradient | `none] => rule;
/**
 * The `background-color` CSS property sets the background color of an element,
 * using a color value.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/background-color
 */
let backgroundColor: [ color] => rule;
/**
 * The `background-image` CSS property sets one or more background images on an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/background-image
 */
let backgroundImage: [ | `url(string) | gradient | `none] => rule;
/**
 * If a `background-image` is specified, the `background-attachment` CSS property
 * determines whether that image's position is fixed within the viewport,
 * or scrolls along with its containing block.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment
 */
let backgroundAttachment: [ | `scroll | `fixed | `local] => rule;
let backgroundClip: [ | `borderBox | `contentBox | `paddingBox] => rule;
let backgroundOrigin: [ | `borderBox | `contentBox | `paddingBox] => rule;
/**
 * The `background-position` CSS property sets the initial position for each defined
 * background image, relative to the background position layer defined by
 * `background-origin`.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/background-position
 */
let backgroundPosition: ([ length], [ length]) => rule;
/**
 * The `background-repeat` CSS property defines how background images are repeated.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat
 */
let backgroundRepeat: [ | `repeat | `noRepeat | `repeatX | `repeatY] => rule;
/**
 * The `background-size` CSS property specifies the size of an element's background image.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/background-size
 */
let backgroundSize:
  [ | `size(length, length) | `auto | `cover | `contain] => rule;

/**
 * The `cursor` CSS property specifies which mouse cursor to display when the mouse pointer is over an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/cursor
 */
let cursor:
  [
    | `pointer
    | `alias
    | `allScroll
    | `auto
    | `cell
    | `contextMenu
    | `default
    | `none
    | `crosshair
    | `copy
    | `grab
    | `grabbing
    | `help
    | `move
    | `notAllowed
    | `progress
    | `text
    | `wait
    | `zoomIn
    | `zoomOut
  ] =>
  rule;

let clipPath: [ | `url(string)] => rule;

type listStyleType = [
  | `disc
  | `circle
  | `square
  | `decimal
  | `lowerAlpha
  | `upperAlpha
  | `lowerGreek
  | `lowerLatin
  | `upperLatin
  | `lowerRoman
  | `upperRoman
  | `none
];
let listStyle:
  (listStyleType, [ | `inside | `outside], [ | `none | `url(string)]) => rule;
/**
 * The `list-style-type` CSS property specifies the appearance of a list item element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type
 */
let listStyleType: listStyleType => rule;
/**
 * The `list-style-position` property specifies the position of the marker box in the principal block box.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-position
 */
let listStylePosition: [ | `inside | `outside] => rule;
/**
 * The `list-style-image` property specifies an image to be used as the list item marker.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-image
 */
let listStyleImage: [ | `none | `url(string)] => rule;

/**
 * The `opacity` CSS property specifies the level of transparency of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/opacity
 */
let opacity: float => rule;

type outlineStyle = [
  | `none
  | `hidden
  | `dotted
  | `dashed
  | `solid
  | `double
  | `groove
  | `ridge
  | `inset
  | `outset
];
/**
 * The `outline` CSS property is a shorthand property for setting one or more
 * of the individual outline properties outline-style, outline-width, and
 * outline-color in a single declaration.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/outline
 */
let outline: (length, outlineStyle, color) => rule;
/**
 * The `outline-style` CSS property sets the style of an element's outline.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/outline-style
 */
let outlineStyle: outlineStyle => rule;
/**
 * The `outline-width` CSS property sets the width (thickness) of an element's outline.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/outline-width
 */
let outlineWidth: length => rule;
/**
 * The `outline-color` CSS property sets the color of an element's outline.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/outline-color
 */
let outlineColor: color => rule;
/**
 * The `outline-offset` CSS property sets the amount of space between an outline and the edge or border of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/outline-offset
 */
let outlineOffset: length => rule;

let pointerEvents: [ | `auto | `none] => rule;

/*
 * Text
 */

type fontStyle = [ | `italic | `normal | `oblique];

/**
 * The `color` CSS property sets the foreground color value of an element's text content
 * and text decorations.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color
 */
let color: color => rule;
/**
 * The `font-family` CSS property specifies a prioritized list of one or more font family
 * names and/or generic family names for the selected element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/font-family
 */
let fontFamily: string => rule;
let fontFace:
  (
    ~fontFamily: string,
    ~src: list([< | `localUrl(string) | `url(string)]),
    ~fontStyle: fontStyle=?,
    ~fontWeight: int=?,
    unit
  ) =>
  'style;
/**
 * The `font-size` CSS property specifies the size of the font.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/font-size
 */
let fontSize: length => rule;
/**
 * The `font-variant` CSS property is a shorthand for the longhand properties
 * `font-variant-caps`, `font-variant-numeric`, `font-variant-alternates`, `font-variant-ligatures`,
 * and `font-variant-east-asian`.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant
 */
let fontVariant: [ | `normal | `smallCaps] => rule;
/**
 * The `font-style` CSS property specifies whether a font should be styled with a normal,
 *  italic, or oblique face from its font-family.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/font-style
 */
let fontStyle: fontStyle => rule;
/**
 * The `font-weight` CSS property specifies the weight (or boldness) of the font.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight
 */
let fontWeight: int => rule;
/**
 * The `letter-spacing` CSS property specifies the spacing behavior between text characters.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/letter-spacing
 */
let letterSpacing: [ | `normal | length] => rule;
/**
 * The `line-height` CSS property sets the amount of space used for lines, such as in text.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/line-height
 */
let lineHeight: float => rule;
/**
 * The `text-align` CSS property describes how inline content like text is aligned in its parent block element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-align
 */
let textAlign: [ | `left | `center | `right | `justify] => rule;
/**
 * The `text-decoration` CSS property specifies the appearance of decorative lines used on text.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration
 */
let textDecoration: [ | `none | `underline | `overline | `lineThrough] => rule;
/**
 * The `text-decoration-color` CSS property sets the color of the decorative additions to text that are specified by text-decoration-line.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-color
 */
let textDecorationColor: color => rule;
/**
 * The `text-decoration-style` CSS property sets the style of the lines specified by text-decoration-line.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-style
 */
let textDecorationStyle:
  [ | `wavy | `solid | `dotted | `dashed | `double] => rule;
/**
 * The `text-indent` CSS property specifies the amount of indentation (empty space) that is put before lines of text in a block.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent
 */
let textIndent: length => rule;
/**
 * The `text-overflow` CSS property determines how overflowed content that is not displayed is signaled to users.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-overflow
 */
let textOverflow: [ | `clip | `ellipsis | `string(string)] => rule;
/**
 * The `text-shadow` CSS property adds shadows to text.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow
 */
let textShadow: (~x: length=?, ~y: length=?, ~blur: length=?, color) => rule;
/**
 * The `text-transform` CSS property specifies how to capitalize an element's text.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform
 */
let textTransform: [ | `uppercase | `lowercase | `capitalize | `none] => rule;
let userSelect: [ | `auto | `all | `text | `none] => rule;
let verticalAlign:
  [
    | `baseline
    | length
    | `sub
    | `super
    | `top
    | `textTop
    | `middle
    | `bottom
    | `textBottom
  ] =>
  rule;
/**
 * The `white-space` CSS property determines how whitespace inside an element is handled.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/white-space
 */
let whiteSpace: [ | `normal | `nowrap | `pre | `preLine | `preWrap] => rule;
let wordBreak: [ | `breakAll | `keepAll | `normal] => rule;
let wordSpacing: [ | `normal | length] => rule;
/**
 * The `overflow-wrap` CSS property specifies whether or not the browser should insert line breaks within words
 * to prevent text from overflowing its content box.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-wrap
 */
let wordWrap: [ | `normal | `breakWord] => rule;

/*
 * Transform
 */

type transform = [
  | `translate(length, length)
  | `translate3d(length, length, length)
  | `translateX(length)
  | `translateY(length)
  | `translateZ(length)
  | `scale(float, float)
  | `scale3d(float, float, float)
  | `scaleX(float)
  | `scaleY(float)
  | `scaleZ(float)
  | `rotate(angle)
  | `rotate3d(float, float, float, angle)
  | `rotateX(angle)
  | `rotateY(angle)
  | `rotateZ(angle)
  | `skew(angle, angle)
  | `skewX(angle)
  | `skewY(angle)
  | `perspective(int)
];

/**
 * The `transform` CSS property lets you modify the coordinate space of the CSS visual formatting model.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform
 */
let transform: transform => rule;
/**
 * Builds multiple transforms.
 */
let transforms: list(transform) => rule;
let transformOrigin: (length, length) => rule;
let transformOrigin3d: (length, length, length) => rule;
let transformStyle: [ | `preserve3d | `flat] => rule;
/**
 * The `perspective()` CSS function defines a transformation that sets the distance between the user and the z=0 plane.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/perspective
 */
let perspective: [ | `none | length] => rule;
let perspectiveOrigin: (length, length) => rule;

/**
  * Transition
  */
type timingFunction = [
  | `linear
  | `ease
  | `easeIn
  | `easeOut
  | `easeInOut
  | `stepStart
  | `stepEnd
  | `steps(int, [ | `start | `end_])
  | `cubicBezier(float, float, float, float)
];
/**
 * The `transition` CSS property is a shorthand property for transition-property,
 * transition-duration, transition-timing-function, and transition-delay.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transition
 */
let transition:
  (
    ~duration: int=?,
    ~delay: int=?,
    ~timingFunction: timingFunction=?,
    string
  ) =>
  [> | `transition(string)];
let transitions: list([ | `transition(string)]) => rule;
/**
 * The `transition-delay` CSS property specifies the amount of time to wait between
 * a change being requested to a property that is to be transitioned and the start
 * of the transition effect.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transition-delay
 */
let transitionDelay: int => rule;
/**
 * The `transition-duration` CSS property specifies the number of seconds or milliseconds
 * a transition animation should take to complete.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transition-duration
 */
let transitionDuration: int => rule;
/**
 * The `transition-timing-function` CSS property is used to describe how the intermediate
 * values of the CSS properties being affected by a transition effect are calculated.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transition-timing-function
 */
let transitionTimingFunction: timingFunction => rule;
/**
 * The `transition-property` CSS property is used to specify the names of CSS properties
 * to which a transition effect should be applied.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transition-property
 */
let transitionProperty: string => rule;

/*
 * Animation
 */

type animation;
/** Builds a `@keyframe` at-rule from a list of keyframe blocks. */
let keyframes: list((int, list(rule))) => animation;

/**
 * Returns a keyframe at-rule body. E.g.:
 * ```css
 * {
 *   0%: {
 *     opacity: 0;
 *     transform: scale(0.1, 0.1)
 *   }
 *   100%: {
 *     opacity: 1;
 *     transform: scale(1, 1)
 *   }
 *   60%: {
 *     opacity: 1;
 *     transform: scale(1.2, 1.2)
 *   }
 * }
 * ```
 */
let animationBody: animation => 'style;

type animationDirection = [
  | `normal
  | `reverse
  | `alternate
  | `alternateReverse
];

type animationFillMode = [ | `none | `forwards | `backwards | `both];
type animationIterationCount = [ | `infinite | `count(int)];
type animationPlayState = [ | `paused | `running];

let animation:
  (
    ~duration: int=?,
    ~delay: int=?,
    ~direction: animationDirection=?,
    ~timingFunction: timingFunction=?,
    ~fillMode: animationFillMode=?,
    ~playState: animationPlayState=?,
    ~iterationCount: animationIterationCount=?,
    animation
  ) =>
  [> | `animation(string)];
let animations: list([ | `animation(string)]) => rule;

let animationDelay: int => rule;
let animationDirection: animationDirection => rule;
let animationDuration: int => rule;
/**
 * The `animation-fill-mode` CSS property specifies how a CSS animation should apply styles
 * to its target before and after its execution.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/animation-fill-mode
 */
let animationFillMode: animationFillMode => rule;
/**
 * The `animation-iteration-count` CSS property specifies the number of times an animation
 * cycle should be played before stopping.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/animation-iteration-count
 */
let animationIterationCount: [ | `infinite | `count(int)] => rule;
/**
 * The `animation-name` CSS property specifies one or more animations that should be applied to an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/animation-name
 */
let animationName: animation => rule;
/**
 * The `animation-play-state` CSS property specifies whether an animation is running or paused.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/animation-play-state
 */
let animationPlayState: [ | `paused | `running] => rule;
/**
 * The `animation-timing-function` CSS property specifies how a CSS animation should
 * progress over the duration of each cycle.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/animation-timing-function
 */
let animationTimingFunction: timingFunction => rule;

/*
 * selectors
 */
/** Builds a rule from a descriptor and a list of rules. */
let selector: (string, list(rule)) => rule;
/**
 * The `:active` CSS pseudo-class represents an element (such as a button) that is being
 * activated by the user.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:active
 */
let active: list(rule) => rule;
/**
 * In CSS, `::after` creates a pseudo-element that is the last child of the selected element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/::after
 */
let after: list(rule) => rule;
/**
 * In CSS, `::before` creates a pseudo-element that is the first child of the selected element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/::before
 */
let before: list(rule) => rule;
/**
 * Selects all the children of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/Child_selectors
 */
let children: list(rule) => rule;
/**
 * The `:disabled` CSS pseudo-class represents any disabled element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:disabled
 */
let disabled: list(rule) => rule;
/**
 * The `:first-child` CSS pseudo-class represents the first element among a group of sibling elements.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:first-child
 */
let firstChild: list(rule) => rule;
/**
 * The `:first-of-type` CSS pseudo-class represents the first element of its type among a group of sibling elements.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:first-of-type
 */
let firstOfType: list(rule) => rule;
/**
 * The `:focus` CSS pseudo-class represents an element (such as a form
 * input) that has received focus.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:focus
 */
let focus: list(rule) => rule;
/**
 * The `:hover` CSS pseudo-class matches when the user interacts with an element with a
 * pointing device, but does not necessarily activate it.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:hover
 */
let hover: list(rule) => rule;
/**
 * The `:last-child` CSS pseudo-class represents the last element among a group of sibling elements.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:last-child
 */
let lastChild: list(rule) => rule;
/**
 * The `:last-of-type` CSS pseudo-class represents the last element of its type among a group of sibling elements.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:last-of-type
 */
let lastOfType: list(rule) => rule;
/**
 * The `:link` CSS pseudo-class represents an element that has not yet been visited.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:link
 */
let link: list(rule) => rule;
/**
 * The `:read-only` CSS pseudo-class represents an element (such as a
 * locked text input) that is not editable by the user.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:read-only
 */
let readOnly: list(rule) => rule;
/**
 * The `:required` CSS pseudo-class represents any <input>, <select>,
 * or <textarea> element that has the required attribute set on it.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:required
 */
let required: list(rule) => rule;
/**
 * The `:visited` CSS pseudo-class represents links that the user has already visited.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:visited
 */
let visited: list(rule) => rule;
let enabled: list(rule) => rule;
let noContent: list(rule) => rule;
let default: list(rule) => rule;
let anyLink: list(rule) => rule;
let onlyChild: list(rule) => rule;
let onlyOfType: list(rule) => rule;
let optional: list(rule) => rule;
let invalid: list(rule) => rule;
let outOfRange: list(rule) => rule;
let target: list(rule) => rule;
let firstLine: list(rule) => rule;
let firstLetter: list(rule) => rule;
let selection: list(rule) => rule;
let placeholder: list(rule) => rule;

/**
 * The `@media` CSS at-rule can be used to apply styles based on the result of one or more media queries,
 * which test a device's type, specific characteristics, and environment.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/@media
 */
let media: (string, list(rule)) => rule;

/*
 * SVG
 */

/**
 * Scalable Vector Graphics (SVG) is an XML-based markup language for describing two dimensional based vector graphics.
 * https://developer.mozilla.org/en-US/docs/Web/SVG
 */
module SVG: {
  /**
   * For shapes and text, the `fill` attribute is a presentation attribute that define the color of the interior of the given graphical element.
   * https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill
   */
  let fill: color => rule;
  let fillRule: [ | `nonzero | `evenodd] => rule;
  /**
   * This attribute specifies the opacity of the color or the content the current object is filled with.
   * https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-opacity
   */
  let fillOpacity: float => rule;
  /**
   * The `stroke` attribute defines the color of the outline on a given graphical element.
   * https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke
   */
  let stroke: color => rule;
  let strokeLinecap: [ | `butt | `round | `square] => rule;
  let strokeLinejoin: [ | `miter | `round | `bevel] => rule;
  let strokeMiterlimit: float => rule;
  /**
   * the `stroke-width` attribute specifies the width of the outline on the current object.
   * https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-width
   */
  let strokeWidth: length => rule;
  /**
   * the `stroke-opacity` attribute specifies the opacity of the outline on the current object.
   * https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-opacity
   */
  let strokeOpacity: float => rule;
  let stopColor: color => rule;
  let stopOpacity: float => rule;
};

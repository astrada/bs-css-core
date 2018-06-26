/* Based on https://github.com/SentiaAnalytics/bs-css/blob/master/src/Css.rei */
/* TYPES */

/***
 * A generic JS object that collects CSS declarations/rules.
 * For example:
 {
   "backgroundColor": "white",
   "padding": "15px",
   "animationName": {
     "0%": {"opacity": "0", "transform": "scale(0.1, 0.1)"},
     "100%": {"opacity": "1", "transform": "scale(1, 1)"},
     "60%": {"opacity": "1", "transform": "scale(1.2, 1.2)"}
    }
  }
 */
type styleObject('style) = Js.t({..} as 'style);


/***
 * A CSS rule. It can be a simple property/value pair (e.g.: { color: white }),
 * or a CSS ruleset (e.g.:
 :hover {
   color: orange;
 }
 */
type rule;


/***
 * A CSS color value. E.g.: white, black, #fafafa, rgb(255, 255, 128),
 * rgba(117, 190, 218, 0.0).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value
 */
type color;


/***
 * A CSS length. E.g. 10px, 1rem, 5em.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length
 */
type cssunit;


/***
 * A CSS angle. E.g.: 90deg, 100grad, 1rad, 0.25turn.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/angle
 */
type angle;


/***
 * One or more keyframe rules. E.g.:
 animation-name: {
   0%: {opacity: 0; transform: scale(0.1, 0.1)};
   100%: {opacity: 1; transform: scale(1, 1)};
   60%: {opacity: 1; transform: scale(1.2, 1.2)}
 }
 * https://developer.mozilla.org/en-US/docs/Web/CSS/@keyframes
 */
type keyframeObject;


/***
 * A transform declaration. E.g.:
 { transform: scale(2, 0.5); }
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform
 */
type transform;

/* GENERIC RULES */

/*** Returns an empty style object. */
let empty: unit => styleObject('style);

let unsafeValue: string => 'a;

let label: string => rule;


/***
 * Builds a style object from a list of rules.
 * E.g.:
 style([
   backgroundColor(white),
   padding(px(15))
 ])
 returns:
 {
   "backgroundColor": "white",
   "padding": "15px"
 }
 */
let style: list(rule) => styleObject('style);


/*** Builds a keyframe rule from a list of keyframe blocks. */
let keyframes: list((string, list(rule))) => keyframeObject;


/*** Builds a rule from a property/value string pair. */
let unsafe: (string, 'a) => rule;


/*** Builds a rule from a descriptor and a list of rules. */
let selector: (string, list(rule)) => rule;


/***
 * Marks a rule as important. E.g.: { color: red !important }
 * https://www.w3.org/TR/css3-cascade/#importance
 */
let important: rule => rule;

/* ANGLES */

/***
 * Returns an angle in radians.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/angle#rad
 */
let rad: float => angle;


/***
 * Returns an angle in gradians.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/angle#grad
 */
let grad: float => angle;


/***
 * Returns an angle in degrees.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/angle#deg
 */
let deg: float => angle;


/***
 * Returns an angle in number of turns.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/angle#turn
 */
let turn: float => angle;

/* LENGTHS */

/***
 * Returns a length in pixels.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#px
 */
let px: int => cssunit;


/***
 * Returns a length in percentual.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/percentage
 */
let pct: float => cssunit;


/***
 * Returns a length in rem units (font-size of the root element).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#rem
 */
let rem: float => cssunit;


/***
 * Returns a length in em units (calculated font-size of the element).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#em
 */
let em: float => cssunit;


/***
 * Returns a length in ex units (x-height of the element's font).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#ex
 */
let ex: float => cssunit;


/***
 * Returns a length in ch units (width, or more precisely the advance measure, of the glyph "0").
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#ex
 */
let ch: float => cssunit;


/***
 * Returns a length in vh units (1% of the height of the viewport's initial containing block).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#vh
 */
let vh: float => cssunit;


/***
 * Returns a length in vw units (1% of the width of the viewport's initial containing block).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#vw
 */
let vw: float => cssunit;

let vmin: float => cssunit;

let vmax: float => cssunit;


/***
 * Returns a length in centimeters.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#cm
 */
let cm: float => cssunit;


/***
 * Returns a length in millimeters.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#mm
 */
let mm: float => cssunit;


/***
 * Returns a length in quarters of a millimiter.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#q
 */
let q: float => cssunit;


/***
 * Returns a length in inches.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#in
 */
let inch: float => cssunit;


/***
 * Returns a length in picas (1 pica = 12 points).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/length#pc
 */
let pc: float => cssunit;


/*** Returns a length of zero. */
let zero: cssunit;


/*** Used to specify an auto height/lenght. */
let auto: cssunit;

/* COLORS */

/***
 * Returns a color from its red, green, and blue components.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb()
 */
let rgb: (int, int, int) => color;


/***
 * Returns a color from its red, green, blue, and alpha (transparency) components.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgba()
 */
let rgba: (int, int, int, float) => color;


/***
 * Returns a color from its hue, saturation, and lightness components.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#hsl()
 */
let hsl: (angle, int, int) => color;


/***
 * Returns a color from its hue, saturation, lightness, and alpha components.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#hsla()
 */
let hsla: (angle, int, int, float) => color;


/***
 * Returns a color from its hexadecimal notation.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#Syntax
 */
let hex: string => color;


/***
 * The currentColor keyword represents the value of an element's color property.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#currentColor
 */
let currentColor: color;


/***
 * The transparent keyword represents a fully transparent color.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#transparent
 */
let transparent: color;

/* CSS Level 1 colors. */
let black: color;

let silver: color;

let gray: color;

let white: color;

let maroon: color;

let red: color;

let purple: color;

let fuchsia: color;

let green: color;

let lime: color;

let olive: color;

let yellow: color;

let navy: color;

let blue: color;

let teal: color;

let aqua: color;

/* CSS Level 2 (Revision 1) colors. */
let orange: color;

/* CSS Color Module Level 3. */
let aliceblue: color;

let antiquewhite: color;

let aquamarine: color;

let azure: color;

let beige: color;

let bisque: color;

let blanchedalmond: color;

let blueviolet: color;

let brown: color;

let burlywood: color;

let cadetblue: color;

let chartreuse: color;

let chocolate: color;

let coral: color;

let cornflowerblue: color;

let cornsilk: color;

let crimson: color;

let cyan: color; /*synonym of aqua*/

let darkblue: color;

let darkcyan: color;

let darkgoldenrod: color;

let darkgray: color;

let darkgreen: color;

let darkgrey: color;

let darkkhaki: color;

let darkmagenta: color;

let darkolivegreen: color;

let darkorange: color;

let darkorchid: color;

let darkred: color;

let darksalmon: color;

let darkseagreen: color;

let darkslateblue: color;

let darkslategray: color;

let darkslategrey: color;

let darkturquoise: color;

let darkviolet: color;

let deeppink: color;

let deepskyblue: color;

let dimgray: color;

let dimgrey: color;

let dodgerblue: color;

let firebrick: color;

let floralwhite: color;

let forestgreen: color;

let gainsboro: color;

let ghostwhite: color;

let gold: color;

let goldenrod: color;

let greenyellow: color;

let grey: color;

let honeydew: color;

let hotpink: color;

let indianred: color;

let indigo: color;

let ivory: color;

let khaki: color;

let lavender: color;

let lavenderblush: color;

let lawngreen: color;

let lemonchiffon: color;

let lightblue: color;

let lightcoral: color;

let lightcyan: color;

let lightgoldenrodyellow: color;

let lightgray: color;

let lightgreen: color;

let lightgrey: color;

let lightpink: color;

let lightsalmon: color;

let lightseagreen: color;

let lightskyblue: color;

let lightslategray: color;

let lightslategrey: color;

let lightsteelblue: color;

let lightyellow: color;

let limegreen: color;

let linen: color;

let magenta: color; /* synonym of fuchsia */

let mediumaquamarine: color;

let mediumblue: color;

let mediumorchid: color;

let mediumpurple: color;

let mediumseagreen: color;

let mediumslateblue: color;

let mediumspringgreen: color;

let mediumturquoise: color;

let mediumvioletred: color;

let midnightblue: color;

let mintcream: color;

let mistyrose: color;

let moccasin: color;

let navajowhite: color;

let oldlace: color;

let olivedrab: color;

let orangered: color;

let orchid: color;

let palegoldenrod: color;

let palegreen: color;

let paleturquoise: color;

let palevioletred: color;

let papayawhip: color;

let peachpuff: color;

let peru: color;

let pink: color;

let plum: color;

let powderblue: color;

let rosybrown: color;

let royalblue: color;

let saddlebrown: color;

let salmon: color;

let sandybrown: color;

let seagreen: color;

let seashell: color;

let sienna: color;

let skyblue: color;

let slateblue: color;

let slategray: color;

let slategrey: color;

let snow: color;

let springgreen: color;

let steelblue: color;

let tan: color;

let thistle: color;

let tomato: color;

let turquoise: color;

let violet: color;

let wheat: color;

let whitesmoke: color;

let yellowgreen: color;

/* CSS Color Module Level 4. */
let rebeccapurple: color;

/* CSS PROPERTIES */

/*** Gradient direction. */
type direction =
  | Angle(angle)
  | ToTop
  | ToBottom
  | ToLeft
  | ToRight
  | ToTopLeft
  | ToTopRight
  | ToBottomLeft
  | ToBottomRight;


/*** Gradient vertical position. */
type verticalPosition =
  | Top
  | FromTop(cssunit)
  | Center
  | Bottom
  | FromBottom(cssunit);


/*** Gradient horizontal position. */
type horizontalPosition =
  | Left
  | FromLeft(cssunit)
  | Center
  | Right
  | FromRight(cssunit);


/*** Gradient shape. */
type shape =
  | Circle
  | Ellipse;


/*** Gradient extent. */
type extent =
  | ClosestSide
  | ClosestCorner
  | FarthestSide
  | FarthestCorner;


/*** Gradient color stop. */
type colorStop = (color, cssunit);


/***
 * The <gradient> CSS data type is a special type of <image> that consists of a progressive
 * transition between two or more colors.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/gradient
 */
type gradient;


/***
 * The linear-gradient() CSS function creates an image consisting of a progressive
 * transition between two or more colors along a straight line.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient
 */
let linearGradient: (direction, list(colorStop)) => gradient;


/***
 * The radial-gradient() CSS function creates an image consisting of a progressive
 * transition between two or more colors that radiate from an origin.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/radial-gradient
 */
let radialGradient:
  (shape, verticalPosition, horizontalPosition, extent, list(colorStop)) =>
  gradient;


/***
 * The repeating-linear-gradient() CSS function creates an image consisting of repeating linear gradients.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/repeating-linear-gradient
 */
let repeatingLinearGradient: (direction, list(colorStop)) => gradient;


/***
 * The repeating-radial-gradient() CSS function creates an image consisting of repeating gradients that radiate from an origin.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/repeating-radial-gradient
 */
let repeatingRadialGradient:
  (shape, verticalPosition, horizontalPosition, extent, list(colorStop)) =>
  gradient;


/***
 * The <image> CSS data type represents a two-dimensional image.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/image
 */
type image =
  | Url(string)
  | Gradient(gradient)
  | Element(string);


/***
 * The opacity CSS property specifies the level of transparency of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/opacity
 */
let opacity: float => rule;


/*** Visibility values. */
type visibility =
  | Visible
  | Hidden
  | Collapse;


/***
 * The visibility CSS property can show or hide an element without affecting the layout of a document.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/visibility
 */
let visibility: visibility => rule;

type listStyleType =
  | Disc
  | Circle
  | Square
  | Decimal
  | DecimalLeadingZero
  | LowerRoman
  | UpperRoman
  | LowerGreek
  | LowerLatin
  | UpperLatin
  | Armenian
  | Georgian
  | LowerAlpha
  | UpperAlpha
  | None;


/***
 * The list-style-type CSS property specifies the appearance of a list item element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type
 */
let listStyleType: listStyleType => rule;

type listStyleImage =
  | None
  | Url(string);


/***
 * The list-style-image property specifies an image to be used as the list item marker.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-image
 */
let listStyleImage: listStyleImage => rule;

type listStylePosition =
  | Inside
  | Outside;


/***
 * The list-style-position property specifies the position of the marker box in the principal block box.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-position
 */
let listStylePopsition: listStylePosition => rule;

/* BACKGROUND */

/***
 * The background-image CSS property sets one or more background images on an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/background-image
 */
let backgroundImage: string => rule;


/***
 * Sets a gradient as a background-image.
 */
let backgroundGradient: gradient => rule;

type backgroundAttachment =
  | Scroll
  | Fixed
  | Local
  | Initial;


/***
 * If a background-image is specified, the background-attachment CSS property
 * determines whether that image's position is fixed within the viewport,
 * or scrolls along with its containing block.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment
 */
let backgroundAttachment: backgroundAttachment => rule;


/***
 * The background-color CSS property sets the background color of an element,
 * using a color value.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/background-color
 */
let backgroundColor: color => rule;

type backgroundSize =
  | Cover
  | Contain
  | Width(cssunit)
  | Height(cssunit)
  | Custom(cssunit, cssunit);


/***
 * The background-size CSS property specifies the size of an element's background image.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/background-size
 */
let backgroundSize: backgroundSize => rule;

type backgroundPosition =
  | Top
  | Bottom
  | Left
  | Right
  | Center
  | Custom(cssunit, cssunit);


/***
 * The background-position CSS property sets the initial position for each defined
 * background image, relative to the background position layer defined by
 * background-origin.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/background-position
 */
let backgroundPosition: backgroundPosition => rule;

type backgroundRepeat =
  | RepeatX
  | RepeatY
  | Repeat
  | Space
  | Round
  | NoRepeat;


/***
 * The background-repeat CSS property defines how background images are repeated.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat
 */
let backgroundRepeat: backgroundRepeat => rule;

type background =
  | None
  | Color(color)
  | Image(string)
  | Gradient(gradient);


/***
 * The CSS background shorthand property lets you adjust all of the available background
 * style options at once.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/background
 */
let background: background => rule;

/* TEXT */

/***
 * The color CSS property sets the foreground color value of an element's text content
 * and text decorations.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/color
 */
let color: color => rule;


/***
 * The font-family CSS property specifies a prioritized list of one or more font family
 * names and/or generic family names for the selected element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/font-family
 */
let fontFamily: string => rule;


/***
 * The font-size CSS property specifies the size of the font.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/font-size
 */
let fontSize: cssunit => rule;

type fontStyle =
  | Normal
  | Italic
  | Oblique;


/***
 * The font-style CSS property specifies whether a font should be styled with a normal,
 *  italic, or oblique face from its font-family.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/font-style
 */
let fontStyle: fontStyle => rule;

type fontWeight =
  | Normal
  | Bold
  | W100
  | W200
  | W300
  | W400
  | W500
  | W600
  | W700
  | W800
  | W900;


/***
 * The font-weight CSS property specifies the weight (or boldness) of the font.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight
 */
let fontWeight: fontWeight => rule;

type fontVariant =
  | Normal
  | SmallCaps;


/***
 * The font-variant CSS property is a shorthand for the longhand properties
 * font-variant-caps, font-variant-numeric, font-variant-alternates, font-variant-ligatures,
 * and font-variant-east-asian.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant
 */
let fontVariant: fontVariant => rule;

type textDecoration =
  | None
  | Underline(color)
  | UnderlineWavy(color);


/***
 * The text-decoration CSS property specifies the appearance of decorative lines used on text.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration
 */
[@deprecated "Use the individual textDecoration properties instead"]
let textDecoration: textDecoration => rule;

type textDecorationLineValue =
  | Underline
  | Overline
  | LineThrough;

type textDecorationLine =
  | None
  | Values(list(textDecorationLineValue));


/***
 * The text-decoration-line CSS property sets the kind of decoration that is used on text in an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line
 */
let textDecorationLine: textDecorationLine => rule;

type textDecorationStyle =
  | Solid
  | Double
  | Dotted
  | Dashed
  | Wavy;


/***
 * The text-decoration-style CSS property sets the style of the lines specified by text-decoration-line.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-style
 */
let textDecorationStyle: textDecorationStyle => rule;


/***
 * The text-decoration-color CSS property sets the color of the decorative additions to text that are specified by text-decoration-line.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-color
 */
let textDecorationColor: color => rule;

type textAlign =
  | Auto
  | Left
  | Right
  | Center
  | Justify;


/***
 * The text-align CSS property describes how inline content like text is aligned in its parent block element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-align
 */
let textAlign: textAlign => rule;


/***
 * The text-indent CSS property specifies the amount of indentation (empty space) that is put before lines of text in a block.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent
 */
let textIndent: cssunit => rule;


/***
 * The text-shadow CSS property adds shadows to text.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow
 */
let textShadow: (cssunit, cssunit, color) => rule;

type textTransform =
  | None
  | Uppercase
  | Lowercase
  | Capitalize
  | FullWidth;


/***
 * The text-transform CSS property specifies how to capitalize an element's text.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform
 */
let textTransform: textTransform => rule;

type textOverflow =
  | Clip
  | Ellipsis;


/***
 * The text-overflow CSS property determines how overflowed content that is not displayed is signaled to users.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/text-overflow
 */
let textOverflow: textOverflow => rule;

type overflowWrap =
  | Normal
  | BreakWord;


/***
 * The overflow-wrap CSS property specifies whether or not the browser should insert line breaks within words
 * to prevent text from overflowing its content box.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-wrap
 */
let overflowWrap: overflowWrap => rule;


/***
 * The overflow-wrap CSS property specifies whether or not the browser should insert line breaks within words
 * to prevent text from overflowing its content box.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-wrap
 */
let wordWrap: overflowWrap => rule;


/***
 * The letter-spacing CSS property specifies the spacing behavior between text characters.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/letter-spacing
 */
let letterSpacing: cssunit => rule;


/***
 * The line-height CSS property sets the amount of space used for lines, such as in text.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/line-height
 */
let lineHeight: cssunit => rule;

/* BORDER */

/***
 * The border-width property is a shorthand property for setting the widths on all four
 * sides of an element's border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-width
 */
let borderWidth: cssunit => rule;


/***
 * The border-top-width CSS property sets the width of the top border of a box.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width
 */
let borderTopWidth: cssunit => rule;


/***
 * The border-bottom-width CSS property sets the width of the bottom border of a box.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-width
 */
let borderBottomWidth: cssunit => rule;


/***
 * The border-left-width CSS property sets the width of the left border of a box.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-width
 */
let borderLeftWidth: cssunit => rule;


/***
 * The border-right-width CSS property sets the width of the right border of a box.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-width
 */
let borderRightWidth: cssunit => rule;

type borderStyle =
  | None
  | Hidden
  | Solid
  | Dotted
  | Dashed
  | Double;


/***
 * The border CSS property is a shorthand property for setting all individual
 * border property values at once.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border
 */
let border: (cssunit, borderStyle, color) => rule;


/***
 * The border-top CSS property is a shorthand that sets the values of the top border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-top
 */
let borderTop: (cssunit, borderStyle, color) => rule;


/***
 * The border-bottom CSS property is a shorthand that sets the values of the bottom border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom
 */
let borderBottom: (cssunit, borderStyle, color) => rule;


/***
 * The border-left CSS property is a shorthand that sets the values of the left border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-left
 */
let borderLeft: (cssunit, borderStyle, color) => rule;


/***
 * The border-right CSS property is a shorthand that sets the values of the right border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-right
 */
let borderRight: (cssunit, borderStyle, color) => rule;


/***
 * The border-style CSS property is a shorthand property that sets the line style for all
 * four sides of an element's border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-style
 */
let borderStyle: borderStyle => rule;


/***
 * The border-top-style CSS property sets the line style of an element's top border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-style
 */
let borderTopStyle: borderStyle => rule;


/***
 * The border-bottom-style CSS property sets the line style of an element's bottom border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-style
 */
let borderBottomStyle: borderStyle => rule;


/***
 * The border-left-style CSS property sets the line style of an element's left border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-style
 */
let borderLeftStyle: borderStyle => rule;


/***
 * The border-right-style CSS property sets the line style of an element's right border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-style
 */
let borderRightStyle: borderStyle => rule;


/***
 * The border-color CSS property is a shorthand property for setting the color of the four
 * sides of an element's border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-color
 */
let borderColor: color => rule;


/***
 * The border-top-color CSS property sets the color of an element's top border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-color
 */
let borderTopColor: color => rule;


/***
 * The border-bottom-color CSS property sets the color of an element's bottom border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-color
 */
let borderBottomColor: color => rule;


/***
 * The border-left-color CSS property sets the color of an element's left border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-color
 */
let borderLeftColor: color => rule;


/***
 * The border-right-color CSS property sets the color of an element's right border.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-color
 */
let borderRightColor: color => rule;


/***
 * The border-radius CSS property allows Web authors to define how rounded border corners are.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius
 */
let borderRadius: cssunit => rule;


/***
 * The border-top-left-radius CSS property sets the rounding of the top-left corner of the element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius
 */
let borderTopLeftRadius: cssunit => rule;


/***
 * The border-top-right-radius CSS property sets the rounding of the top-right corner of the element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius
 */
let borderTopRightRadius: cssunit => rule;


/***
 * The border-bottom-left-radius CSS property sets the rounding of the bottom-left corner of the element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius
 */
let borderBottomLeftRadius: cssunit => rule;


/***
 * The border-bottom-right-radius CSS property sets the rounding of the bottom-right corner of the element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius
 */
let borderBottomRightRadius: cssunit => rule;

/* LAYOUT */

/***
 * The width property specifies the width of an element. By default, the property defines
 * the width of the content area.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/width
 */
let width: cssunit => rule;


/***
 * The min-width CSS property sets the minimum width of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/min-width
 */
let minWidth: cssunit => rule;


/***
 * The max-width CSS property sets the maximum width of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/max-width
 */
let maxWidth: cssunit => rule;


/***
 * The height CSS property specifies the height of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/height
 */
let height: cssunit => rule;


/***
 * The min-height CSS property sets the minimum height of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/min-height
 */
let minHeight: cssunit => rule;


/***
 * The max-height CSS property sets the maximum height of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/max-height
 */
let maxHeight: cssunit => rule;


/***
 * The left CSS property participates in specifying the horizontal position
 * of a positioned element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/left
 */
let left: cssunit => rule;


/***
 * The right CSS property participates in specifying the horizontal position
 * of a positioned element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/right
 */
let right: cssunit => rule;


/***
 * The top CSS property participates in specifying the vertical position of
 * a positioned element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/top
 */
let top: cssunit => rule;


/***
 * The bottom CSS property participates in specifying the vertical position of
 * a positioned element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/bottom
 */
let bottom: cssunit => rule;


/***
 * The margin CSS property sets the margin area on all four sides of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/margin
 */
let margin: cssunit => rule;


/***
 * Returns a margin from its vertical and horizontal components.
 */
let margin2: (~v: cssunit, ~h: cssunit) => rule;


/***
 * Returns a margin from its top, horizontal, and bottom components.
 */
let margin3: (~top: cssunit, ~h: cssunit, ~bottom: cssunit) => rule;


/***
 * Returns a margin from its top, right, bottom, and left components.
 */
let margin4:
  (~top: cssunit, ~right: cssunit, ~bottom: cssunit, ~left: cssunit) => rule;


/***
 * The margin-left CSS property sets the margin area on the left side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/margin-left
 */
let marginLeft: cssunit => rule;


/***
 * The margin-right CSS property sets the margin area on the right side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/margin-right
 */
let marginRight: cssunit => rule;


/***
 * The margin-top CSS property sets the margin area on the top side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/margin-top
 */
let marginTop: cssunit => rule;


/***
 * The margin-bottom CSS property sets the margin area on the bottom side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/margin-bottom
 */
let marginBottom: cssunit => rule;


/***
 * The padding CSS property sets the padding area on all four sides of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/padding
 */
let padding: cssunit => rule;


/***
 * Returns a padding from its vertical and horizontal components.
 */
let padding2: (~v: cssunit, ~h: cssunit) => rule;


/***
 * Returns a padding from its top, horizontal, and bottom components.
 */
let padding3: (~top: cssunit, ~h: cssunit, ~bottom: cssunit) => rule;


/***
 * Returns a padding from its top, right, bottom, and left components.
 */
let padding4:
  (~top: cssunit, ~right: cssunit, ~bottom: cssunit, ~left: cssunit) => rule;


/***
 * The padding-left CSS property sets the width of the padding area on the left side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/padding-left
 */
let paddingLeft: cssunit => rule;


/***
 * The padding-right CSS property sets the width of the padding area on the right side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/padding-right
 */
let paddingRight: cssunit => rule;


/***
 * The padding-top CSS property sets the width of the padding area on the top side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/padding-top
 */
let paddingTop: cssunit => rule;


/***
 * The padding-bottom CSS property sets the width of the padding area on the bottom side of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/padding-bottom
 */
let paddingBottom: cssunit => rule;

type display =
  | Block
  | None
  | Inline
  | Flex
  | Grid
  | Subgrid
  | Contents
  | Table
  | TableRow
  | TableCell
  | TableColumn
  | InlineBlock
  | InlineTable
  | InlineFlex
  | InlineGrid;


/***
 * The display CSS property specifies the type of rendering box used for an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/display
 */
let display: display => rule;

type position =
  | Static
  | Relative
  | Absolute
  | Fixed
  | Sticky;


/***
 * The position CSS property specifies how an element is positioned in a document.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/position
 */
let position: position => rule;

type boxSizing =
  | BorderBox
  | ContentBox;


/***
 * The CSS box-sizing property is used to alter the default CSS box model used to calculate
 * width and height of the elements.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing
 */
let boxSizing: boxSizing => rule;

type overflow =
  | Visible
  | Hidden
  | Scroll
  | Auto;


/***
 * The overflow CSS property is shorthand for the overflow-x and overflow-y properties.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/overflow
 */
let overflow: overflow => rule;


/***
 * The overflow-x property specifies whether to clip content, render a scroll bar, or
 * display overflow content of a block-level element, when it overflows at the left and
 * right edges.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-x
 */
let overflowX: overflow => rule;


/***
 * The overflow-y property specifies whether to clip content, render a scroll bar, or
 * display overflow content of a block-level element, when it overflows at the top and
 * bottom edges.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-y
 */
let overflowY: overflow => rule;


/***
 * The z-index CSS property specifies the z-order of a positioned element and its descendants.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/z-index
 */
let zIndex: int => rule;

/* FLEXBOX */

/***
 * The flex CSS property specifies how a flex item will grow or shrink so as to fit the space available
 * in its flex container.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/flex
 */
let flex: int => rule;

type flexDirection =
  | Row
  | RowReverse
  | Column
  | ColumnReverse;


/***
 * The flex-direction CSS property specifies how flex items are placed in the flex
 * container defining the main axis and the direction (normal or reversed).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction
 */
let flexDirection: flexDirection => rule;


/***
 * The flex-basis CSS property specifies the initial main size of a flex item.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/flex-basis
 */
let flexBasis: cssunit => rule;


/***
 * The flex-flow CSS property is a shorthand property for flex-direction and
 * flex-wrap individual properties.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/flex-flow
 */
let flexFlow: int => rule;


/***
 * The flex-grow CSS property specifies the flex grow factor of a flex item.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/flex-grow
 */
let flexGrow: int => rule;


/***
 * The flex-shrink CSS property specifies the flex shrink factor of a flex item.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/flex-shrink
 */
let flexShrink: int => rule;

type flexWrap =
  | Wrap
  | NoWrap;


/***
 * The CSS flex-wrap property specifies whether flex items are forced into a single
 * line or can be wrapped onto multiple lines.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap
 */
let flexWrap: flexWrap => rule;

type justify =
  | FlexStart
  | FlexEnd
  | Center
  | Stretch
  | SpaceAround
  | SpaceBetween;


/***
 * The CSS align-content property defines how the browser distributes space between
 * and around content items along the cross-axis of their container.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/align-content
 */
let alignContent: justify => rule;

type alignment =
  | FlexStart
  | FlexEnd
  | Center
  | Stretch
  | Baseline;


/***
 * The CSS align-items property defines how the browser distributes space between
 * and around flex items along the cross-axis of their container.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/align-items
 */
let alignItems: alignment => rule;


/***
 * The align-self CSS property aligns flex items of the current flex line overriding
 * the align-items value.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/align-self
 */
let alignSelf: alignment => rule;


/***
 * The CSS justify-content property defines how the browser distributes space between
 * and around content items along the main axis of their container.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/justify-content
 */
let justifyContent: justify => rule;


/***
 * The order CSS property specifies the order used to lay out a flex item in its flex container.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/order
 */
let order: int => rule;

/* CSS GRID */

/***
 * The grid-template CSS property is a shorthand property for defining grid columns, rows, and areas.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template
 */
let gridTemplate: string => rule;


/***
 * The grid-template-rows CSS property defines the line names and track sizing functions of the grid rows.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template-rows
 */
let gridTemplateRows: string => rule;


/***
 * The grid-template-columns CSS property defines the line names and track sizing functions of the grid columns.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template-columns
 */
let gridTemplateColumns: string => rule;


/***
 * The grid-auto-rows CSS property specifies the size of an implicitly-created grid row track.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-auto-rows
 */
let gridAutoRows: string => rule;


/***
 * The grid-auto-columns CSS property specifies the size of an implicitly-created grid column track.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-auto-columns
 */
let gridAutoColumns: string => rule;


/***
 * The grid-auto-flow CSS property controls how the auto-placement algorithm works,
 * specifying exactly how auto-placed items get flowed into the grid.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-auto-flow
 */
let gridAutoFlow: string => rule;


/***
 * The grid-row-start CSS property specifies a grid item’s start position within the grid row.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-row-start
 */
let gridRowStart: string => rule;


/***
 * The grid-column-start CSS property specifies a grid item’s start position within the grid column.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column-start
 */
let gridColumnStart: string => rule;


/***
 * The grid-row-end CSS property specifies a grid item’s end position within the grid row.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-row-end
 */
let gridRowEnd: string => rule;


/***
 * The grid-column-end CSS property specifies a grid item’s end position within the grid column.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column-end
 */
let gridColumnEnd: string => rule;


/***
 * The grid-row CSS property is a shorthand property for grid-row-start and grid-row-end.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-row
 */
let gridRow: string => rule;


/***
 * The grid-column CSS property is a shorthand property for grid-column-start and grid-column-end.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column
 */
let gridColumn: string => rule;


/***
 * The grid-row-gap CSS property specifies the gutter between grid rows.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-row-gap
 */
let gridRowGap: cssunit => rule;


/***
 * The grid-column-gap CSS property specifies the gutter between grid columns.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column-gap
 */
let gridColumnGap: cssunit => rule;

/* SHADOW */

/*** Shadow effects. */
type shadow;


/***
 * Builds shadow effects where x is offset-x, y is offset-y, blur is blur-radius,
 * spread is spread radius, and color is the shadow color.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow
 */
let shadow:
  (
    ~x: int=?,
    ~y: int=?,
    ~blur: int=?,
    ~spread: int=?,
    ~inset: bool=?,
    color
  ) =>
  shadow;


/***
 * The box-shadow CSS property is used to add shadow effects around an element's frame.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow
 */
let boxShadow: shadow => rule;


/***
 * Builds multiple box shadows.
 */
let boxShadows: list(shadow) => rule;

/* ANIMATION */

/***
 * The animation-duration CSS property specifies the length of time that an
 * animation should take to complete one cycle.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/animation-duration
 */
let animationDuration: int => rule;


/***
 * The animation-delay CSS property specifies when an animation should start.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/animation-delay
 */
let animationDelay: int => rule;

type animationDirection =
  | Normal
  | Reverse
  | Alternate
  | AlternateReverse;


/***
 * The animation-direction CSS property specifies whether an animation should play forwards,
 * backwards, or alternating back and forth.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/animation-direction
 */
let animationDirection: animationDirection => rule;

type animationFillMode =
  | None
  | Forwards
  | Backwards
  | Both;


/***
 * The animation-fill-mode CSS property specifies how a CSS animation should apply styles
 * to its target before and after its execution.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/animation-fill-mode
 */
let animationFillMode: animationFillMode => rule;

type animationIterationCount =
  | Infinite
  | Iterate(int);


/***
 * The animation-iteration-count CSS property specifies the number of times an animation
 * cycle should be played before stopping.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/animation-iteration-count
 */
let animationIterationCount: animationIterationCount => rule;


/***
 * The animation-name CSS property specifies one or more animations that should be applied to an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/animation-name
 */
let animationName: keyframeObject => rule;

type animationPlayState =
  | Paused
  | Running;


/***
 * The animation-play-state CSS property specifies whether an animation is running or paused.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/animation-play-state
 */
let animationPlayState: animationPlayState => rule;

type animationSteps =
  | Start
  | End;

type timingFunction =
  | Ease
  | EaseIn
  | EaseOut
  | EaseInOut
  | Linear
  | StepStart
  | StepEnd
  | CubicBezier(float, float, float, float)
  | Steps(int, animationSteps)
  | Frames(int);


/***
 * The animation-timing-function CSS property specifies how a CSS animation should
 * progress over the duration of each cycle.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/animation-timing-function
 */
let animationTimingFunction: timingFunction => rule;

/* TRANSITION */

/***
 * The transition-delay CSS property specifies the amount of time to wait between
 * a change being requested to a property that is to be transitioned and the start
 * of the transition effect.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transition-delay
 */
let transitionDelay: int => rule;


/***
 * The transition-duration CSS property specifies the number of seconds or milliseconds
 * a transition animation should take to complete.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transition-duration
 */
let transitionDuration: int => rule;


/***
 * The transition-timing-function CSS property is used to describe how the intermediate
 * values of the CSS properties being affected by a transition effect are calculated.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transition-timing-function
 */
let transitionTimingFunction: timingFunction => rule;


/***
 * The transition-property CSS property is used to specify the names of CSS properties
 * to which a transition effect should be applied.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transition-property
 */
let transitionProperty: string => rule;


/***
 * The transition CSS property is a shorthand property for transition-property,
 * transition-duration, transition-timing-function, and transition-delay.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transition
 */
let transition:
  (
    ~delay: int=?,
    ~duration: int=?,
    ~timingFunction: timingFunction=?,
    string
  ) =>
  rule;

/* TRANSFORM */

/***
 * The transform CSS property lets you modify the coordinate space of the CSS visual formatting model.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform
 */
let transform: transform => rule;


/***
 * Builds multiple transforms.
 */
let transforms: list(transform) => rule;

let transformOrigin: (cssunit, cssunit) => rule;


/***
 * The translate() CSS function repositions an element in the horizontal and/or vertical directions.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translate
 */
let translate: (cssunit, cssunit) => transform;


/***
 * The translateX() CSS function repositions an element horizontally on the 2D plane.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translateX
 */
let translateX: cssunit => transform;


/***
 * The translateY() CSS function repositions an element vertically on the 2D plane.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translateY
 */
let translateY: cssunit => transform;


/***
 * The translateZ() CSS function repositions an element along the z-axis in 3D space.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translateZ
 */
let translateZ: cssunit => transform;


/***
 * The translate3d() CSS function repositions an element in 3D space.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translate3d
 */
let translate3d: (cssunit, cssunit, cssunit) => transform;


/***
 * The scale() CSS function defines a transformation that resizes an element on the 2D plane.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scale
 */
let scale: (float, float) => transform;


/***
 * The scaleX() CSS function defines a transformation that resizes an element along the x-axis (horizontally).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scaleX
 */
let scaleX: float => transform;


/***
 * The scaleY() CSS function defines a transformation that resizes an element along the y-axis (vertically).
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scaleY
 */
let scaleY: float => transform;


/***
 * The scaleZ() CSS function defines a transformation that resizes an element along the z-axis.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scaleZ
 */
let scaleZ: float => transform;


/***
 * The scale3d() CSS function defines a transformation that resizes an element in 3D space.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scale3d
 */
let scale3d: (float, float, float) => transform;


/***
 * The rotate() CSS function defines a transformation that rotates an element around a fixed point on the 2D plane, without deforming it.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotate
 */
let rotate: angle => transform;


/***
 * The rotateX() CSS function defines a transformation that rotates an element around the abscissa (horizontal axis) without deforming it.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotateX
 */
let rotateX: angle => transform;


/***
 * The rotateY() CSS function defines a transformation that rotates an element around the ordinate (vertical axis) without deforming it.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotateY
 */
let rotateY: angle => transform;


/***
 * The rotateZ() CSS function defines a transformation that rotates an element around the z-axis without deforming it.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotateZ
 */
let rotateZ: angle => transform;

type whiteSpace =
  | Normal
  | Nowrap
  | Pre
  | PreWrap
  | PreLine;


/***
 * The white-space CSS property determines how whitespace inside an element is handled.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/white-space
 */
let whiteSpace: whiteSpace => rule;


/***
 * The skew() CSS function defines a transformation that skews an element on the 2D plane.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/skew
 */
let skew: (angle, angle) => transform;


/***
 * The skewX() CSS function defines a transformation that skews an element in the horizontal direction on the 2D plane.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/skewX
 */
let skewX: angle => transform;


/***
 * The skewY() CSS function defines a transformation that skews an element in the vertical direction on the 2D plane.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/skewY
 */
let skewY: angle => transform;


/***
 * The perspective() CSS function defines a transformation that sets the distance between the user and the z=0 plane.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/perspective
 */
let perspective: cssunit => rule;

/* PSEUDO CLASSES */

/***
 * The :link CSS pseudo-class represents an element that has not yet been visited.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:link
 */
let link: list(rule) => rule;


/***
 * The :disabled CSS pseudo-class represents any disabled element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:disabled
 */
let disabled: list(rule) => rule;


/***
 * The :required CSS pseudo-class represents any <input>, <select>,
 * or <textarea> element that has the required attribute set on it.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:required
 */
let required: list(rule) => rule;


/***
 * The :read-only CSS pseudo-class represents an element (such as a
 * locked text input) that is not editable by the user.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:read-only
 */
let readOnly: list(rule) => rule;


/***
 * The :focus CSS pseudo-class represents an element (such as a form
 * input) that has received focus.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:focus
 */
let focus: list(rule) => rule;


/***
 * The :visited CSS pseudo-class represents links that the user has already visited.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:visited
 */
let visited: list(rule) => rule;


/***
 * The :active CSS pseudo-class represents an element (such as a button) that is being
 * activated by the user.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:active
 */
let active: list(rule) => rule;


/***
 * The :hover CSS pseudo-class matches when the user interacts with an element with a
 * pointing device, but does not necessarily activate it.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:hover
 */
let hover: list(rule) => rule;


/***
 * In CSS, ::before creates a pseudo-element that is the first child of the selected element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/::before
 */
let before: list(rule) => rule;


/***
 * In CSS, ::after creates a pseudo-element that is the last child of the selected element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/::after
 */
let after: list(rule) => rule;

let placeholder: list(rule) => rule;


/***
 * The :first-child CSS pseudo-class represents the first element among a group of sibling elements.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:first-child
 */
let firstChild: list(rule) => rule;


/***
 * The :first-of-type CSS pseudo-class represents the first element of its type among a group of sibling elements.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:first-of-type
 */
let firstOfType: list(rule) => rule;


/***
 * The :last-child CSS pseudo-class represents the last element among a group of sibling elements.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:last-child
 */
let lastChild: list(rule) => rule;


/***
 * The :last-of-type CSS pseudo-class represents the last element of its type among a group of sibling elements.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/:last-of-type
 */
let lastOfType: list(rule) => rule;


/***
 * Selects all the children of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/Child_selectors
 */
let children: list(rule) => rule;


/***
 * The @media CSS at-rule can be used to apply styles based on the result of one or more media queries,
 * which test a device's type, specific characteristics, and environment.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/@media
 */
let media: (string, list(rule)) => rule;

/* MISC */

/***
 * The outline CSS property is a shorthand property for setting one or more
 * of the individual outline properties outline-style, outline-width, and
 * outline-color in a single declaration.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/outline
 */
let outline: (cssunit, borderStyle, color) => rule;

type cursor =
  | Auto
  | Default
  | None
  | ContextMenu
  | Help
  | Pointer
  | Progress
  | Wait
  | Cell
  | Crosshair
  | Text
  | VerticalText
  | Alias
  | Copy
  | Move
  | NoDrop
  | NotAllowed
  | AllScroll
  | ColResize
  | RowResize
  | NResize
  | EResize
  | SResize
  | WResize
  | NEResize
  | NWResize
  | SEResize
  | SWResize
  | EWResize
  | NSResize
  | NESWResize
  | NWSEResize
  | ZoomIn
  | ZoomOut
  | Grab
  | Grabbing
  | Custom(string);


/***
 * The cursor CSS property specifies which mouse cursor to display when the mouse pointer is over an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/cursor
 */
let cursor: cursor => rule;


/***
 * The outline-style CSS property sets the style of an element's outline.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/outline-style
 */
let outlineStyle: borderStyle => rule;


/***
 * The outline-offset CSS property sets the amount of space between an outline and the edge or border of an element.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/outline-offset
 */
let outlineOffset: cssunit => rule;


/***
 * The outline-width CSS property sets the width (thickness) of an element's outline.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/outline-width
 */
let outlineWidth: cssunit => rule;


/***
 * The outline-color CSS property sets the color of an element's outline.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/outline-color
 */
let outlineColor: color => rule;

let content: string => rule;

type backgroundOrigin =
  | BorderBox
  | ContentBox
  | PaddingBox;

let backgroundOrigin: backgroundOrigin => rule;

type float =
  | Left
  | Right
  | Start
  | InlineStart
  | InlineEnd;

let float: float => rule;

type clear =
  | None
  | Left
  | Right
  | Both;

let clear: clear => rule;

type userSelect =
  | Auto
  | Text
  | None
  | Contain
  | All;

let userSelect: userSelect => rule;

type pointerEvents =
  | Auto
  | None;

let pointerEvents: pointerEvents => rule;

let animation: string => rule;


/***
 * Scalable Vector Graphics (SVG) is an XML-based markup language for describing two dimensional based vector graphics.
 * https://developer.mozilla.org/en-US/docs/Web/SVG
 */
module SVG: {

  /***
   * For shapes and text, the fill attribute is a presentation attribute that define the color of the interior of the given graphical element.
   * https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill
   */
  let fill: color => rule;

  /***
   * This attribute specifies the opacity of the color or the content the current object is filled with.
   * https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-opacity
   */
  let fillOpacity: float => rule;

  /***
   * The stroke attribute defines the color of the outline on a given graphical element.
   * https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke
   */
  let stroke: color => rule;

  /***
   * the stroke-width attribute specifies the width of the outline on the current object.
   * https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-width
   */
  let strokeWidth: cssunit => rule;

  /***
   * the stroke-opacity attribute specifies the opacity of the outline on the current object.
   * https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-opacity
   */
  let strokeOpacity: float => rule;
};
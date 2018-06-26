/* Based on https://github.com/SentiaAnalytics/bs-css/blob/master/src/Css.re */
type styleObject('style) = Js.t({..} as 'style);

type keyframeObject = Js.Dict.t(Js.Json.t);

type rule =
  | Property(string, string)
  | Selector(string, list(rule))
  | Keyframes(string, keyframeObject);

type angle = string;

external toStyleObject : Js.Json.t => styleObject('style) = "%identity";

let rec makeDict = ruleset => {
  let toJs = rule =>
    switch (rule) {
    | Property(name, value) => (name, Js.Json.string(value))
    | Selector(name, ruleset) => (name, makeDict(ruleset))
    | Keyframes(name, dict) => (name, dict |> Js.Json.object_)
    };
  ruleset |> List.map(toJs) |> Js.Dict.fromList |> Js.Json.object_;
};

let join = (sep, strings) => {
  let rec j = acc =>
    fun
    | [] => acc
    | [x] => acc ++ x
    | [x, y, ...strings] => j(acc ++ x ++ sep, [y, ...strings]);
  j("", strings);
};

let intProp = (name, v) => Property(name, string_of_int(v));

let stringProp = (name, v) => Property(name, v);

let style = rules => makeDict(rules) |> toStyleObject;

let keyframes = keyframes =>
  keyframes
  |> List.map(((k, ruleset)) => (k, makeDict(ruleset)))
  |> Js.Dict.fromList;

let empty = () => style([]);

let important = v =>
  switch (v) {
  | Property(name, value) => Property(name, value ++ " !important")
  | _ => v
  };

let unsafeValue: string => 'a = Obj.magic;


/*********
 * COLORS
 **********/
type color = string;

let rgb = (r, g, b) => {j|rgb($r, $g, $b)|j};

let rgba = (r, g, b, a) => {j|rgba($r, $g, $b, $a)|j};

let hsl = (h, s, l) => {j|hsl($h, $s%, $l%)|j};

let hsla = (h, s, l, a) => {j|hsl($h, $s%, $l%, $a)|j};

let currentColor = "currentColor";

let transparent = "transparent";

/* CSS Level 1 */
let black = "black";

let silver = "silver";

let gray = "gray";

let white = "white";

let maroon = "maroon";

let red = "red";

let purple = "purple";

let fuchsia = "fuchsia";

let green = "green";

let lime = "lime";

let olive = "olive";

let yellow = "yellow";

let navy = "navy";

let blue = "blue";

let teal = "teal";

let aqua = "aqua";

/* CSS Level 2 (Revision 1) */
let orange = "orange";

/* CSS Color Module Level 3 */
let aliceblue = "aliceblue";

let antiquewhite = "antiquewhite";

let aquamarine = "aquamarine";

let azure = "azure";

let beige = "beige";

let bisque = "bisque";

let blanchedalmond = "blanchedalmond";

let blueviolet = "blueviolet";

let brown = "brown";

let burlywood = "burlywood";

let cadetblue = "cadetblue";

let chartreuse = "chartreuse";

let chocolate = "chocolate";

let coral = "coral";

let cornflowerblue = "cornflowerblue";

let cornsilk = "cornsilk";

let crimson = "crimson";

let cyan = "cyan"; /*synonym of aqua*/

let darkblue = "darkblue";

let darkcyan = "darkcyan";

let darkgoldenrod = "darkgoldenrod";

let darkgray = "darkgray";

let darkgreen = "darkgreen";

let darkgrey = "darkgrey";

let darkkhaki = "darkkhaki";

let darkmagenta = "darkmagenta";

let darkolivegreen = "darkolivegreen";

let darkorange = "darkorange";

let darkorchid = "darkorchid";

let darkred = "darkred";

let darksalmon = "darksalmon";

let darkseagreen = "darkseagreen";

let darkslateblue = "darkslateblue";

let darkslategray = "darkslategray";

let darkslategrey = "darkslategrey";

let darkturquoise = "darkturquoise";

let darkviolet = "darkviolet";

let deeppink = "deeppink";

let deepskyblue = "deepskyblue";

let dimgray = "dimgray";

let dimgrey = "dimgrey";

let dodgerblue = "dodgerblue";

let firebrick = "firebrick";

let floralwhite = "floralwhite";

let forestgreen = "forestgreen";

let gainsboro = "gainsboro";

let ghostwhite = "ghostwhite";

let gold = "gold";

let goldenrod = "goldenrod";

let greenyellow = "greenyellow";

let grey = "grey";

let honeydew = "honeydew";

let hotpink = "hotpink";

let indianred = "indianred";

let indigo = "indigo";

let ivory = "ivory";

let khaki = "khaki";

let lavender = "lavender";

let lavenderblush = "lavenderblush";

let lawngreen = "lawngreen";

let lemonchiffon = "lemonchiffon";

let lightblue = "lightblue";

let lightcoral = "lightcoral";

let lightcyan = "lightcyan";

let lightgoldenrodyellow = "lightgoldenrodyellow";

let lightgray = "lightgray";

let lightgreen = "lightgreen";

let lightgrey = "lightgrey";

let lightpink = "lightpink";

let lightsalmon = "lightsalmon";

let lightseagreen = "lightseagreen";

let lightskyblue = "lightskyblue";

let lightslategray = "lightslategray";

let lightslategrey = "lightslategrey";

let lightsteelblue = "lightsteelblue";

let lightyellow = "lightyellow";

let limegreen = "limegreen";

let linen = "linen";

let magenta = "magenta"; /* synonym of fuchsia */

let mediumaquamarine = "mediumaquamarine";

let mediumblue = "mediumblue";

let mediumorchid = "mediumorchid";

let mediumpurple = "mediumpurple";

let mediumseagreen = "mediumseagreen";

let mediumslateblue = "mediumslateblue";

let mediumspringgreen = "mediumspringgreen";

let mediumturquoise = "mediumturquoise";

let mediumvioletred = "mediumvioletred";

let midnightblue = "midnightblue";

let mintcream = "mintcream";

let mistyrose = "mistyrose";

let moccasin = "moccasin";

let navajowhite = "navajowhite";

let oldlace = "oldlace";

let olivedrab = "olivedrab";

let orangered = "orangered";

let orchid = "orchid";

let palegoldenrod = "palegoldenrod";

let palegreen = "palegreen";

let paleturquoise = "paleturquoise";

let palevioletred = "palevioletred";

let papayawhip = "papayawhip";

let peachpuff = "peachpuff";

let peru = "peru";

let pink = "pink";

let plum = "plum";

let powderblue = "powderblue";

let rosybrown = "rosybrown";

let royalblue = "royalblue";

let saddlebrown = "saddlebrown";

let salmon = "salmon";

let sandybrown = "sandybrown";

let seagreen = "seagreen";

let seashell = "seashell";

let sienna = "sienna";

let skyblue = "skyblue";

let slateblue = "slateblue";

let slategray = "slategray";

let slategrey = "slategrey";

let snow = "snow";

let springgreen = "springgreen";

let steelblue = "steelblue";

let tan = "tan";

let thistle = "thistle";

let tomato = "tomato";

let turquoise = "turquoise";

let violet = "violet";

let wheat = "wheat";

let whitesmoke = "whitesmoke";

let yellowgreen = "yellowgreen";

/* CSS Color Module Level 4 */
let rebeccapurple = "rebeccapurple";

let hex = v => "#" ++ v;


/*********
 * UNITS
 **********/
type cssunit = string;

let px = i => {j|$(i)px|j};

let pct = i => {j|$(i)%|j};

let rem = i => {j|$(i)rem|j};

let em = i => {j|$(i)em|j};

let ex = i => {j|$(i)ex|j};

let ch = i => {j|$(i)ch|j};

let cm = i => {j|$(i)cm|j};

let mm = i => {j|$(i)mm|j};

let q = i => {j|$(i)q|j};

let inch = i => {j|$(i)in|j};

let pc = i => {j|$(i)pc|j};

let vh = i => {j|$(i)vh|j};

let vw = i => {j|$(i)vw|j};

let vmin = i => {j|$(i)vmin|j};

let vmax = i => {j|$(i)vmax|j};

let zero = "0";

let auto = "auto";


/*********
 * ANGLE
 **********/
let rad = i => {j|$(i)rad|j};

let grad = i => {j|$(i)grad|j};

let deg = i => {j|$(i)deg|j};

let turn = i => {j|$(i)turn|j};


/*********
 * IMAGE
 **********/
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

let _encodeDirection =
  fun
  | Angle(angle) => angle
  | ToTop => "to top"
  | ToBottom => "to bottom"
  | ToLeft => "to left"
  | ToRight => "to right"
  | ToTopLeft => "to top left"
  | ToTopRight => "to top right"
  | ToBottomLeft => "to bottom left"
  | ToBottomRight => "to bottom right";

type verticalPosition =
  | Top
  | FromTop(cssunit)
  | Center
  | Bottom
  | FromBottom(cssunit);

let _encodeVerticalPosition =
  fun
  | Top => "top"
  | FromTop(v) => {j|top $v|j}
  | Center => "center"
  | Bottom => "bottom"
  | FromBottom(v) => {j|bottom $v|j};

type horizontalPosition =
  | Left
  | FromLeft(cssunit)
  | Center
  | Right
  | FromRight(cssunit);

let _encodeHorizontalPosition =
  fun
  | Left => "left"
  | FromLeft(v) => {j|left $v|j}
  | Center => "center"
  | Right => "right"
  | FromRight(v) => {j|right $v|j};

type shape =
  | Circle
  | Ellipse;

let _encodeShape =
  fun
  | Circle => "circle"
  | Ellipse => "ellipse";

type extent =
  | ClosestSide
  | ClosestCorner
  | FarthestSide
  | FarthestCorner;

let _encodeExtent =
  fun
  | ClosestSide => "closest-side"
  | ClosestCorner => "closest-corner"
  | FarthestSide => "farthest-side"
  | FarthestCorner => "farthest-corner";

type colorStop = (color, cssunit);

let _encodeColorStops = stops =>
  stops
  |> List.map(((color, pos)) => {j|$color $pos|j})
  |> String.concat(", ");

type gradient = string;

let linearGradient = (direction, stops) => {
  let direction = _encodeDirection(direction);
  let stops = _encodeColorStops(stops);
  {j|linear-gradient($direction, $stops)|j};
};

let radialGradient = (shape, v, h, extent, stops) => {
  let shape = _encodeShape(shape);
  let v = _encodeVerticalPosition(v);
  let h = _encodeHorizontalPosition(h);
  let extent = _encodeExtent(extent);
  let stops = _encodeColorStops(stops);
  {j|radial-gradient($shape $extent at $v $h, $stops)|j};
};

let repeatingLinearGradient = (direction, stops) => {
  let direction = _encodeDirection(direction);
  let stops = _encodeColorStops(stops);
  {j|repeating-linear-gradient($direction, $stops)|j};
};

let repeatingRadialGradient = (shape, v, h, extent, stops) => {
  let shape = _encodeShape(shape);
  let v = _encodeVerticalPosition(v);
  let h = _encodeHorizontalPosition(h);
  let extent = _encodeExtent(extent);
  let stops = _encodeColorStops(stops);
  {j|repeating-radial-gradient($shape $extent at $v $h, $stops)|j};
};

type image =
  | Url(string)
  | Gradient(gradient)
  | Element(string);

let _encodeImage =
  fun
  | Url(url) => {j|url($url)|j}
  | Gradient(gradient) => gradient
  | Element(selector) => {j|element($selector)|j};


/*********
 * CSS RULES
 **********/
let label = label => Property("label", label);

let unsafe = (name, value) => Property(name, Obj.magic(value));

type visibility =
  | Visible
  | Hidden
  | Collapse;

let visibility = v =>
  Property(
    "visibility",
    switch (v) {
    | Hidden => "hidden"
    | Visible => "visible"
    | Collapse => "collapse"
    },
  );

let opacity = v => Property("opacity", {j|$v|j});

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

let listStyleType = value => {
  let value =
    switch (value) {
    | Disc => "disc"
    | Circle => "circle"
    | Square => "square"
    | Decimal => "decimal"
    | DecimalLeadingZero => "decimal-leading-zero"
    | LowerRoman => "lower-roman"
    | UpperRoman => "upper-roman"
    | LowerGreek => "lower-greek"
    | LowerLatin => "lower-latin"
    | UpperLatin => "upper-latin"
    | Armenian => "armenian"
    | Georgian => "georgian"
    | LowerAlpha => "lower-alpha"
    | UpperAlpha => "upper-alpha"
    | None => "none"
    };
  Property("listStyleType", value);
};

type listStyleImage =
  | None
  | Url(string);

let listStyleImage = value => {
  let value =
    switch (value) {
    | None => "none"
    | Url(url) => {j|url($url)|j}
    };
  Property("listStyleImage", value);
};

type listStylePosition =
  | Inside
  | Outside;

let listStylePopsition = value => {
  let value =
    switch (value) {
    | Inside => "inside"
    | Outside => "outside"
    };
  Property("listStylePosition", value);
};

/* BACKGROUND */
let backgroundImage = value =>
  Property("backgroundImage", _encodeImage(Url(value)));

let backgroundGradient = value => Property("backgroundImage", value);

type backgroundAttachment =
  | Scroll
  | Fixed
  | Local
  | Initial;

let backgroundAttachment = v =>
  Property(
    "backgroundAttachment",
    switch (v) {
    | Scroll => "scroll"
    | Fixed => "fixed"
    | Local => "local"
    | Initial => "initial"
    },
  );

let backgroundColor = stringProp("backgroundColor");

type backgroundSize =
  | Cover
  | Contain
  | Width(cssunit)
  | Height(cssunit)
  | Custom(cssunit, cssunit);

let backgroundSize = v =>
  Property(
    "backgroundSize",
    switch (v) {
    | Cover => "cover"
    | Contain => "contain"
    | Width(v) => v
    | Height(v) => "auto " ++ v
    | Custom(v, h) => v ++ " " ++ h
    },
  );

type backgroundPosition =
  | Top
  | Bottom
  | Left
  | Right
  | Center
  | Custom(cssunit, cssunit);

let backgroundPosition = v =>
  Property(
    "backgroundPosition",
    switch (v) {
    | Top => "top"
    | Bottom => "bottom"
    | Left => "left"
    | Right => "right"
    | Center => "center"
    | Custom(x, y) => x ++ " " ++ y
    },
  );

type backgroundRepeat =
  | RepeatX
  | RepeatY
  | Repeat
  | Space
  | Round
  | NoRepeat;

let backgroundRepeat = v =>
  Property(
    "backgroundRepeat",
    switch (v) {
    | RepeatX => "repeat-x"
    | RepeatY => "repeat-y"
    | Repeat => "repeat"
    | Space => "space"
    | Round => "round"
    | NoRepeat => "no-repeat"
    },
  );

type background =
  | None
  | Color(color)
  | Image(string)
  | Gradient(gradient);

let background = v =>
  Property(
    "background",
    switch (v) {
    | None => "none"
    | Color(color) => color
    | Image(url) => _encodeImage(Url(url))
    | Gradient(gradient) => gradient
    },
  );

/* TEXT */
let color = stringProp("color");

let fontFamily = stringProp("fontFamily");

let fontSize = stringProp("fontSize");

type fontStyle =
  | Normal
  | Italic
  | Oblique;

let fontStyle = v =>
  Property(
    "fontStyle",
    switch (v) {
    | Normal => "normal"
    | Italic => "italic"
    | Oblique => "oblique"
    },
  );

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

let fontWeight = v =>
  Property(
    "fontWeight",
    switch (v) {
    | Normal => "normal"
    | Bold => "bold"
    | W100 => "100"
    | W200 => "200"
    | W300 => "300"
    | W400 => "400"
    | W500 => "500"
    | W600 => "600"
    | W700 => "700"
    | W800 => "800"
    | W900 => "900"
    },
  );

type fontVariant =
  | Normal
  | SmallCaps;

let fontVariant = value => {
  let value =
    switch (value) {
    | Normal => "normal"
    | SmallCaps => "small-caps"
    };
  Property("fontVariant", value);
};

let textShadow = (x, y, color) =>
  Property("textShadow", {j|$(x) $(y) $(color)|j});

let textIndent = stringProp("textIndent");

type textAlign =
  | Auto
  | Left
  | Right
  | Center
  | Justify;

let textAlign = v =>
  Property(
    "textAlign",
    switch (v) {
    | Auto => "auto"
    | Left => "left"
    | Right => "right"
    | Center => "center"
    | Justify => "justify"
    },
  );

type textDecoration =
  | None
  | Underline(color)
  | UnderlineWavy(color);

let textDecoration = v =>
  Property(
    "textDecoration",
    switch (v) {
    | None => "none"
    | Underline(color) => "underline " ++ color
    | UnderlineWavy(color) => "underline wavy " ++ color
    },
  );

type textDecorationLineValue =
  | Underline
  | Overline
  | LineThrough;

type textDecorationLine =
  | None
  | Values(list(textDecorationLineValue));

let textDecorationLine = value => {
  let value =
    switch (value) {
    | None => "none"
    | Values(values) =>
      values
      |> List.map(
           fun
           | Underline => "underline"
           | Overline => "overline"
           | LineThrough => "line-through",
         )
      |> String.concat(" ")
    };
  Property("textDecorationLine", value);
};

type textDecorationStyle =
  | Solid
  | Double
  | Dotted
  | Dashed
  | Wavy;

let textDecorationStyle = value => {
  let value =
    switch (value) {
    | Solid => "solid"
    | Double => "double"
    | Dotted => "dotted"
    | Dashed => "dashed"
    | Wavy => "wavy"
    };
  Property("textDecorationStyle", value);
};

let textDecorationColor = stringProp("textDecorationColor");

type textTransform =
  | None
  | Uppercase
  | Lowercase
  | Capitalize
  | FullWidth;

let textTransform = v =>
  Property(
    "textTransform",
    switch (v) {
    | None => "none"
    | Uppercase => "uppercase"
    | Lowercase => "lowercase"
    | Capitalize => "capitalize"
    | FullWidth => "full-width"
    },
  );

type textOverflow =
  | Clip
  | Ellipsis;

let textOverflow = value => {
  let value =
    switch (value) {
    | Clip => "clip"
    | Ellipsis => "ellipsis"
    };
  Property("textOverflow", value);
};

type overflowWrap =
  | Normal
  | BreakWord;

let _overflowWrap = (prop, value) => {
  let value =
    switch (value) {
    | Normal => "normal"
    | BreakWord => "break-word"
    };
  Property(prop, value);
};

let overflowWrap = _overflowWrap("overflowWrap");

let wordWrap = _overflowWrap("wordWrap");

let lineHeight = stringProp("lineHeight");

let letterSpacing = stringProp("letterSpacing");

/* BORDER */
type borderStyle =
  | None
  | Hidden
  | Solid
  | Dotted
  | Dashed
  | Double;

let borderStyleToString = s =>
  switch (s) {
  | None => "none"
  | Hidden => "hidden"
  | Solid => "solid"
  | Dotted => "dotted"
  | Dashed => "dashed"
  | Double => "double"
  };

let borderProp = (name, width, style, color) => {
  let styleString = borderStyleToString(style);
  Property(name, {j|$(width) $(styleString) $(color) |j});
};

let border = borderProp("border");

let borderTop = borderProp("borderTop");

let borderBottom = borderProp("borderBottom");

let borderLeft = borderProp("borderLeft");

let borderRight = borderProp("borderRight");

let borderWidth = stringProp("borderWidth");

let borderTopWidth = stringProp("borderTopWidth");

let borderBottomWidth = stringProp("borderBottomWidth");

let borderLeftWidth = stringProp("borderLeftWidth");

let borderRightWidth = stringProp("borderRightWidth");

let borderStyle = style =>
  Property("borderStyle", borderStyleToString(style));

let borderTopStyle = style =>
  Property("borderTopStyle", borderStyleToString(style));

let borderBottomStyle = style =>
  Property("borderBottomStyle", borderStyleToString(style));

let borderLeftStyle = style =>
  Property("borderLeftStyle", borderStyleToString(style));

let borderRightStyle = style =>
  Property("borderRightStyle", borderStyleToString(style));

let borderColor = color => Property("borderColor", color);

let borderTopColor = color => Property("borderTopColor", color);

let borderBottomColor = color => Property("borderBottomColor", color);

let borderLeftColor = color => Property("borderLeftColor", color);

let borderRightColor = color => Property("borderRightColor", color);

let borderRadius = stringProp("borderRadius");

let borderTopRightRadius = stringProp("borderTopRightRadius");

let borderTopLeftRadius = stringProp("borderTopLeftRadius");

let borderBottomRightRadius = stringProp("borderBottomRightRadius");

let borderBottomLeftRadius = stringProp("borderBottomLeftRadius");

/* LAYOUT */
let width = stringProp("width");

let minWidth = stringProp("minWidth");

let maxWidth = stringProp("maxWidth");

let height = stringProp("height");

let minHeight = stringProp("minHeight");

let maxHeight = stringProp("maxHeight");

let left = stringProp("left");

let right = stringProp("right");

let top = stringProp("top");

let bottom = stringProp("bottom");

let margin = stringProp("margin");

let margin2 = (~v, ~h) => Property("margin", {j|$v $h|j});

let margin3 = (~top, ~h, ~bottom) =>
  Property("margin", {j|$top $h $bottom|j});

let margin4 = (~top, ~right, ~bottom, ~left) =>
  Property("margin", {j|$top $right $bottom $left|j});

let marginLeft = stringProp("marginLeft");

let marginRight = stringProp("marginRight");

let marginTop = stringProp("marginTop");

let marginBottom = stringProp("marginBottom");

let padding = stringProp("padding");

let padding2 = (~v, ~h) => Property("padding", {j|$v $h|j});

let padding3 = (~top, ~h, ~bottom) =>
  Property("padding", {j|$top $h $bottom|j});

let padding4 = (~top, ~right, ~bottom, ~left) =>
  Property("padding", {j|$top $right $bottom $left|j});

let paddingLeft = stringProp("paddingLeft");

let paddingRight = stringProp("paddingRight");

let paddingTop = stringProp("paddingTop");

let paddingBottom = stringProp("paddingBottom");

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

let display = v =>
  Property(
    "display",
    switch (v) {
    | Block => "block"
    | None => "none"
    | Inline => "inline"
    | Flex => "flex"
    | Grid => "grid"
    | Subgrid => "subgrid"
    | Contents => "contents"
    | Table => "table"
    | TableRow => "table-row"
    | TableCell => "table-cell"
    | TableColumn => "table-column"
    | InlineBlock => "inline-block"
    | InlineTable => "inline-table"
    | InlineFlex => "inline-flex"
    | InlineGrid => "inline-grid"
    },
  );

type position =
  | Static
  | Relative
  | Absolute
  | Fixed
  | Sticky;

let position = v =>
  Property(
    "position",
    switch (v) {
    | Static => "static"
    | Relative => "relative"
    | Absolute => "absolute"
    | Fixed => "fixed"
    | Sticky => "sticky"
    },
  );

type boxSizing =
  | BorderBox
  | ContentBox;

let boxSizing = v =>
  Property(
    "boxSizing",
    switch (v) {
    | BorderBox => "border-box"
    | ContentBox => "content-box"
    },
  );

type overflow =
  | Visible
  | Hidden
  | Scroll
  | Auto;

let overflow = o =>
  Property(
    "overflow",
    switch (o) {
    | Visible => "visible"
    | Hidden => "hidden"
    | Auto => "auto"
    | Scroll => "scroll"
    },
  );

let overflowX = o =>
  Property(
    "overflowX",
    switch (o) {
    | Visible => "visible"
    | Hidden => "hidden"
    | Auto => "auto"
    | Scroll => "scroll"
    },
  );

let overflowY = o =>
  Property(
    "overflowY",
    switch (o) {
    | Visible => "visible"
    | Hidden => "hidden"
    | Auto => "auto"
    | Scroll => "scroll"
    },
  );

let zIndex = intProp("zIndex");

/* FLEXBOX */
let flex = intProp("flex");

let flexBasis = stringProp("flexBasis");

let flexGrow = intProp("flexGrow");

let flexShrink = intProp("flexShrink");

let flexFlow = intProp("flexFlow");

let order = intProp("order");

type flexDirection =
  | Row
  | RowReverse
  | Column
  | ColumnReverse;

let flexDirection = v =>
  Property(
    "flexDirection",
    switch (v) {
    | Row => "row"
    | RowReverse => "row-reverse"
    | Column => "column"
    | ColumnReverse => "column-reverse"
    },
  );

type flexWrap =
  | Wrap
  | NoWrap;

let flexWrap = v =>
  Property(
    "flexWrap",
    switch (v) {
    | Wrap => "wrap"
    | NoWrap => "no-wrap"
    },
  );

type justify =
  | FlexStart
  | FlexEnd
  | Center
  | Stretch
  | SpaceAround
  | SpaceBetween;

let justifyToString = v =>
  switch (v) {
  | FlexStart => "flex-start"
  | FlexEnd => "flex-end"
  | Center => "center"
  | Stretch => "stretch"
  | SpaceAround => "space-around"
  | SpaceBetween => "space-between"
  };

let alignContent = v => Property("alignContent", justifyToString(v));

type alignment =
  | FlexStart
  | FlexEnd
  | Center
  | Stretch
  | Baseline;

let alignmentToString = v =>
  switch (v) {
  | FlexStart => "flex-start"
  | FlexEnd => "flex-end"
  | Center => "center"
  | Stretch => "stretch"
  | Baseline => "baseline"
  };

let alignItems = v => Property("alignItems", alignmentToString(v));

let alignSelf = v => Property("alignSelf", alignmentToString(v));

let justifyContent = v => Property("justifyContent", justifyToString(v));

/* CSS GRID */
let gridTemplate = stringProp("gridTemplate");

let gridTemplateRows = stringProp("gridTemplateRows");

let gridTemplateColumns = stringProp("gridTemplateColumns");

let gridAutoRows = stringProp("gridAutoRows");

let gridAutoColumns = stringProp("gridAutoColumns");

let gridAutoFlow = stringProp("gridAutoFlow");

let gridRowStart = stringProp("gridRowStart");

let gridColumnStart = stringProp("gridColumnStart");

let gridRowEnd = stringProp("gridRowEnd");

let gridColumnEnd = stringProp("gridColumnEnd");

let gridRow = stringProp("gridRow");

let gridColumn = stringProp("gridColumn");

let gridRowGap = stringProp("gridRowGap");

let gridColumnGap = stringProp("gridColumnGap");

/* SHADOW */
type shadow = string;

let shadow = (~x=0, ~y=0, ~blur=0, ~spread=0, ~inset=false, color) => {
  let insetPrefix = inset ? "inset " : "";
  {j|$(insetPrefix)$(x)px $(y)px $(blur)px $(spread)px $color|j};
};

let boxShadow = stringProp("boxShadow");

let boxShadows = shadows => Property("boxShadow", join(", ", shadows));

/* ANIMATION */
let animationName = keyframes => Keyframes("animationName", keyframes);

let animationDuration = ms =>
  Property("animationDuration", string_of_int(ms) ++ "ms");

let animationDelay = ms =>
  Property("animationDelay", string_of_int(ms) ++ "ms");

type animationDirection =
  | Normal
  | Reverse
  | Alternate
  | AlternateReverse;

let animationDirection = v =>
  Property(
    "animationDirection",
    switch (v) {
    | Normal => "normal"
    | Reverse => "reverse"
    | Alternate => "alternate"
    | AlternateReverse => "alternate-reverse"
    },
  );

type animationFillMode =
  | None
  | Forwards
  | Backwards
  | Both;

let animationFillMode = v =>
  Property(
    "animationFillMode",
    switch (v) {
    | None => "none"
    | Forwards => "forwards"
    | Backwards => "backwards"
    | Both => "both"
    },
  );

type animationIterationCount =
  | Infinite
  | Iterate(int);

let animationIterationCount = v =>
  Property(
    "animationIterationCount",
    switch (v) {
    | Infinite => "infinite"
    | Iterate(v) => string_of_int(v)
    },
  );

type animationPlayState =
  | Paused
  | Running;

let animationPlayState = v =>
  Property(
    "animationPlayState",
    switch (v) {
    | Paused => "paused"
    | Running => "running"
    },
  );

type animationSteps =
  | Start
  | End;

let animationStepsToString = s =>
  switch (s) {
  | Start => "start"
  | End => "end"
  };

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

let timingFunctionToString = v =>
  switch (v) {
  | Ease => "ease"
  | EaseIn => "ease-in"
  | EaseOut => "ease-out"
  | EaseInOut => "ease-in-out"
  | Linear => "linear"
  | StepStart => "step-start"
  | StepEnd => "step-end"
  | CubicBezier(x1, y1, x2, y2) => {j|cubic-bezier($x1, $y1, $x2, $y2)|j}
  | Steps(i, s) =>
    "steps(" ++ string_of_int(i) ++ ", " ++ animationStepsToString(s) ++ ")"
  | Frames(i) => {j|frames($i)|j}
  };

let animationTimingFunction = v =>
  Property("animationTimingFunction", timingFunctionToString(v));

/* TRANSITION */
let transitionDelay = intProp("transitionDelay");

let transitionDuration = intProp("transitionDuration");

let transitionProperty = stringProp("transitionProperty");

let transitionTimingFunction = v =>
  Property(
    "transitionTimingFunction",
    switch (v) {
    | Ease => "ease"
    | EaseIn => "ease-in"
    | EaseOut => "ease-out"
    | EaseInOut => "ease-in-out"
    | Linear => "linear"
    | StepStart => "step-start"
    | StepEnd => "step-end"
    | CubicBezier(x1, y1, x2, y2) => {j|cubic-bezier($x1, $y1, $x2, $y2)|j}
    | Steps(i, s) =>
      "steps("
      ++ string_of_int(i)
      ++ ", "
      ++ animationStepsToString(s)
      ++ ")"
    | Frames(i) => {j|frames($i)|j}
    },
  );

let transition = (~delay=0, ~duration=0, ~timingFunction=Ease, name) => {
  let func = timingFunctionToString(timingFunction);
  Property("transition", {j|$name $(duration)ms $func $(delay)ms|j});
};

/* TRANSFORM */
type transform = string;

let transform = stringProp("transform");

let transforms = transforms => Property("transform", join(" ", transforms));

let transformOrigin = (x, y) => Property("transform-origin", x ++ " " ++ y);

let translate = (x, y) => {j|translate($x, $y)|j};

let translateX = x => {j|translateX($x)|j};

let translateY = y => {j|translateY($y)|j};

let translateZ = z => {j|translateZ($z)|j};

let translate3d = (x, y, z) => {j|translate($x $y, $z)|j};

let scale = (x, y) => {j|scale($x, $y)|j};

let scale3d = (x, y, z) => {j|scale3d($x, $y, $z)|j};

let scaleX = x => {j|scaleX($x)|j};

let scaleY = y => {j|scaleY($y)|j};

let scaleZ = y => {j|scaleZ($y)|j};

let rotate = a => {j|rotate($a)|j};

let rotateX = a => {j|rotateX($a)|j};

let rotateY = a => {j|rotateY($a)|j};

let rotateZ = a => {j|rotateZ($a)|j};

let skew = (ax, ay) => {j|skew($ax, $ay|j};

let skewX = a => {j|skewX($a|j};

let skewY = a => {j|skewY($a|j};

let perspective = stringProp("perspective");

type whiteSpace =
  | Normal
  | Nowrap
  | Pre
  | PreWrap
  | PreLine;

let whiteSpace = value => {
  let value =
    switch (value) {
    | Normal => "normal"
    | Nowrap => "nowrap"
    | Pre => "pre"
    | PreWrap => "pre-wrap"
    | PreLine => "pre-line"
    };
  Property("whiteSpace", value);
};

/* PSEUDO CLASSES */
let selector = (name, rules) => Selector(name, rules);

let hover = selector("&:hover");

let before = selector("&::before");

let after = selector("&::after");

let placeholder = selector("&::placeholder");

let disabled = selector("&:disabled");

let required = selector("&:required");

let readOnly = selector("&:readOnly");

let focus = selector("&:focus");

let active = selector("&:active");

let visited = selector("&:visited");

let link = selector("&:link");

let firstChild = selector("&:firstChild");

let firstOfType = selector("&:firstOfType");

let lastChild = selector("&:lastChild");

let lastOfType = selector("&:lastOfType");

let children = selector(" > *");

/* MEDIA */
let media = (query, rules) => Selector("@media " ++ query, rules);

/* MISC */
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

let cursor = v =>
  Property(
    "cursor",
    switch (v) {
    | Auto => "auto"
    | Default => "default"
    | None => "none"
    | ContextMenu => "content-menu"
    | Help => "help"
    | Pointer => "pointer"
    | Progress => "progress"
    | Wait => "wait"
    | Cell => "cell"
    | Crosshair => "crosshair"
    | Text => "text"
    | VerticalText => "vertical-text"
    | Alias => "alias"
    | Copy => "copy"
    | Move => "move"
    | NoDrop => "no-drop"
    | NotAllowed => "not-allowed"
    | AllScroll => "all-scroill"
    | ColResize => "col-resize"
    | RowResize => "row-resize"
    | NResize => "n-resize"
    | EResize => "e-resize"
    | SResize => "s-resize"
    | WResize => "w-resize"
    | NEResize => "ne-resize"
    | NWResize => "nw-resize"
    | SEResize => "se-resize"
    | SWResize => "sw-resize"
    | EWResize => "ew-resize"
    | NSResize => "ns-resize"
    | NESWResize => "nesw-resize"
    | NWSEResize => "nwse-resize"
    | ZoomIn => "zoom-in"
    | ZoomOut => "zoom-out"
    | Grab => "grab"
    | Grabbing => "grabbing"
    | Custom(cur) => cur
    },
  );

let outline = (width, style, color) => {
  let outlineStyle = borderStyleToString(style);
  Property("outline", {j|$width $outlineStyle $color|j});
};

let outlineStyle = v => Property("outlineStyle", borderStyleToString(v));

let outlineOffset = stringProp("outlineOffset");

let outlineWidth = stringProp("outlineWidth");

let outlineColor = stringProp("outlineColor");

let content = s => Property("content", "'" ++ s ++ "'");

type backgroundOrigin =
  | BorderBox
  | ContentBox
  | PaddingBox;

let backgroundOrigin = v =>
  Property(
    "background-origin",
    switch (v) {
    | BorderBox => "border-box"
    | ContentBox => "content-box"
    | PaddingBox => "padding-box"
    },
  );

type float =
  | Left
  | Right
  | Start
  | InlineStart
  | InlineEnd;

let float = v =>
  Property(
    "float",
    switch (v) {
    | Left => "left"
    | Right => "right"
    | Start => "start"
    | InlineStart => "inline-start"
    | InlineEnd => "inline-end"
    },
  );

type clear =
  | None
  | Left
  | Right
  | Both;

let clear = v =>
  Property(
    "clear",
    switch (v) {
    | None => "none"
    | Left => "left"
    | Right => "right"
    | Both => "both"
    },
  );

type userSelect =
  | Auto
  | Text
  | None
  | Contain
  | All;

let userSelect = v =>
  Property(
    "user-select",
    switch (v) {
    | Auto => "auto"
    | Text => "text"
    | None => "none"
    | Contain => "contain"
    | All => "all"
    },
  );

type pointerEvents =
  | Auto
  | None;

let pointerEvents = v =>
  Property(
    "pointer-events",
    switch (v) {
    | Auto => "auto"
    | None => "none"
    },
  );

let animation = name => Property("animation-name", name);

module SVG = {
  let fill = stringProp("fill");
  let fillOpacity = v => Property("fillOpacity", {j|$v|j});
  let stroke = stringProp("stroke");
  let strokeWidth = stringProp("strokeWidth");
  let strokeOpacity = v => Property("strokeOpacity", {j|$v|j});
};
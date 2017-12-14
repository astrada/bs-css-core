/* Reason */
open Jest;

describe("style", () => {
  let styles = theme => {
    let card = () =>
      Css.(
        style([
          backgroundColor(white),
          boxShadow(shadow(~y=3, ~blur=5, rgba(0, 0, 0, 0.3))),
          padding(theme##basePadding)
        ])
      );
    let title = () =>
      Css.(
        style([
          fontSize(rem(1.5)),
          color(theme##textColor),
          marginBottom(theme##basePadding)
        ])
      );
    {"card": card(), "title": title()};
  };
  let theme = {"textColor": Css.hex("333"), "basePadding": Css.px(15)};
  Expect.(
    test("stylesWithTheme", () =>
      expect(styles(theme))
      |> toEqual({
           "card": {
             "backgroundColor": "white",
             "boxShadow": "0px 3px 5px 0px rgba(0, 0, 0, 0.3)",
             "padding": "15px"
           },
           "title": {
             "color": "#333",
             "fontSize": "1.5rem",
             "marginBottom": "15px"
           }
         })
    )
  );
});

describe("keyframes", () => {
  let bounce =
    Css.(
      keyframes([
        ("0%", [transform(scale(0.1, 0.1)), opacity(0.0)]),
        ("60%", [transform(scale(1.2, 1.2)), opacity(1.0)]),
        ("100%", [transform(scale(1.0, 1.0)), opacity(1.0)])
      ])
    );
  let stylesWithAnimation = _theme =>
    Css.(
      style([
        animationName(bounce),
        animationDuration(2000),
        width(px(50)),
        height(px(50)),
        backgroundColor(rgb(255, 0, 0))
      ])
    );
  Expect.(
    test("stylesWithAnimation", () =>
      expect(stylesWithAnimation())
      |> toEqual({
           "animationDuration": "2000ms",
           "animationName": {
             "0%": {
               "opacity": "0",
               "transform": "scale(0.1, 0.1)"
             },
             "100%": {
               "opacity": "1",
               "transform": "scale(1, 1)"
             },
             "60%": {
               "opacity": "1",
               "transform": "scale(1.2, 1.2)"
             }
           },
           "backgroundColor": "rgb(255, 0, 0)",
           "height": "50px",
           "width": "50px"
         })
    )
  );
});

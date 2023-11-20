#import "@preview/cetz:0.1.2": canvas, draw

// Document
#set document(title: "A Minimal Research Poster Template", author: "François Rozet")

// Text
#set par(justify: true)
#set text(font: "Fira Sans", size: 8pt, weight: "light")
#set strong(delta: 200)

// Equations
#set math.equation(numbering: "(1)")

// Headings
#show heading: set text(size: 1em, weight: "medium")
#show heading: set block(above: 1.5em, below: 1em)

// Lists
#set list(tight: false, marker: strong("•"))
#set enum(tight: false)

// Figures
#set figure.caption(separator: [. ])

// Box
#let box(body) = {
    rect(fill: rgb("#f0f0f0"), inset: 0.25cm, radius: 0.25cm, width: 100%, body)
}

// Poster
#let poster(body) = {
    // Page
    set page(paper: "a4", flipped: true, margin: 0.5cm)

    // Social
    let social(url, logo, body) = {
        link(url, stack(dir: ltr, spacing: 0.5em, image(logo, height: 1.25em), text(size: 1.25em, body)))
    }

    // Layout
    grid(
        rows: (1.5cm, 1fr),
        row-gutter: 0.5cm,
        grid(
            columns: (1fr, auto, 1fr),
            // Logos
            align(
                horizon + center,
                stack(
                    dir: ltr,
                    spacing: 1.5cm,
                    image("svg/typst.svg", height: 0.8cm),
                    image("svg/ferris.svg", height: 1cm),
                ),
            ),
            // Title
            align(
                horizon + center,
                stack(
                    dir: ttb,
                    spacing: 1em,
                    text(size: 2.5em, weight: "medium", [A Minimal Research Poster Template]),
                    text(size: 1.5em, [François Rozet and Hubert Bonisseur de la Bath]),
                )
            ),
            // Links
            grid(
                columns: (1fr, auto),
                align(
                    horizon + center,
                    stack(
                        dir: ttb,
                        spacing: 0.5em,
                        social("https://arxiv.org/abs/2304.00319", "svg/arxiv.svg", `arXiv:2304.00319`),
                        social("https://github.com/francois-rozet/postr", "svg/github.svg", `francois-rozet/postr`),
                    ),
                ),
                link("https://youtu.be/dQw4w9WgXcQ", image("svg/qrcode.svg", height: 100%)),
            ),
        ),
        columns(3, gutter: 0.5cm, body),
    )
}

#show: poster

// Body
= Introduction

#lorem(42)

$ p(x_(1:L) | y) = p(y | x_(1:L)) / p(y) p(x_1) product_(i=1)^(L-1) p(x_(i+1) | x_i) $

#lorem(69)

#figure({
    set math.equation(numbering: none)

    canvas(length: 3em, {
        draw.set-style(
            circle: (fill: rgb("#f0f0f0"), stroke: none),
            mark: (size: 0.15, fill: black),
        )

        draw.circle((-1, 0), radius: 0.4, name: "x1")
        draw.content("x1", $ x_1 $)
        draw.line((-0.5, 0), (1.5, 0), mark: (end: ">"))

        draw.circle((2, 0), radius: 0.4, name: "x2")
        draw.content("x2", $ x_2 $)
        draw.line((2.5, 0), (3.5, 0), mark: (end: ">"))

        draw.circle((4, 0), radius: 0.4, name: "x3")
        draw.content("x3", $ dots $)
        draw.line((4.5, 0), (5.5, 0), mark: (end: ">"))

        draw.circle((6, 0), radius: 0.4, name: "x4")
        draw.content("x4", $ x_L $)

        draw.circle((3, -1.5), radius: 0.4, name: "y")
        draw.content("y", $ y $)

        for x in ("x1", "x2", "x3", "x4") {
            draw.line((a: x, b: "y", number: 0.5, abs: true), (a: "y", b: x, number: 0.5, abs: true), mark: (end: ">"))
        }

        draw.content((0.5, 0.25), $ p(x_(i+1) | x_i) $, anchor: "below")
        draw.content((4, -1.5), $ p(y | x_(1:L)) $, anchor: "left")
    })
})

#lorem(144)

#box(lorem(42))

#colbreak()

= Methods \& contributions

#set enum(
    numbering: i => rect(
        fill: yellow,
        inset: 0.25cm,
        radius: 0.25cm,
        text(size:1.5em, fill: black, strong([#i]))
    )
)

1. #box([Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do *eiusmod tempor incididunt* ut labore et dolore magnam aliquam quaerat voluptatem.])

#lorem(47)

2. #box([Ut enim aeque doleamus animo, cum corpore dolemus, ﬁeri tamen *permagna accessio potest*, si aliquod aeternum et inﬁnitum impendere malum nobis opinemur.])

#lorem(23)

#box(
```python
def fast_fibonacci(n: int) -> int:
    a, b = 0, 1

    for i in range(n):
        a, b = b, a + b

    return a
```
)

#lorem(34)

3. #box([Athenis, ut e patre audiebam facete et urbane Stoicos irridente, statua est in quo a nobis philosophia $a^2 + b^2 = c^2$ defensa et collaudata est, cum id, quod maxime $exp(i pi) + 1 = 0$ placeat, facere possimus, omnis voluptas assumenda est.])

#lorem(101)

#colbreak()

= Results

#lorem(101)

#figure(image("svg/navier-stokes.svg"), caption: [#lorem(13)])

#lorem(203)

== Acknowledgements

I would like to thank the Typst team for this wonderful software. With LaTeX, typesetting is a burden; bugs, quirks and inconsistencies are constantly getting in my way. With Typst, typesetting is fast, intuitive and fun. The only limit seems to be my own creativity.

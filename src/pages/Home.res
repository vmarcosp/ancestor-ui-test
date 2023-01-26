module AncestorCustom = Ancestor.Make(
  Ancestor.Defaults.Breakpoints,
  {
    type colors = [
      | #white
      | #gray
      | #gray200
      | #primary
    ]

    let colors = token =>
      switch token {
      | #white => #hex("#fafafa")
      | #gray => #hex("#f2f2f2")
      | #gray200 => #hex("#556170")
      | #primary => #hex("#0da5e9")
      }
  },
  Ancestor.Defaults.Spacing,
  Ancestor.Defaults.Radius,
  Ancestor.Defaults.ZIndex,
)

open AncestorCustom

/*
 * Using the useCss(..) hook
 */
module Button = {
  @react.component
  let make = () => {
    let {css} = AncestorCustom.useCss()
    let button = css({
      bgColor: {xs: #gray200},
      color: {xs: #white},
      height: {xs: #px(56)},
      width: {xs: #px(124)},
      borderRadius: {xs: 1},
      px: {xs: 1},
      _hover: {
        bgColor: {xs: #gray},
      },
    })

    <button className=button> {"Click here"->React.string} </button>
  }
}

@react.component
let default = () => {
  <Box p={xs: 4, md: 8} display={xs: #flex} justifyContent={xs: #center}>
    <Stack
      pt={xs: 4, md: 0}
      direction={xs: #vertical, md: #horizontal}
      tag=#figure
      m={xs: 0}
      width={xs: 100.0->#pct, md: 664->#px}
      overflow={xs: #hidden}
      borderRadius={xs: 1}
      alignItems={xs: #center}
      bgColor={xs: #white}>
      <Base
        tag=#img
        width={xs: 124->#px, md: 192->#px}
        height={xs: 124->#px, md: 100.0->#pct}
        borderRadius={xs: 10, md: 0}
        src="https://tailwindcss.com/_next/static/media/sarah-dayan.a620c98f.jpg"
      />
      <Stack p={xs: 4} gap={xs: #one(2)} justifyContent={xs: #center}>
        <Typography
          textAlign={xs: #center, md: #left}
          tag=#p
          m={xs: 0}
          fontSize={xs: 1.8->#rem}
          lineHeight={xs: 2.8->#rem}
          fontWeight={xs: #400}>
          {`"Tawilding CSS is the only framework that I've seen scale on large teams. It's easy to customize, adapts to any design, and the build size is tiny."`->React.string}
        </Typography>
        <Stack tag=#figcaption>
          <Typography
            textAlign={xs: #center, md: #left}
            fontSize={xs: 1.6->#rem}
            lineHeight={xs: 2.8->#rem}
            fontWeight={xs: #400}
            color={xs: #primary}>
            {"Sarah Dayan"->React.string}
          </Typography>
          <Typography
            textAlign={xs: #center, md: #left}
            fontSize={xs: 1.6->#rem}
            lineHeight={xs: 2.8->#rem}
            fontWeight={xs: #400}
            color={xs: #gray200}>
            {"Staff Engineer, Algolia"->React.string}
          </Typography>
        </Stack>
      </Stack>
    </Stack>
  </Box>
}

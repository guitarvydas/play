rect R1 <rounded=true> {
  text "Transpiler"
}
  ellipse E1 <background-color=green> {
    text "go"
  }
  ellipse E2 <background-color=green> {
    text "src"
  }
  ellipse E3 <background-color=green> {
    text "grammar name"
  }
  ellipse E4 <background-color=green> {
    text "grammar text"
  }
  ellipse E5 <background-color=green> {
    text "hook name"
  }
  ellipse E6 <background-color=green> {
    text "semantic hooks"
  }

  ellipse E7 <background-color=yellow> {
    text "success"
  }
  ellipse E8 <background-color=yellow> {
    text "transpiled text"
  }
  ellipse E9 <background-color=yellow> {
    text "error"
  }

intersects-top E1 R1
intersects-left E2 R1
intersects-left E3 R1
intersects-left E4 R1
intersects-left E5 R1
intersects-left E6 R1
intersects-right E7 R1
intersects-right E8 R1
intersects-right E9 R1

module Dashboard exposing (..)

import Browser
import Html exposing (Html, div, iframe)
import Html.Attributes exposing (attribute, width, height, style)

main : Program () String Msg
main =
  Browser.sandbox { init = "Xyutter"
                  , update = update
                  , view = view }

type Msg = Xyutter | Twitter

update : Msg -> String -> String
update msg _ =
  case msg of
    Xyutter -> "Xyutter"
    Twitter -> "Twitter"

-- TODO
view : String -> Html Msg
view _ =
  div []
    [ div
      [ style "text-align"      "center"
      , style "justify-content" "center"
      , style "align-items"     "center"
      , style "vertical-align"  "middle"
      , style "display"         "flex" ]
      [
        iframe [ attribute "src" "https://www.youtube.com/embed/SQ7mTBToqOY?autoplay=1"
               , width  800
               , height 600
               , style "overflow" "auto"
               , style "border"   "5px ridge red"
               ]
               []
      ]
    ]

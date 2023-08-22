module Popup exposing (..)

import Browser
import Html exposing (Html, button, div, hr, br, text)
import Html.Attributes exposing (id)
import Html.Events exposing (onClick)

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

view : String -> Html Msg
view model =
  div []
    [ button [ id "open" ] [ text "Open" ]
    , div [id "mode"] [ text model ]
    , hr [] []
    , button [ onClick Xyutter ] [ text "Xyutter" ]
    , br [] []
    , button [ onClick Twitter ] [ text "Twitter" ]
    , hr [] []
    , button [ id "options" ] [ text "Options" ]
    ]

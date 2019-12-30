module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    Int


type Msg
    = Increase | Decrease


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


init : Model
init =
    0


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increase ->
            model + 1
        Decrease ->
            model - 1


view : Model -> Html Msg
view count =
    div []
        [ button [ type_ "button", onClick Decrease] [ text "-" ]
        , text (String.fromInt count)
        , button [ type_ "button", onClick Increase ] [ text "+" ]
        ]

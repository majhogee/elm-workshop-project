module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    Int


type Msg
    = Increase Int
    | Decrease Int
    | Reset


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
        Increase step ->
            model + step

        Decrease step ->
            model - step

        Reset ->
            init


view : Model -> Html Msg
view count =
    div []
        [ button [ type_ "button", onClick (Decrease 1)] [ text "-" ]
        , button [ type_ "button", onClick (Decrease 5)] [ text "-5" ]
        , text (String.fromInt count)
        , button [ type_ "button", onClick (Increase 1)] [ text "+" ]
        , button [ type_ "button", onClick (Increase 5)] [ text "+5" ]
        , button [ type_ "button", onClick Reset ] [ text "Reset" ]
        ]

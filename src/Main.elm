module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
     Maybe Int

type Msg
    = Increase Int
    | Decrease Int
    | Reset
    | Initialize


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


init : Model
init =
    Nothing


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increase step ->
            Maybe.map ((+) step) model

        Decrease step ->
            Maybe.map (\count -> count - step) model

        Reset ->
            Just 0

        Initialize ->
            Just 0


view : Model -> Html Msg
view model =
    case model of
        Nothing ->
            div []
                [ button [ type_ "button", onClick (Initialize)] [ text "Initialize" ] ]

        Just count ->
            div []
                [ button [ type_ "button", onClick (Decrease 1)] [ text "-" ]
                , button [ type_ "button", onClick (Decrease 5)] [ text "-5" ]
                , text (String.fromInt count)
                , button [ type_ "button", onClick (Increase 1)] [ text "+" ]
                , button [ type_ "button", onClick (Increase 5)] [ text "+5" ]
                , button [ type_ "button", onClick Reset ] [ text "Reset" ]
                ]

module Hand (Model, init, Action, update, view) where

import Card exposing (Card, Orientation, Value, Suit)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

-- MODEL

type alias Model = [Card]

init : [Card] -> Model
init = id

-- UPDATE

type Action = Noop

update : Action -> Model -> Model
update action model =
  case action of
    Noop -> model

-- VIEW

view : Signal.Address Action -> Model -> Model
view address model =

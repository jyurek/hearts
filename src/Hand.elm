module Hand
  ( init
  , update
  , view
  )
  where

import Card exposing (Card)
import Html exposing (..)
import Html.Attributes exposing (..)

-- MODEL

type alias Hand = List Card

init : List Card -> Hand
init = identity

-- UPDATE

type Action =
  Noop
  | CardAction Card.Action

update : Action -> Hand -> Hand
update action model =
  case action of
    CardAction act -> List.map (Card.update act) model
    Noop -> model

-- VIEW

view : Signal.Address Action -> Hand -> Html
view address hand =
  div [] (List.map (Card.view (Signal.forwardTo address CardAction)) hand)

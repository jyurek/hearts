module Hand.View where

import Card.Model
import Card.View
import General exposing (ID)
import Hand.Model exposing (Model)
import Hand.Update exposing (Action(..))
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

view : Signal.Address Action -> Model -> Html
view address hand =
  div
    [ class "hand" ]
    (List.map (viewCard address) hand.cards)

viewCard : Signal.Address Action -> (ID, Card.Model.Model) -> Html
viewCard address (id, card) =
  Card.View.view (Signal.forwardTo address (CardAction id)) card

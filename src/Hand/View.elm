module Hand.View where

import Card.View
import Hand.Model exposing (Model, OrderedCard)
import Hand.Update exposing (Action(..))
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

view : Signal.Address Action -> Model -> Html
view address hand =
    div
        [ class "hand horizontal" ]
        -- [ viewAll address hand.cards ]
        (List.map (viewOne address) hand.cards)

viewAll : Signal.Address Action -> List OrderedCard -> Html
viewAll address cs = case cs of
  [] -> text ""
  [c] -> div [class "nest"] [viewOne address c]
  (c::cs) -> div [class "nest"] [viewOne address c, viewAll address cs]

viewOne : Signal.Address Action -> OrderedCard -> Html
viewOne address (id, card) =
    Card.View.view (Signal.forwardTo address (CardAction id)) card

module Card.View where

import Card.Model exposing (Model, cardString)
import Card.Update exposing (Action(..))
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import String

view : Signal.Address Action -> Model -> Html
view address card =
  div
    [ class (toClass card), onClick address Flip ]
    ( List.map (text) (cardStrings card) )

cardStrings : Model -> List String
cardStrings card =
  []
  -- [toString card.face, toString card.suit, valueString card.value]

toClass : Model -> String
toClass card =
  "card " ++ (cardString card)

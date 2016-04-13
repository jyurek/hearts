module Player.View where

import Hand.View
import Player.Update exposing (Action(..))
import Player.Model exposing (Model, Orientation(..))
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, attribute)

view : Signal.Address Action -> Model -> Html
view address player =
  div
    [ playerClass player
    , playerNameAtrribute player
    ]
    [ playerNameLabel player
    , handView address player
    ]

playerClass : Model -> Html.Attribute
playerClass player =
  class <| Player.Model.playerString player

playerNameAtrribute : Model -> Html.Attribute
playerNameAtrribute player =
  attribute "data-name" player.name

playerNameLabel : Model -> Html
playerNameLabel player =
  div
    [ class "name" ]
    [ text player.name ]

handView : Signal.Address Action -> Model -> Html
handView address player =
  Hand.View.view (Signal.forwardTo address HandAction) player.hand

module Player.View (view, missingView) where

import Hand.View
import Player.Update exposing (Action(..))
import Player.Model exposing (Model)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, attribute)

view : Signal.Address Action -> Model -> Html
view address player =
  div
    [ playerClass
    , playerNameAtrribute player.name
    ]
    [ playerNameLabel player.name
    , handView address player
    ]

missingView : Html
missingView =
  div
    [ playerClass
    , playerNameAtrribute "Waiting..."
    ]
    [ playerNameLabel "Waiting for player." ]

playerClass : Html.Attribute
playerClass =
  class "player"

playerNameAtrribute : String -> Html.Attribute
playerNameAtrribute playerName =
  attribute "data-name" playerName

playerNameLabel : String -> Html
playerNameLabel playerName =
  div
    [ class "name" ]
    [ text playerName ]

handView : Signal.Address Action -> Model -> Html
handView address player =
  Hand.View.view (Signal.forwardTo address HandAction) player.hand

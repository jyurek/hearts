module Game.View (view) where

import Html exposing (Html, div, input, button, text, br)
import Html.Attributes exposing (placeholder)
import Html.Events exposing (on, targetValue, onClick)
import Game.Model exposing (Model(..))
import Game.Update exposing (Action(..))
import General exposing (ID)
import Player.View
import Player.Model

view : Signal.Address Action -> Model -> Html
view address model =
  case model of
    Outside data ->
      div
        []
        []
    Inside data ->
      div 
        []
        (List.map (viewPlayer address) data.players)

viewPlayer : Signal.Address Action -> Maybe (ID, Player.Model.Model) -> Html
viewPlayer address maybePlayer =
  case maybePlayer of
    Just (id, player) ->
      Player.View.view (Signal.forwardTo address (PlayerAction id)) player
    Nothing ->
      Player.View.missingView

module Game.View (view) where

import Html exposing (Html, text)
import Game.Model exposing (Model)
import Game.Update exposing (Action)

view : Signal.Address Action -> Model -> Html
view address model =
  text "There is no game yet."

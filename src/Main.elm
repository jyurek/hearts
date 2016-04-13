module Main where

import Game.Model
import Game.Update
import Game.View
import StartApp.Simple exposing (start)
import Html exposing (Html)

main : Signal Html
main = start
  { model = Game.Model.initialModel
  , update = Game.Update.update
  , view = Game.View.view
  }

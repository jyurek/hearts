module Main where

import Game.Model exposing (initialModel)
import Game.Update exposing (update)
import Game.View exposing (view)
import StartApp.Simple exposing (start)
import Html exposing (Html)

main : Signal Html
main = start
  { model = initialModel
  , update = update
  , view = view
  }

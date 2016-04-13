module Main where

import Player.Model
import Player.Update
import Player.View
import StartApp.Simple exposing (start)
import Html exposing (Html)

main : Signal Html
main = start
  { model = Player.Model.initialModel
  , update = Player.Update.update
  , view = Player.View.view
  }

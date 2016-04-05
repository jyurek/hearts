import Player exposing (..)
import Hand exposing (..)
import Card exposing (..)
import StartApp.Simple exposing (start)

main = start
  { model = Player.init
  , update = Player.update
  , view = Player.view
  }

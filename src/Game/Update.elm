module Game.Update where

import Game.Model exposing (Model)
import Player.Model
import Player.Update

type Action
  = JoinGame String String
  | StartGame
  | PlayerAction Player.Update.Action

update : Action -> Model -> Model
update action model =
  case action of
    JoinGame code name ->
      model
    StartGame ->
      model
    PlayerAction playerAction ->
      model

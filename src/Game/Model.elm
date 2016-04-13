module Game.Model where

import Player.Model
import General exposing(ID)

type Model
  = Outside
  | Lobby
  | Playing

initialModel : Model
initialModel = Outside

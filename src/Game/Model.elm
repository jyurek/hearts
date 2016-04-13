module Game.Model where

import Player.Model
import General exposing(ID)

type Game = Game List Player.Model.Model | NoGame

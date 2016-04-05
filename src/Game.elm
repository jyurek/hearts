module Game where

import Player exposing (..)

-- MODEL

type alias Game =
  { players : List (ID, Player)
  , nextID : ID
  }

type alias ID = Int


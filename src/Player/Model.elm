module Player.Model where

import Hand.Model
import General exposing (ID)

type alias Model =
  { hand : Hand.Model.Model
  , name : String
  , score : Int
  }

initialModel : Model
initialModel = 
  { hand = Hand.Model.initialModel
  , name = "Player"
  , score = 0
  }

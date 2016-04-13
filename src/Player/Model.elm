module Player.Model where

import Hand.Model
import General exposing (ID)
import String exposing (toLower)

type Orientation = Vertical | Horizontal
type alias Model =
  { hand : Hand.Model.Model
  , name : String
  , orientation : Orientation
  }

initialModel : Model
initialModel = 
  { hand = Hand.Model.subsetDeck [11..23]
  , name = "Player"
  , orientation = Horizontal
  }

orientationString : Orientation -> String
orientationString = toString >> toLower

playerString : Model -> String
playerString player =
  "player " ++ (orientationString player.orientation)

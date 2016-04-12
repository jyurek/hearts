module Hand.Model (Model, ID, OrderedCard, initialModel, subsetDeck) where

import Card.Model exposing (Model(..), Suit(..), Value(..), Face(..))

type alias OrderedCard = (ID, Card.Model.Model)
type alias Model = 
  { cards : List OrderedCard
  , nextID : ID
  }
type alias ID = Int

initialModel : Model
initialModel =
  { cards = []
  , nextID = 1
  }

subsetDeck : List Int -> Model
subsetDeck cardNumbers =
  { cards = List.map (\x -> (x, Card.Model.cardFromInteger x) ) cardNumbers
  , nextID = 53
  }

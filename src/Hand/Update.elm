module Hand.Update where

import Card.Model
import Card.Update
import Hand.Model exposing (Model)
import General exposing (ID)

type Action
  = Insert Card.Model.Model
  | CardAction ID Card.Update.Action

update : Action -> Model -> Model
update action hand =
  case action of
    Insert card ->
      { hand
      | cards = ( hand.nextID, card ) :: hand.cards
      , nextID = hand.nextID + 1
      }
    CardAction id caction ->
      { hand 
      | cards = List.map (updateMatching id caction) hand.cards
      }

updateMatching : ID -> Card.Update.Action -> (ID, Card.Model.Model) -> (ID, Card.Model.Model)
updateMatching matchId action (id, card) =
  if matchId == id
     then (id, Card.Update.update action card)
     else (id, card)

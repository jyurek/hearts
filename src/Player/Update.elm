module Player.Update where

import Player.Model exposing (Model)
import Hand.Update
import Hand.Model

type Action
 = SetHand Hand.Model.Model
 | SetName String
 | HandAction Hand.Update.Action

update : Action -> Model -> Model
update action player = case action of
  HandAction handAction ->
    { player | hand = Hand.Update.update handAction player.hand }
  SetName name ->
    { player | name = name }
  SetHand hand ->
    { player | hand = hand }


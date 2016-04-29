module Game.Update where

import Game.Model exposing (Model(..))
import General exposing (ID)
import Player.Model
import Player.Update

type Action
  = SetGameName String
  | SetPlayerName String
  | PlayerAction ID Player.Update.Action

update : Action -> Model -> Model
update action model =
  case action of
    SetPlayerName name ->
      case model of
        Outside m -> Outside { m | playerName = Just name}
        _ -> model
    SetGameName name ->
      case model of
        Outside m -> Outside { m | gameName = Just name}
        _ -> model
    PlayerAction id playerAction ->
      case model of
        Inside m -> Inside { m | players = List.map (updateMatching id playerAction) m.players }
        _ -> model

updateMatching : ID -> Player.Update.Action -> Maybe (ID, Player.Model.Model) -> Maybe (ID, Player.Model.Model)
updateMatching matchId action maybePlayer =
  case maybePlayer of
    Just (id, player) ->
      if matchId == id
        then Just (id, Player.Update.update action player)
        else Just (id, player)
    Nothing ->
      Nothing

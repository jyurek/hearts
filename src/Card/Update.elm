module Card.Update where

import Card.Model exposing (KnownCard, Model(..), flipOver)

type Action
    = Flip

update : Action -> Model -> Model
update action model =
  case model of
    UnknownCard -> UnknownCard
    Card card -> updateCard action card

updateCard : Action -> KnownCard -> Model
updateCard action card =
  case action of
    Flip -> flipOver card |> Card

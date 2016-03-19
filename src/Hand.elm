module Hand where

import Card exposing (..)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

-- MODEL

type alias Hand = 
  { cards : List (ID, Card)
  , nextID : ID
  }
type alias ID = Int

init : Hand
init =
  { cards = [ (0, Card Down Ace Hearts)
            , (1, Card Up Ace Spades)
            , (2, Card Up (Value 2) Diamonds)
            ]
  , nextID = 3
  }

-- UPDATE

type Action
  = Insert Card
  | CardAction ID Card.Action

update : Action -> Hand -> Hand
update action hand =
  case action of
    CardAction id caction ->
      { hand |
        cards = List.map (updateMatching id caction) hand.cards,
        nextID = hand.nextID
      }
    Insert card ->
      { hand |
        cards = ( hand.nextID, card ) :: hand.cards,
        nextID = hand.nextID + 1
      }

updateMatching : ID -> Card.Action -> (ID, Card) -> (ID, Card)
updateMatching matchId action (id, card) =
  if matchId == id
     then (id, Card.update action card)
     else (id, card)

-- VIEW

view : Signal.Address Action -> Hand -> Html
view address hand =
    div
        [ class "hand" ]
        [viewAll address hand.cards]
        -- (List.map (viewOne address) hand.cards)

viewAll : Signal.Address Action -> List (ID, Card) -> Html
viewAll address cs = case cs of
  [] -> text ""
  [c] -> div [class "nest"] [viewOne address c]
  (c::cs) -> div [class "nest"] [viewOne address c, viewAll address cs]

viewOne : Signal.Address Action -> (ID, Card) -> Html
viewOne address (id, card) =
    Card.view (Signal.forwardTo address (CardAction id)) card


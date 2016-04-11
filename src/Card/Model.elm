module Card.Model where

import String exposing (toLower)

type Suit = Spades | Hearts | Clubs | Diamonds
type Value = Ace | King | Queen | Jack | Value Int
type Face = Up | Down
type alias KnownCard = { face : Face, value : Value, suit : Suit }
type Model = Card KnownCard | UnknownCard

flipOver : KnownCard -> KnownCard
flipOver card =
  case card.face of
    Up -> { card | face = Down }
    Down -> { card | face = Up }

valueString : Value -> String
valueString v =
  case v of
    Ace -> "ace"
    King -> "king"
    Queen -> "queen"
    Jack -> "jack"
    Value i -> toString i

cardString : Model -> String
cardString card =
  case card of
    UnknownCard ->
      "card down"
    Card card' ->
      "card " ++ (cardValueString card)

cardValueString : Model -> String
cardValueString model =
  case model of
    UnknownCard ->
      "down"
    Card card ->
      case card.face of
        Up ->
            (card.suit |> toString |> toLower)
            ++ "-"
            ++ (card.value |> valueString)
        Down ->
          "down"

initialModel : Model
initialModel = UnknownCard

-- Input: 1 to 52
cardFromInteger : Int -> Model
cardFromInteger i =
  let
      i' = i-1
      suit = suitFromInteger (i' // 13)
      value = valueFromInteger (i' % 13)
  in
      Card { value = value, suit = suit, face = Up }

suitFromInteger : Int -> Suit
suitFromInteger i =
  case i of
    0 -> Diamonds
    1 -> Clubs
    2 -> Hearts
    _ -> Spades

valueFromInteger : Int -> Value
valueFromInteger i =
  case (i+1) of
    1 -> Ace
    11 -> Jack
    12 -> Queen
    13 -> King
    _ -> Value (i+1)

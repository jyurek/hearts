import Card exposing (init, update, view, Orientation(..), Suit(..), Value(..))
import StartApp.Simple exposing (start)

main = start
  { model = init Up (Value 5) Spades
  , update = update
  , view = view
  }

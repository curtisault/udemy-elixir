defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

    @doc """
        Returns a list of strings representing a deck of playing cards
    """
    def create_deck do
      values = ["Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Jack","Queen","King"]
      suits = ["Spades","Clubs","Hearts","Diamonds"]

      for suit <- suits, value <- values do
        "#{value} of #{suit}"
      end
    end

    @doc """
        This will shuffle the deck.
    """
    def shuffle(deck) do
      Enum.shuffle(deck)
    end

    @doc """
        Determines whether a deck contains a given card

    ## Exapmles

        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "Ace of Spades")
        true
    """
    def contains?(deck, card) do
      Enum.member?(deck, card)
    end

    @doc """
        Divides a deck into a hand and the remainder of the deck.
        The 'hand_size' argument indicates how many cards should
        be in the hand.

    ## Examples

        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]

    """
    def deal(deck, hand_size) do
      Enum.split(deck, hand_size)
    end

    @doc """
        This will save a file to the system.
    """
    def save(deck, file_name) do
      binary = :erlang.term_to_binary(deck)
      File.write(file_name, binary)
    end


    @doc """
        This will load a file from the system.
    """
    def load(file_name) do

      case File.read(file_name) do
        {:ok, binary} -> :erlang.binary_to_term binary
        {:error, _reason}  -> "That file does not exist"
      end

    end

    @doc """
        Returns a hand of cards for the player
    """
    def create_hand(hand_size) do

      Cards.create_deck
      |> Cards.shuffle
      |> Cards.deal(hand_size)

    end

end

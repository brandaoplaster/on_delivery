defmodule OnDelivery.Ordes.Item do
  @categories [:pizza, :humburger, :japonesa, :carne]
  @key [:description, :category, :unity_price, :quantity]

  @enforce_keys @key

  defstruct @key

  def build(description, category, unity_price, quantity)
      when quantity > 0 and category in @categories do
    {:ok,
     %__MODULE__{
       description: description,
       category: category,
       unity_price: unity_price,
       quantity: quantity
     }}
  end

  def build(_description, _category, _unity_price, _quantity) do
    {:error, "Invalid parameters"}
  end
end

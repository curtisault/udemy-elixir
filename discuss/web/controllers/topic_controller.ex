defmodule Discuss.TopicController do
  use Discuss.Web, :controller
  alias Discuss.Topic

  def new(conn, params) do
#
#    IO.puts "/////////////////////////////"
#    IO.inspect conn
#    IO.puts "/////////////////////////////"
#    IO.inspect params
#    IO.puts "/////////////////////////////"
#
    changeset =  Topic.changeset(%Topic{}, %{})

    render conn, "new.html"
  end

end
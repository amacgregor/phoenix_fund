defmodule PhoenixFundWeb.AuctionLive do
  use PhoenixFundWeb, :live_view

  @topic "auction"

  def mount(params, session, socket) do
    PhoenixFundWeb.Endpoint.subscribe(@topic)
    {:ok, assign(socket, :raised, 0)}
  end

  def render(assigns) do
    ~L"""
    	  <h1>Cabinet of Curiosities</h1>
    	  <div id="auction">
          <div class="meter">
            <span style="width: <%= @raised %>%">
              $<%= @raised %> USD
            </span>
          </div>
          <button phx-click="donate-1"> $1 </button>
          <button phx-click="donate-5"> $5 </button>
          <button phx-click="donate-10"> $10 </button>
          <button phx-click="donate-100"> $100 </button>

        </div>
    """
  end

  def handle_info(%{topic: @topic, payload: raised}, socket) do
    {:noreply, assign(socket, :raised, raised)}
  end

  def handle_event("donate-1", _, socket) do
    raised = socket.assigns.raised + 1
    PhoenixFundWeb.Endpoint.broadcast_from(self(), @topic, "donate_event", raised)
    {:noreply, assign(socket, :raised, raised)}
  end

  def handle_event("donate-5", _, socket) do
    raised = socket.assigns.raised + 5
    PhoenixFundWeb.Endpoint.broadcast_from(self(), @topic, "donate_event", raised)
    {:noreply, assign(socket, :raised, raised)}
  end

  def handle_event("donate-10", _, socket) do
    raised = socket.assigns.raised + 10
    PhoenixFundWeb.Endpoint.broadcast_from(self(), @topic, "donate_event", raised)
    {:noreply, assign(socket, :raised, raised)}
  end

  def handle_event("donate-100", _, socket) do
    raised = socket.assigns.raised + 100
    PhoenixFundWeb.Endpoint.broadcast_from(self(), @topic, "donate_event", raised)
    {:noreply, assign(socket, :raised, raised)}
  end

end
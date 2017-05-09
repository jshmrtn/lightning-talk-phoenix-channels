defmodule PhoenixExample.GameChannel do
  use Phoenix.Channel

  alias PhoenixExample.QuestionStorage
  alias Phoenix.Socket

  @question_count 3

  def join("game", _message, socket) do
    socket = socket
    |> assign(:state, :idle)
    |> assign(:remaining_questions, @question_count)

    {:ok, socket}
  end

  def handle_in("ask", _, socket = %Socket{assigns: %{state: :idle}}) do
    question = QuestionStorage.get_question()

    timer = Process.send_after(self(), :timeout, 10_000)

    socket = socket
    |> assign(:timer, timer)
    |> assign(:state, {:question, question})

    {:reply, {:ok, question}, socket}
  end

  def handle_in("answer", answer, socket =
    %Socket{assigns: %{state: {:question, question}, remaining_questions: remaining_questions, timer: timer}})
    when remaining_questions > 1 do

    :timer.cancel(timer)

    socket = socket
    |> assign(:state, :idle)
    |> assign(:remaining_questions, remaining_questions - 1)

    {:reply, {:ok, %{correct: QuestionStorage.correct?(question, answer)}}, socket}
  end

  def handle_in("answer", answer, socket = %Socket{assigns: %{state: {:question, question}, timer: timer}}) do

    :timer.cancel(timer)

    socket = socket
    |> assign(:state, :quit)
    |> assign(:remaining_questions, 0)

    {:reply, {:ok, %{correct: QuestionStorage.correct?(question, answer)}}, socket}
  end

  def handle_info(:timeout, socket = %Socket{assigns: %{state: {:question, _}}}) do
    push socket, "timeout", %{}
    {:noreply, socket}
  end
end

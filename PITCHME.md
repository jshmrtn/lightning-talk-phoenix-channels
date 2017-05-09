#### Websockets using Phoenix Channels
> Maintaining State in a functional Environment

---

#### Monad

 > A monad is an endofunctor (a functor mapping a category to itself), together with two natural transformations. Monads are used in the theory of pairs of adjoint functors, and they generalize closure operators on partially ordered sets to arbitrary categories.

https://en.wikipedia.org/wiki/Monad_(category_theory)

---

#### Talk Contents

* Monads are not part of this talk
* Quiz Game in Phoenix Channels
* Functional Paradigm
* Phoenix Framework
* Elixir
* Maintaining State
   - Bare Example
   - Phoenix Channel Example

---

#### Phoenix Framework

* Modern Web Framework
* API / Websites
* Channels (Websocket / Long Poll)
* Built on Elixir

---

#### Elixir

* Built on top of Erlang
* Concurrent
* Pattern Matching
* Immutable Data
* No side effects
* Actor Model (Message Passing)

---

#### Maintaining State

* Tail Recursive Loop
* Wait for Message

+++

#### Bare Example

* `receive do ... end` - Waiting for a Message
* `send pid, message` - Send a message

> Demo & Code

+++

#### Phoenix Example

* Abstraction
  - Transport
    * Websocket
    * Long Poll
  - Recursion (via `GenServer`)
  - Messaging via Callbacks
* Built with `Phoenix.Channel`

> Demo & Code

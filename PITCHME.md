#### Websockets using Phoenix Channels
> Maintaining State in a functional Environment

---

#### `whoami`
#### Jonatan (Jony) Männchen - Partner @ JOSHMARTIN

* (mostly) Backend Engineer
* PHP, Elixir, JS
* Symfony, Phoenix

<img src="https://s3.amazonaws.com/media-p.slid.es/uploads/team-955/images/2811693/twitter.svg" width="50" style="margin: 0; background: none; box-shadow: none; border: none;" />
@maennchen_

<img src="https://s3.amazonaws.com/media-p.slid.es/uploads/team-955/images/2811694/github.svg" width="50" style="margin: 0; background: none; box-shadow: none; border: none;" />
@maennchen

---

#### Monad

 > A monad is an endofunctor (a functor mapping a category to itself), together with two natural transformations. Monads are used in the theory of pairs of adjoint functors, and they generalize closure operators on partially ordered sets to arbitrary categories.

https://en.wikipedia.org/wiki/Monad_(category_theory)

---

![Confused](https://media.giphy.com/media/3o7btPCcdNniyf0ArS/giphy.gif)

* Monads are not part of this talk

---

#### Talk Contents

* Quiz Game in Phoenix Channels
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

* Only an Example via REPL, no actual socket
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

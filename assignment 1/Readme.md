**Question 3: A Stroll in the Dark Forest**
[Dark Forest](https://zkga.me/) is one of the first crypto-native games in which players are given [incomplete information](https://www.wikiwand.com/en/Complete_information). Players are set to explore the space and collect resources, while keeping their location hidden, which is made possible through the use of zero-knowledge proofs.

In the upcoming assignments, we will, by developing one key building block at a time, make an end-to-end, minimal variation of the game under the command line interface, and discuss possible variations on the game and the underlying algorithms to make it more fun, engaging, and balanced.

Please reading this material:

[Announcing Dark Forest](https://blog.zkga.me/announcing-darkforest)

[Zero-Knowledge Proofs for Engineers: Introduction](https://blog.zkga.me/intro-to-zksnarks)

[ZKPs for Engineers: A look at the Dark Forest ZKPs](https://blog.zkga.me/df-init-circuit)

[The Strongest Crypto Gaming Thesis](https://gubsheep.substack.com/p/the-strongest-crypto-gaming-thesis)

**Ready player one**

First, we need to define the spawning logic for players. Spawning a player can be as simple as picking a coordinate locally according to some basic rules, and submitting the hash of the coordinates along with a proof that the rules are complied with to the blockchain.

To do this, you need three things:

A smart contract on the blockchain that maintains the state of the game, accepts the spawning events, and verifies the spawning proof.
A program (in circom) that runs locally which picks the coordinates, checks the rules, and computes the coordinates hash and the zk proofs for submission.
A basic user interface and controller that connect between (1) and (2) and enable the user to perform some action (i.e. spawn) and inform the state and recent events of the game. The interface can be as simple as terminal input / output.
This sounds like a lot of work! But don’t worry, you don’t have to do it from scratch. You can start with the circuit code from “the init circuit” section in the blog in reading material (2).

For simplicity, let’s define the following rules for spawning coordinate (x,y) where x and y are both positive integers:

1) It has to be within a Euclidean distance of 64 to the origin (0, 0)

2) Its Euclidean distance to the origin (0,0) has to be more than 32.

3) 💫 GCD(x,y) must be greater than 1 and must not be a prime number.💫 

4) It cannot be a position where other players have spawned within the last 5 minutes

5) It cannot be a position currently occupied by another player.

For submission, please implement the code for (1)-(3) and deploy your custom “Dark Forest” (spawning only edition) to a local blockchain, such as Ganache (or Harmony Ganache). Spawn a few players.

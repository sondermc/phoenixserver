# [Phoenix server](https://martinfowler.com/bliki/PhoenixServer.html)
As consultant I get confronted with OTAP way of working day-by-day with lots of manual interventions. Why do companies like this way of working so much while there are so much very good tools and practices around? mostly the tools are available, but the practices have not been evoluted in about 20 years. We so much like our [snowflake servers](https://martinfowler.com/bliki/SnowflakeServer.html) way of working! 

So I liked to deliver a simple way of testing code managed by a [Phoenix server](https://martinfowler.com/bliki/PhoenixServer.html). 

The project is based on podman and with little adjustments it runs fine on docker. The Phoenix server is based on Ansible and I have plans to add puppet to this project. 

One surprisingly recognizable read is [https://infrastructure-as-code.com/book/2021/11/19/snowflakes-as-code.html](https://infrastructure-as-code.com/book/2021/11/19/snowflakes-as-code.html)

# Credits
For expressing in clear understanding why manual interventions on machinary is a disasterous idea, I'd like to offer my special thanks to:
  - Martin Fowler
  - Kief Morris

# Start
| Step | Decription | windows (docker desktop) | linux (podman) |
|:---: | :--- | :---: | :---: |
|1 | Generate a keypair to make use of ssh as transport | [keypair](docs/keypair-docker-windows.md) | - |
|2 | Create and start 'snowflakes' | [snowflakes](docs/snowflakes-docker-windows.md) | ```make debian11``` or ```make centos8```  |
|3 | Create and start 'phoenixserver' | [phoenixserver](docs/phoenixserver-docker-windows.md) | (copy paste the alias command printed as last line of previous step) ; ```phoenixproject``` |

 When started, you can make use of arrow up/down to see example commands

# Keypair
To enable secure transport from the phoenixserver to te snowflakes I make use of a fresh pki keypair. 

> **WARNING** 
>
> The practices in this manual are for TESTING reasons only and should never be adopted to any serious snowflake.
> 
> I will not take responsibility in whatever kind of breach you introduced in your environment whilst using this procedure. 
> 
> Be warned.
> 
> If you don't know what I mean, stop using this repo. 
> 
> **end WARNING**

# create keypair
```bash
ssh-keygen -f ./phoenixserver/alpine/phoenix_keypair-rsa -t rsa -b 4096 -P ''
cp ./phoenixserver/alpine/phoenix_keypair-rsa.pub ./snowflakes/centos/
```



# random-curl-user-agent
Makes curl's user agent to random.

**IMPORTANT INFORMATION** : This just make curl's user agent to random, that's it. this means this can't make you to private or anonymous.



## Usage:
 rcu [...options] [url]


 ### Options:
 - --better-random-logic, -B: Make rcu's random useragent logic to hard.
 - --out-when-error, -O: Return 'false' when error occurred. this can be used in the error catch logc.
 - --custom-user-agent, -C [user-agent]: Add you'r custom user-agent in curl. that will used after as random!
 - --use-custom-user-agent, -U [user-agent]: Make RCU will choice the custom user agent of the this arguemnt!
## Help!
1. **Required library?**
 > Nothing, just need a curl and dependencies of that!

2. **I can't use a RCU (random-curl-user-agent)**
 > You must be use the fish shell and need curl to use a RCU

3. **How can i use a RCU?**
  > - Import using '.' or source
>   ```fish
>   . rcu.fish # this or
>   source rcu.fish # this!
>   ```
  > ...Or register on functions!
> - 1. Open fish shell's function folder (Basically, locationed in /home/[UserName]/.config/fish/functions/)
> - 2. Cut and paste rcu.fish to fish shell's function folder. then, use in you'r script like:
>    ```fish
>    rcu [...]
>    ```

4. **I found a bug!**
  > Please report the that bug in issues tab. thanks!

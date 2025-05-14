# !/usr/bin/env fish

# Hi OwO~
# Are u found a bug? please reportthe that bug in github issues tab! thanks!!
# Thx!!

function rcu
    argparse \
        B/better-random-logic \
        O/out-when-error \
        C/custom-user-agent= \
        U/use-custom-user-agent= \
        -- $argv

    set -g hard_mode 0
    set -g return_false_err 0

    if set -q _flag_B
        set -g hard_mode 1
    end
    if set -q _flag_O
        set -g return_false_err 1
    end
    if set -q _flag_C
       echo "Use custom-user-agent: $_flag_C"
       set -g default_user_agents $default_user_agents $_flag_C
    end

    if set -q _flag_U
       echo "Use custom-user-agent only. Targetted: $_flag_U"
    end
    # Default user-agent
    set -g default_user_agents \
        "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:89.0) Gecko/20100101 Firefox/89.0" \
        "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36" \
        "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15"
    set -g back_user_agents \
        "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0" \
        "Mozilla/5.0 (Macintosh; Intel Mac OS X x.y; rv:42.0) Gecko/20100101 Firefox/42.0" \
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36" \
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36 OPR/38.0.2220.41" \
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 Edg/91.0.864.59" \
        "Mozilla/5.0 (iPhone; CPU iPhone OS 13_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Mobile/15E148 Safari/604.1"
    set -g back_bot_user_agents \
        "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" \
        "Mozilla/5.0 (compatible; YandexAccessibilityBot/3.0; +http://yandex.com/bots)"

    if test -z "$_flag_U"
       # Random user-agent
       set count (count $default_user_agents)
       set idx (random 1 $count)
       set -g random_ua_tmp $default_user_agents[$idx]
        if not test "$hard_mode" = 1
           set -g random_ua "$random_ua_tmp"
        else
           set count_2 (count $back_user_agents)
           set idx_2 (random 1 $count_2)
           set random_ua_tmp_2 $back_user_agents[$idx_2]

           set count_3 (count $back_bot_user_agents)
           set idx_3
           set random_ua_tmp_3 $back_bot_user_agents[$idx_3]

           set background "$random_ua_tmp" "$random_ua_tmp_2" "$random_ua_tmp_3"

           set input (count $background)
           set idx_4 (random 1 $input)
           set -g random_ua "$background[$idx_4]"
        end
    else
       set -g random_ua "$_flag_U"
    end

    # Get the url
    set url $argv[1]

    if test -z "$url"
        if test $return_false_err -eq 1
            echo false
            return 1
        else
            echo "FATAL _ RCU FAILED : no url given!"
            return 1
        end
    end

    #  curl call
    set req (curl -s -A "$random_ua" "$url")

    if test -z "$req"
        if test $return_false_err -eq 1
            echo false
            return 1
        else
            echo "FATAL _ RCU FAILED : unknown error."
            return 1
        end
    end

    # If it's fine
    echo "$req"
    return 0
end





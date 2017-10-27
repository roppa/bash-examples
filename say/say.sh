say "Ok, lets get started shall we?"

start

PS3='Enter y/n:'
options=("yes" "no")
select opt in "${options[@]}"
do
    case $opt in
        "yes")
            start=1
            break
            ;;
        "no")
            start=0
            break
            ;;
        "exit")
            exit
            ;;
        *)
            echo invalid option
            ;;
    esac
done

if [ $start -eq 1 ]; then
  say "Ok, so you're one of those then. Lets get started shall we?"
else
  say "Haha, you suck" && exit
fi

say "Hello Lyndsay, how do you feel today?"
read message
say "I'm happy to hear about your $message"

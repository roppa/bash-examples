environment=''
PS3='Select environment: '
options=("dev" "staging" "production" "exit")
select opt in "${options[@]}"
do
    case $opt in
        "dev")
            environment='dev'
            break
            ;;
        "staging")
            environment='staging'
            break
            ;;
        "production")
            environment='production'
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

echo $environment

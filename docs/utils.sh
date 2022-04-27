#!/bin/bash

NOTICE='>> During container monitoring, you can press「Control ^ + \」to leave the monitoring state \n'

serviceList="$(docker-compose ps --service)"
serviceArray=()

for value in ${serviceList[@]}; do
    serviceArray+=($value);
done



echoServiceListFunc(){
   echo 	
   echo "Service list:"
   len=${#serviceArray[@]}
   for ((i=0; i < len; i++)); do
      echo $i. ${serviceArray[$i]}
    done
}

selectServiceFunc(){
   echoServiceList
   echo "Your Service Number No:"
   while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

   return "${serviceArray[$service]}"
}


cat <<MENU

  > Utils _________________________________________________________
  1 | exec service
  2 | logs service
  3 | reload nginx service
  4 | re create all service
  5 | (update) + re create all service
  6 | (update) + re create one service


MENU
    echo "Your choose No:"
    read host
    case "$host" in
        1)
	    echoServiceListFunc
            read -p "Your choose servie no? "
            echo
	    if [ -z ${serviceArray[$REPLY]} ]
            then
               echo "Error, No Service"
            else
               docker-compose exec ${serviceArray[$REPLY]} sh
            fi
            ;;
        2)
	    echoServiceListFunc
            read -p "Your choose servie no? "
            echo
	    if [ -z ${serviceArray[$REPLY]} ]
            then
               echo "Error, No Service"
            else
               docker-compose logs -t -f --tail 5 ${serviceArray[$REPLY]}
            fi
            ;;
        3)
            docker-compose exec web-service nginx -s reload
            ;;
        4)
            docker-compose down
            echo ${NOTICE}
            docker-compose --compatibility up
            ;;
        5)
            docker-compose pull && docker-compose down
            echo ${NOTICE}
            docker-compose --compatibility up
            ;;
        6)
            echoServiceListFunc
	    read -p "Your choose servie no? "
	    echo 
	    if [ -z ${serviceArray[$REPLY]} ] 
	    then
               echo "Error, No Service"
            else
	       docker-compose pull ${serviceArray[$REPLY]}
               docker-compose up --force-recreate ${serviceArray[$REPLY]}

	    fi	    
            ;; 	    
        *)
            echo "Error, No Control"
            ;;
        esac


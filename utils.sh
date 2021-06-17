#!/bin/bash

NOTICE='\n>> During container monitoring, you can press \033[33m「Control ^ + \」\033[0m to leave the monitoring state \n'

cat <<MENU

  > Utils _________________________________________________________
  1 | exec container
  2 | logs container
  3 | reload nginx
  4 | restart container
  5 | (update) + restart container

MENU
    echo "Your choose No:"
    read host
    case "$host" in
        1)
            docker-compose exec web-service bash
            ;;
        2)
            docker-compose logs -f web-service
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
            docker-compose pull
            docker-compose down
            echo ${NOTICE}
            docker-compose --compatibility up
            ;;
        *)
            echo "Error, No Control"
            ;;
        esac


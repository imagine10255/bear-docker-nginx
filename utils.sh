#!/bin/bash

NOTICE='>> During container monitoring, you can press「Control ^ + \」to leave the monitoring state \n'

cat <<MENU

  > Utils _________________________________________________________
  1 | exec container
  2 | logs container
  3 | reload nginx
  4 | restart nginx container
  5 | restart all container
  6 | (update) + restart all container

MENU
    echo "Your choose No:"
    read host
    case "$host" in
        1)
            docker-compose exec web-service bash
            ;;
        2)
            docker-compose logs -t -f --tail 5 web-service
            ;;
        3)
            docker-compose exec web-service nginx -s reload
            ;;
        4)
            docker-compose restart web-service
            echo ${NOTICE}
            docker-compose logs -t -f --tail 5 web-service
            ;;
        5)
            docker-compose down
            echo ${NOTICE}
            docker-compose --compatibility up
            ;;
        6)
            docker-compose pull
            docker-compose down
            echo ${NOTICE}
            docker-compose --compatibility up
            ;;
        *)
            echo "Error, No Control"
            ;;
        esac


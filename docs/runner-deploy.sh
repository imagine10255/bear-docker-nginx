# -------------------------------------------------------------------
# DO NOT DELETE THIS FILE, THIS IS GITLAB RUNNER USE DEPLOY STAGES
# -------------------------------------------------------------------
SERVICE_NAME=$1

# update
docker-compose pull $SERVICE_NAME

# re create service
docker-compose up --force-recreate -d $SERVICE_NAME

echo .
echo "update ${SERVICE_NAME} done!"
